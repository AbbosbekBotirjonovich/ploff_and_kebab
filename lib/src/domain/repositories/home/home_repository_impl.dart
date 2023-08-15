import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ploff_and_kebab/src/core/constants/app_keys.dart';
import 'package:ploff_and_kebab/src/core/constants/constants.dart';
import 'package:ploff_and_kebab/src/core/either_dart/either.dart';
import 'package:ploff_and_kebab/src/core/platform/network_info.dart';
import 'package:ploff_and_kebab/src/data/models/home/banner.dart';
import 'package:ploff_and_kebab/src/data/models/home/category_product_model.dart';
import 'package:ploff_and_kebab/src/data/models/home/mobile_app_model.dart';
import 'package:ploff_and_kebab/src/domain/network/failure.dart';
import 'package:ploff_and_kebab/src/domain/network/server_error.dart';
import 'package:ploff_and_kebab/src/domain/repositories/home/home_repository.dart';
import 'package:ploff_and_kebab/src/presentation/pages/main/home/widgets/category_with_products.dart';


class HomeRepositoryImpl implements HomeRepository {
  final Dio dio;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl({required this.dio, required this.networkInfo});

  @override
  Future<Either<Failure, MobileAppModel>> getMobile() async {
    if (await networkInfo.isConnected) {
      try {
        final Response response = await dio.get(
          Constants.baseUrl + Urls.mobileApp,
        );
        return Right(
          MobileAppModel.fromJson(response.data),
        );
      } on DioException catch (error, stacktrace) {
        log('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withDioError(error: error).failure,
        );
      } on Exception catch (error, stacktrace) {
        log('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withError(
            message: error.toString(),
          ).failure,
        );
      }
    } else {
      return const Left(ServerFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, BannerModel>> getBanner() async {
    if (await networkInfo.isConnected) {
      try {
        final Response response = await dio.get(
          Constants.baseUrl + Urls.banner,
          options: Options(headers: {
            'Shipper': AppKeys.shipper,
          }),
          queryParameters: {
            'page': 1,
            'limit': 100,
          },
        );
        return Right(
          BannerModel.fromJson(response.data),
        );
      } on DioException catch (error, stacktrace) {
        log('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withDioError(error: error).failure,
        );
      } on Exception catch (error, stacktrace) {
        log('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withError(message: error.toString()).failure,
        );
      }
    } else {
      return const Left(
        ServerFailure(message: 'No Internet Connection'),
      );
    }
  }

  @override
  Future<Either<Failure, CategoryProductModel>> getCategory() async{
    if (await networkInfo.isConnected) {
      try {
        final Response response = await dio.get(
          Constants.baseUrl + Urls.categoryWithProduct,
          options: Options(headers: {
            'Shipper': AppKeys.shipper,
          }),
          queryParameters: {
            'page': 1,
            'limit': 100,
          },
        );
        return Right(
          CategoryProductModel.fromJson(response.data),
        );
      } on DioException catch (error, stacktrace) {
        log('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withDioError(error: error).failure,
        );
      } on Exception catch (error, stacktrace) {
        log('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withError(message: error.toString()).failure,
        );
      }
    } else {
      return const Left(
        ServerFailure(message: 'No Internet Connection'),
      );
    }
  }
}
