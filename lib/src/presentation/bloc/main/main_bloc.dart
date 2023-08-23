import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_and_kebab/src/core/mixin/favourite_product_mixin.dart';

part 'main_state.dart';

part 'main_event.dart';

class MainBloc extends Bloc<MainEvent, MainState> with FavouriteProduct{

  final productCount = ValueNotifier<int>(0);

  MainBloc() : super(const MainState()) {
    on<MainEventChanged>(_onChangeMenu);
  }

  void _onChangeMenu(MainEventChanged event, Emitter<MainState> emit) {
    emit(state.copyWith(bottomMenu: event.menu));
  }
}

enum BottomMenu {
  home,
  cart,
  orders,
  profile,
}
