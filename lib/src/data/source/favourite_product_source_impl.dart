import 'package:hive/hive.dart';
import 'package:ploff_and_kebab/src/data/source/favourite_product_source.dart';

import '../models/favourite/favourite_product_model.dart';

class FavouriteProductSourceImpl implements FavouriteProductSource {
  final Box<FavouriteProductModel> box;

  FavouriteProductSourceImpl({required this.box});

  @override
  List<FavouriteProductModel> getProducts() {
    return box.values.toList();
  }

  @override
  Future<void> addProduct(FavouriteProductModel product) async{
    await box.put(product.id ?? "id", product);
  }

  @override
  Future<void> deleteProduct(FavouriteProductModel product) async{
    await box.delete(product.id ?? "id");
  }

  @override
  Future<void> deleteAll() async{
    await box.clear();
  }
}
