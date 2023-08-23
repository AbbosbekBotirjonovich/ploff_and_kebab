import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ploff_and_kebab/src/core/either_dart/either.dart';
import 'package:ploff_and_kebab/src/core/platform/network_info.dart';
import 'package:ploff_and_kebab/src/data/models/detail/combo_product_model.dart';
import 'package:ploff_and_kebab/src/data/models/detail/modifier_product_model.dart';
import 'package:ploff_and_kebab/src/data/models/detail/origin_product_model.dart';
import 'package:ploff_and_kebab/src/data/models/detail/simple_product_model.dart';
import 'package:ploff_and_kebab/src/domain/network/failure.dart';
import 'package:ploff_and_kebab/src/domain/network/server_error.dart';
import 'package:ploff_and_kebab/src/domain/repositories/detail/product_detail_repository.dart';

import '../../../core/constants/constants.dart';

class ProductDetailRepositoryImpl implements ProductDetailRepository {
  final Dio dio;
  final NetworkInfo networkInfo;

  ProductDetailRepositoryImpl({required this.dio, required this.networkInfo});

  @override
  Future<Either<Failure, ComboProductModel>> getComboProduct(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final Response response = await dio.get(
          "${Constants.baseUrl}${Urls.combo}/$id",
          options: Options(headers: {
            'Shipper': Constants.shipper,
          }),
        );
        return Right(ComboProductModel.fromJson(response.data));
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
  Future<Either<Failure, ModifierProductModel>> getModifierProduct(
      String id) async {
    if (await networkInfo.isConnected) {
      try {
        final Response response = await dio.get(
          Constants.baseUrl + Urls.modifier,
          options: Options(headers: {
            'Shipper': Constants.shipper,
          }),
          queryParameters: {
            'product_id': id,
          },
        );
        return Right(ModifierProductModel.fromJson(response.data));
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
  Future<Either<Failure, OriginProductModel>> getOriginProduct(
      String id) async {
    if (await networkInfo.isConnected) {
      try {
        final Response response = await dio.get(
          "${Constants.baseUrl}${Urls.simple}/$id",
          options: Options(headers: {
            'Shipper': Constants.shipper,
          }),
        );
        return Right(
          OriginProductModel.fromJson(response.data),
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
  Future<Either<Failure, SimpleProductModel>> getSimpleProduct(
      String id) async {
    if (await networkInfo.isConnected) {
      try {
        final Response response = await dio.get(
          "${Constants.baseUrl}${Urls.simple}/$id",
          options: Options(headers: {
            'Shipper': Constants.shipper,
          }),
        );
        return Right(
          SimpleProductModel.fromJson(response.data),
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
