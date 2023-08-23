part of 'origin_product_bloc.dart';

abstract class OriginProductEvent extends Equatable {
  const OriginProductEvent();
}

class GetOriginProductEvent extends OriginProductEvent {
  final String id;

  const GetOriginProductEvent({required this.id});

  @override
  List<Object?> get props => [id];
}
