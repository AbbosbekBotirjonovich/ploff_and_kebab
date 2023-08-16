import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_and_kebab/src/data/models/home/banner.dart';
import 'package:ploff_and_kebab/src/data/models/home/category_product_model.dart';

import '../../../../data/models/home/mobile_app_model.dart';
import '../../../../domain/repositories/home/home_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;

  HomeBloc(this.repository) : super(const HomeInitialState()) {
    on<GetMobileApp>(_getMobileApp);
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

  Future<void> _getCategory(
      GetCategoryEvent event, Emitter<HomeState> emit) async {
    final resultCategory = await repository.getCategory();
    final resultBanner = await repository.getBanner();
    resultCategory.fold(
        (left) => emit(
              HomeErrorState(
                error: left.toString(),
              ),
            ),
        (right) => {
              if (resultBanner.isRight)
                {
                  emit(
                    SuccessDataState(
                        product: right, banner: resultBanner.right),
                  )
                }
              else
                {
                  emit(
                    HomeErrorState(
                      error: resultBanner.left.toString(),
                    ),
                  )
                }
            });
  }
}
