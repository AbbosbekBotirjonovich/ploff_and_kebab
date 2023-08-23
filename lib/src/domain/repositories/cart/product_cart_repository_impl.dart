import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ploff_and_kebab/src/config/router/app_routes.dart';
import 'package:ploff_and_kebab/src/core/either_dart/either.dart';
import 'package:ploff_and_kebab/src/core/platform/network_info.dart';
import 'package:ploff_and_kebab/src/data/models/favourite/favourite_product_model.dart';
import 'package:ploff_and_kebab/src/domain/network/failure.dart';

import 'product_cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final Dio dio;
  final NetworkInfo networkInfo;

  CartRepositoryImpl({required this.dio, required this.networkInfo});

}
