import '../models/favourite/favourite_product_model.dart';

abstract class FavouriteProductSource{
  List<FavouriteProductModel> getProducts();
  Future<void> addProduct(FavouriteProductModel product);
  Future<void> deleteProduct(FavouriteProductModel product);
  Future<void> deleteAll();
}