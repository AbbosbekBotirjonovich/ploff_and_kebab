import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:ploff_and_kebab/src/core/mixin/favourite_product_mixin.dart';
import 'package:ploff_and_kebab/src/data/models/detail/modifier_product_model.dart';
import 'package:ploff_and_kebab/src/data/models/detail/simple_product_model.dart';
import 'package:ploff_and_kebab/src/data/models/favourite/favourite_product_model.dart';
import 'package:ploff_and_kebab/src/domain/repositories/detail/product_detail_repository.dart';

part 'simple_product_event.dart';

part 'simple_product_state.dart';

class SimpleProductBloc extends Bloc<SimpleProductEvent, SimpleProductState> with FavouriteProduct {
  final ProductDetailRepository repository;

  final ValueNotifier priceValue = ValueNotifier<int>(0);
  final ValueNotifier amountPrice = ValueNotifier<int>(1);
  final ValueNotifier hasProduct = ValueNotifier<bool>(false);

  void setFavourite(FavouriteProductModel product){
    addProduct(product: product);
    hasProduct.value = true;
  }

  void hasProductCheck(String id) {
    for (var value in getAllProducts()) {
      if(id == value.id){
        hasProduct.value = true;
        break;
      }else{
        hasProduct.value = false;
      }
    }
  }

  void setAmount(int amount) {
    amountPrice.value = amount;
  }
  int getAmount(){
    return amountPrice.value;
  }

  int getSumPrice() {
    return priceValue.value * amountPrice.value;
  }

  void addPrice(int value) {
    priceValue.value += value;
  }

  void removePrice(int value) {
    if (priceValue.value > value) {
      priceValue.value -= value;
    }
  }

  void setPrice(int price) {
    priceValue.value = price;
  }

  int getPrice() {
    return priceValue.value;
  }

  SimpleProductBloc(this.repository) : super(SimpleProductInitial()) {
    on<GetSimpleProductEvent>(_getSimpleProduct);
    on<GetSimpleWithModifierProductEvent>(_getSimpleWithModifierProduct);
  }

  Future<void> _getSimpleProduct(
      GetSimpleProductEvent event, Emitter<SimpleProductState> emit) async {
    final result = await repository.getSimpleProduct(event.id);

    result.fold(
      (left) => emit(
        SimpleProductError(
          error: left.toString(),
        ),
      ),
      (right) => emit(
        SimpleProductSuccess(product: right),
      ),
    );
  }

  Future<void> _getSimpleWithModifierProduct(
      GetSimpleWithModifierProductEvent event,
      Emitter<SimpleProductState> emit) async {
    final simpleProductResult = await repository.getSimpleProduct(event.id);
    final modifierProductResult = await repository.getModifierProduct(event.id);

    simpleProductResult.fold(
      (left) => emit(
        SimpleProductError(
          error: left.toString(),
        ),
      ),
      (right) {
        if (modifierProductResult.isRight) {
          emit(
            SimpleWithModifierProductSuccess(
                modifierProductResult.right, right),
          );
        } else {
          emit(
            SimpleProductError(
              error: simpleProductResult.left.toString(),
            ),
          );
        }
      },
    );
  }
}
