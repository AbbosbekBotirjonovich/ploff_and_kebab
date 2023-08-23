import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:ploff_and_kebab/src/core/mixin/favourite_product_mixin.dart';
import 'package:ploff_and_kebab/src/domain/repositories/cart/product_cart_repository.dart';

import '../../../../data/models/favourite/favourite_product_model.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> with FavouriteProduct {
  final CartRepository repository;

  final orderPrice = ValueNotifier<int>(0);
  int _productPrice = 0;

  CartBloc(this.repository) : super(CartInitial()) {
    on<GetCartProductEvent>(_getCartProduct);
  }

  void setOrderPrice(int price){
    orderPrice.value = price;
  }

  void setProductPrice(int price,int value){
    _productPrice = price * value;
    orderPrice.value = _productPrice;
  }
  void addPrice(int price){
    orderPrice.value += price;
  }
  void removePrice(int price){
    orderPrice.value -= price;
  }

  int getProductPrice(){
    return _productPrice;
  }

  int getOrderPrice(){
    return orderPrice.value;
  }

  Future<void> _getCartProduct(
      GetCartProductEvent event, Emitter<CartState> emit) async {
    final result = getAllProducts();

    if (result.isNotEmpty) {
      emit(CartSuccess(product: result));
    } else {
      emit(const CartError());
    }
  }
}
