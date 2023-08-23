import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ploff_and_kebab/src/core/mixin/favourite_product_mixin.dart';
import 'package:ploff_and_kebab/src/data/models/detail/combo_product_model.dart';
import 'package:ploff_and_kebab/src/domain/repositories/detail/product_detail_repository.dart';

import '../../../../data/models/favourite/favourite_product_model.dart';

part 'combo_product_event.dart';

part 'combo_product_state.dart';

class ComboProductBloc extends Bloc<ComboProductEvent, ComboProductState>
    with FavouriteProduct {
  final ProductDetailRepository repository;

  ComboProductBloc(this.repository) : super(ComboProductInitial()) {
    on<GetComboProductEvent>(_getComboProduct);
  }

  final ValueNotifier amountPrice = ValueNotifier<int>(1);

  final ValueNotifier hasProduct = ValueNotifier<bool>(false);

  void setFavourite(FavouriteProductModel product) {
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

  int getAmount() {
    return amountPrice.value;
  }

  Future<void> _getComboProduct(
      GetComboProductEvent event, Emitter<ComboProductState> emit) async {
    final result = await repository.getComboProduct(event.id);
    result.fold(
      (left) => emit(
        ComboProductError(
          error: left.toString(),
        ),
      ),
      (right) => emit(
        ComboProductSuccess(product: right),
      ),
    );
  }
}
