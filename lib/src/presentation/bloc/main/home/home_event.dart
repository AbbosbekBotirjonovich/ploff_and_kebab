part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object?> get props => [];
}

class GetMobileApp extends HomeEvent{
  
}

class GetCategoryEvent extends HomeEvent{
  
}