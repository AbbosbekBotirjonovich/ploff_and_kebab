import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ploff_and_kebab/src/domain/repositories/detail/product_detail_repository.dart';

part 'modifier_product_event.dart';
part 'modifier_product_state.dart';

class ModifierProductBloc extends Bloc<ModifierProductEvent, ModifierProductState> {
  final ProductDetailRepository repository;
  ModifierProductBloc(this.repository) : super(ModifierProductInitial()) {
    on<ModifierProductEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
