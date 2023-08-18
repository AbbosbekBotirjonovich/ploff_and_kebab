part of 'combo_product_bloc.dart';

abstract class ComboProductEvent extends Equatable {
  const ComboProductEvent();
}

class GetComboProductEvent extends ComboProductEvent {
  final String id;

  const GetComboProductEvent({required this.id});

  @override
  List<Object?> get props => [];
}
