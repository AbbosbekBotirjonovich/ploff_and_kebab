import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_and_kebab/src/data/models/home/category_product_model.dart';

import '../../../../data/models/home/banner.dart';
import '../../../../data/models/home/mobile_app_model.dart';
import '../../../../domain/repositories/home/home_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;

  HomeBloc(this.repository) : super(const HomeInitialState()) {
    on<GetMobileApp>(_getMobileApp);
    on<GetBanner>(_getBanner);
    on<GetCategoryEvent>(_getCategory);
  }

  Future<void> _getMobileApp(
      GetMobileApp event, Emitter<HomeState> emit) async {
    emit(const HomeLoadingState());

    final result = await repository.getMobile();

    result.fold(
      (l) => emit(HomeErrorState(error: l.toString())),
      (r) => emit(
        SuccessMobileAppState(mobile: r),
      ),
    );
  }

  Future<void> _getBanner(GetBanner event, Emitter<HomeState> emit) async {
    final result = await repository.getBanner();

    result.fold(
      (left) => emit(
        HomeErrorState(error: left.toString()),
      ),
      (right) => emit(
        SuccessBannerState(banner: right),
      ),
    );
  }

  Future<void> _getCategory(
      GetCategoryEvent event, Emitter<HomeState> emit) async {
    final result = await repository.getCategory();
    if (result.isLeft) {
      emit(
        HomeErrorState(
          error: result.left.toString(),
        ),
      );
    } else {
      emit(
        SuccessCategoryProduct(product: result.right),
      );
    }
  }
}
