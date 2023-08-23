
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/detail/origin/origin_product_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/origin/origin_product_page.dart';

mixin OriginProductMixin on State<OriginProductPage>{

  late final OriginProductBloc bloc;

  @override
  void initState() {
    bloc = context.read<OriginProductBloc>();
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

}