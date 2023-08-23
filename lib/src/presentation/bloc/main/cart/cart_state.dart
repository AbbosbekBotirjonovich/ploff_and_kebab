part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class CartInitial extends CartState {
  @override
  List<Object> get props => [];
}

class CartSuccess extends CartState {
  final List<FavouriteProductModel> product;

  const CartSuccess({required this.product});

  @override
  List<Object?> get props => [product];
}

class CartError extends CartState {
  const CartError();

  @override
  List<Object?> get props => [];
}
