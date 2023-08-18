import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ploff_and_kebab/src/domain/repositories/detail/product_detail_repository.dart';

part 'origin_product_event.dart';
part 'origin_product_state.dart';

class OriginProductBloc extends Bloc<OriginProductEvent, OriginProductState> {
  final ProductDetailRepository repository;
  OriginProductBloc(this.repository) : super(OriginProductInitial()) {
    on<OriginProductEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
