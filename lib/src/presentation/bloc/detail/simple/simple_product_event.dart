part of 'simple_product_bloc.dart';

abstract class SimpleProductEvent extends Equatable {
  const SimpleProductEvent();
}

class GetSimpleProductEvent extends SimpleProductEvent {
  final String id;

  const GetSimpleProductEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class GetSimpleWithModifierProductEvent extends SimpleProductEvent {
  final String id;

  const GetSimpleWithModifierProductEvent({required this.id});

  @override
  List<Object?> get props => [id];
}
