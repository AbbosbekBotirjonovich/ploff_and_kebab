part of 'simple_product_bloc.dart';

abstract class SimpleProductState extends Equatable {
  const SimpleProductState();
}

class SimpleProductInitial extends SimpleProductState {
  @override
  List<Object> get props => [];
}

class SimpleProductSuccess extends SimpleProductState {
  final SimpleProductModel product;

  const SimpleProductSuccess({required this.product});

  @override
  List<Object?> get props => [product];
}

class SimpleWithModifierProductSuccess extends SimpleProductState {
  final ModifierProductModel modifier;
  final SimpleProductModel product;

  const SimpleWithModifierProductSuccess(
    this.modifier,
    this.product,
  );

  @override
  List<Object?> get props => [
        modifier,
        product,
      ];
}

class SimpleProductError extends SimpleProductState {
  final String error;

  const SimpleProductError({required this.error});

  @override
  List<Object?> get props => [error];
}
