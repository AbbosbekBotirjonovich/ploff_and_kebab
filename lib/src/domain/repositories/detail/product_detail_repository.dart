import 'package:ploff_and_kebab/src/core/either_dart/either.dart';
import 'package:ploff_and_kebab/src/data/models/detail/combo_product_model.dart';
import 'package:ploff_and_kebab/src/data/models/detail/modifier_product_model.dart';
import 'package:ploff_and_kebab/src/data/models/detail/origin_product_model.dart';
import 'package:ploff_and_kebab/src/data/models/detail/simple_product_model.dart';
import 'package:ploff_and_kebab/src/domain/network/failure.dart';

abstract class ProductDetailRepository {

  Future<Either<Failure,SimpleProductModel>> getSimpleProduct(String id);
  Future<Either<Failure,OriginProductModel>> getOriginProduct(String id);
  Future<Either<Failure,ComboProductModel>> getComboProduct(String id);
  Future<Either<Failure,ModifierProductModel>> getModifierProduct(String id);

}