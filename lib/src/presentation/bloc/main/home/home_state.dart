part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitialState extends HomeState {
  const HomeInitialState();

  @override
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState();

  @override
  List<Object?> get props => [];
}

class SuccessMobileAppState extends HomeState {
  final MobileAppModel mobile;

  const SuccessMobileAppState({required this.mobile});

  @override
  List<Object?> get props => [mobile];
}

class SuccessDataState extends HomeState {
  final CategoryProductModel product;
  final BannerModel banner;

  const SuccessDataState({required this.product, required this.banner});

  @override
  List<Object?> get props => [
        product,
        banner,
      ];
}

class SuccessSearchState extends HomeState {
  final ProductSearchModel searchProduct;

  const SuccessSearchState({required this.searchProduct});

  @override
  List<Object?> get props => [searchProduct];
}

class HomeErrorState extends HomeState {
  final String error;

  const HomeErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}
