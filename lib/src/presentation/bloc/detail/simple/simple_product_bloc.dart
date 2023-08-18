import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ploff_and_kebab/src/data/models/detail/modifier_product_model.dart';
import 'package:ploff_and_kebab/src/data/models/detail/simple_product_model.dart';
import 'package:ploff_and_kebab/src/domain/repositories/detail/product_detail_repository.dart';

part 'simple_product_event.dart';

part 'simple_product_state.dart';

class SimpleProductBloc extends Bloc<SimpleProductEvent, SimpleProductState> {
  final ProductDetailRepository repository;

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
