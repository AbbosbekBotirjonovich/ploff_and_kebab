part of 'combo_product_bloc.dart';

abstract class ComboProductState extends Equatable {
  const ComboProductState();
}

class ComboProductInitial extends ComboProductState {
  @override
  List<Object> get props => [];
}

class ComboProductSuccess extends ComboProductState {
  final ComboProductModel product;
  const ComboProductSuccess({required this.product});
  @override
  List<Object?> get props => [];
}

class ComboProductError extends ComboProductState{
  final String error;
  const ComboProductError({required this.error});
  @override
  List<Object?> get props => [];
}
