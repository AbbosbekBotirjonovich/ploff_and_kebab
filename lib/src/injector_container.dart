import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_retry_plus/dio_retry_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ploff_and_kebab/src/config/router/app_routes.dart';
import 'package:ploff_and_kebab/src/data/models/favourite/favourite_product_model.dart';
import 'package:ploff_and_kebab/src/data/source/favourite_product_source.dart';
import 'package:ploff_and_kebab/src/data/source/favourite_product_source_impl.dart';
import 'package:ploff_and_kebab/src/data/source/local_source.dart';
import 'package:ploff_and_kebab/src/domain/repositories/auth/auth_repository.dart';
import 'package:ploff_and_kebab/src/domain/repositories/cart/product_cart_repository.dart';
import 'package:ploff_and_kebab/src/domain/repositories/cart/product_cart_repository_impl.dart';
import 'package:ploff_and_kebab/src/domain/repositories/detail/product_detail_repository.dart';
import 'package:ploff_and_kebab/src/domain/repositories/detail/product_detail_repository_impl.dart';
import 'package:ploff_and_kebab/src/domain/repositories/home/home_repository.dart';
import 'package:ploff_and_kebab/src/domain/repositories/home/home_repository_impl.dart';
import 'package:ploff_and_kebab/src/domain/repositories/register/register_repository.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/auth/register/register_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/detail/combo/combo_product_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/detail/simple/simple_product_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/main/cart/cart_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/main/main_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/splash/splash_bloc.dart';

import 'core/constants/constants.dart';
import 'core/platform/network_info.dart';
import 'presentation/bloc/auth/confirm/confirm_code_bloc.dart';
import 'presentation/bloc/detail/origin/origin_product_bloc.dart';
import 'presentation/bloc/main/home/home_bloc.dart';

final sl = GetIt.instance;
late Box<dynamic> _box;
late Box<FavouriteProductModel> _boxProduct;

Future<void> init() async {
  /// External
  await initHive();
  await initProductHive();

  sl.registerLazySingleton(
    () => Dio()
      ..options = BaseOptions(
        contentType: 'application/json',
        sendTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        connectTimeout: const Duration(seconds: 30),
        headers: {
          'Authorization': 'API-KEY',
          'X-API-KEY': Constants.apiKey,
          'Resource-Id': Constants.resourceId,
          'Environment-Id': Constants.environmentId,
        },
      )
      ..interceptors.addAll(
        [
          LogInterceptor(
            requestBody: kDebugMode,
            responseBody: kDebugMode,
            logPrint: (object) =>
                kDebugMode ? log('Dio Log: ${object.toString()}') : null,
          ),
          if (kDebugMode) chuck.getDioInterceptor(),
        ],
      ),
  );
  sl<Dio>().interceptors.add(
        RetryInterceptor(
          dio: sl<Dio>(),
          toNoInternetPageNavigator: () async => Navigator.pushNamed(
            rootNavigatorKey.currentContext!,
            Routes.internetConnection,
          ),
          accessTokenGetter: () => localSource.accessToken,
          refreshTokenFunction: () async {
            await localSource.userClear();
            // await Navigator.pushNamedAndRemoveUntil(
            //   rootNavigatorKey.currentContext!,
            //   Routes.initial,
            //   (route) => false,
            // );
          },
        ),
      );

  sl
    ..registerLazySingleton(InternetConnectionChecker.new)
    ..registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()))
    ..registerSingleton<LocalSource>(LocalSource(_box))
    ..registerSingleton<FavouriteProductSource>(
      FavouriteProductSourceImpl(box: _boxProduct),
    );

  /// main
  mainFeature();
  homeFeature();
  cartFeature();

  ///detail
  detailFeature();

  /// auth
  authFeature();

  registerFeature();
}

void mainFeature() {
  /// splash
  sl
    ..registerFactory(SplashBloc.new)
    ..registerLazySingleton(MainBloc.new);
}

void homeFeature() {
  sl
    ..registerFactory<HomeBloc>(() => HomeBloc(sl()))
    ..registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(
        dio: sl(),
        networkInfo: sl(),
      ),
    );
}

void cartFeature() {
  sl
    ..registerFactory<CartBloc>(() => CartBloc(sl()))
    ..registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(
        dio: sl(),
        networkInfo: sl(),
      ),
    );
}

void detailFeature() {
  sl
    ..registerFactory<SimpleProductBloc>(
      () => SimpleProductBloc(
        sl(),
      ),
    )
    ..registerLazySingleton<ProductDetailRepository>(
      () => ProductDetailRepositoryImpl(
        dio: sl(),
        networkInfo: sl(),
      ),
    );
  sl.registerFactory<OriginProductBloc>(
    () => OriginProductBloc(
      sl(),
    ),
  );
  sl.registerFactory<ComboProductBloc>(
    () => ComboProductBloc(
      sl(),
    ),
  );
}

void registerFeature() {
  sl
    ..registerFactory<RegisterBloc>(() => RegisterBloc(sl()))
    ..registerLazySingleton<RegisterUserRepository>(
      () => RegisterUserRepositoryImpl(
        dio: sl(),
        networkInfo: sl(),
      ),
    );
}

void authFeature() {
  sl
    ..registerFactory<AuthBloc>(() => AuthBloc(sl()))
    ..registerFactory<ConfirmCodeBloc>(() => ConfirmCodeBloc(sl()))
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        dio: sl(),
        networkInfo: sl(),
      ),
    );
}

Future<void> initHive() async {
  const boxName = 'ploff_and_kebab_box';
  final Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  _box = await Hive.openBox<dynamic>(boxName);
}

Future<void> initProductHive() async {
  const boxName = 'favourite_product_box';
  final Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(FavouriteProductModelAdapter());
  Hive.registerAdapter(FavouriteDescriptionAdapter());
  _boxProduct = await Hive.openBox<FavouriteProductModel>(boxName);
}
