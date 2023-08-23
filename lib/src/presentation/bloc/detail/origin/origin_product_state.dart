part of 'origin_product_bloc.dart';

abstract class OriginProductState extends Equatable {
  const OriginProductState();
}

class OriginProductInitial extends OriginProductState {
  @override
  List<Object> get props => [];
}

class OriginProductSuccess extends OriginProductState {
  final OriginProductModel product;

  const OriginProductSuccess({required this.product});

  @override
  List<Object?> get props => [product];
}

class OriginProductError extends OriginProductState{

  final String error;
  const OriginProductError({required this.error});
  @override
  List<Object?> get props => [error];

}
