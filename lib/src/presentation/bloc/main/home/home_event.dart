part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class GetMobileApp extends HomeEvent {}

class GetCategoryEvent extends HomeEvent {}

class GetSearchEvent extends HomeEvent {
  final String productName;

  const GetSearchEvent({required this.productName});

  @override
  List<Object?> get props => [productName];
}

class GetClearSearchData extends HomeEvent {}

class GetUpdateCategoryProductEvent extends HomeEvent {
  final bool isActive;
  final Category category;

  const GetUpdateCategoryProductEvent(
      {required this.isActive, required this.category});

  @override
  List<Object?> get props => [isActive, category];
}
