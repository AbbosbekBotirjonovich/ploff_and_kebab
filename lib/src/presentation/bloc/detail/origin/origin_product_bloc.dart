import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ploff_and_kebab/src/data/models/detail/origin_product_model.dart';
import 'package:ploff_and_kebab/src/domain/repositories/detail/product_detail_repository.dart';

part 'origin_product_event.dart';

part 'origin_product_state.dart';

class OriginProductBloc extends Bloc<OriginProductEvent, OriginProductState> {
  final ProductDetailRepository repository;

  OriginProductBloc(this.repository) : super(OriginProductInitial()) {
    on<GetOriginProductEvent>(_getOriginProduct);
  }


  final ValueNotifier priceValue = ValueNotifier<int>(0);
  //
  // void setFavourite(FavouriteProductModel product){
  //   setFavouriteProduct(product: product);
  // }
  //
  // void setAmount(int amount) {
  //   amountPrice.value = amount;
  // }
  // int getAmount(){
  //   return amountPrice.value;
  // }
  //
  // int getSumPrice() {
  //   return priceValue.value * amountPrice.value;
  // }
  //
  // void addPrice(int value) {
  //   priceValue.value += value;
  // }
  //
  // void removePrice(int value) {
  //   if (priceValue.value > value) {
  //     priceValue.value -= value;
  //   }
  // }
  //
  // void setPrice(int price) {
  //   priceValue.value = price;
  // }
  //
  // int getPrice() {
  //   return priceValue.value;
  // }

  Future<void> _getOriginProduct(
      GetOriginProductEvent event, Emitter<OriginProductState> emit) async {
    final result = await repository.getOriginProduct(event.id);

    result.fold(
      (left) => emit(
        OriginProductError(
          error: left.toString(),
        ),
      ),
      (right) => emit(
        OriginProductSuccess(product: right),
      ),
    );
  }
}
