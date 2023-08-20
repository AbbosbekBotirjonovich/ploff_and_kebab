import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/detail/combo/combo_product_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/combo/combo_product_page.dart';

mixin ComboProductMixin on State<ComboProductPage>{
  late ComboProductBloc bloc = context.read<ComboProductBloc>();
  @override
  void initState() {
    super.initState();
  }
}