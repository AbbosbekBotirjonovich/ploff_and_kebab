import 'package:ploff_and_kebab/src/core/either_dart/either.dart';
import 'package:ploff_and_kebab/src/data/models/home/banner.dart';
import 'package:ploff_and_kebab/src/data/models/home/category_product_model.dart';
import 'package:ploff_and_kebab/src/data/models/home/mobile_app_model.dart';
import 'package:ploff_and_kebab/src/data/models/home/product_search_model.dart';
import 'package:ploff_and_kebab/src/domain/network/failure.dart';


abstract class HomeRepository {
  Future<Either<Failure, MobileAppModel>> getMobile();
  Future<Either<Failure, BannerModel>> getBanner();
  Future<Either<Failure, CategoryProductModel>> getCategory();
  Future<Either<Failure, ProductSearchModel>> getProductSearch(String product);
}
