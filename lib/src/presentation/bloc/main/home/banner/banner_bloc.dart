import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ploff_and_kebab/src/data/models/home/banner.dart';
import 'package:ploff_and_kebab/src/domain/repositories/home/home_repository.dart';

part 'banner_event.dart';

part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final HomeRepository repository;

  BannerBloc(this.repository) : super(BannerInitial()) {
    on<GetBanner>(_getBanner);
  }

  Future<void> _getBanner(GetBanner event, Emitter<BannerState> emit) async {
    final result = await repository.getBanner();

    result.fold(
      (left) => emit(
        BannerErrorState(error: left.toString()),
      ),
      (right) => emit(
        SuccessBannerState(banner: right),
      ),
    );
  }
}
