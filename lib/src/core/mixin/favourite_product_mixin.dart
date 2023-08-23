import 'package:ploff_and_kebab/src/config/router/app_routes.dart';

import '../../data/models/favourite/favourite_product_model.dart';

mixin FavouriteProduct {
  Future<void> addProduct({required FavouriteProductModel product}) async {
    await productSource.addProduct(product);
  }

  List<FavouriteProductModel> getAllProducts() {
    return productSource.getProducts();
  }

  Future<void> deleteProduct({required FavouriteProductModel product}) async {
    await productSource.deleteProduct(product);
  }

  Future<void> deleteAll() async {
    await productSource.deleteAll();
  }
}
