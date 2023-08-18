import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/detail/simple/simple_product_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/simple/simple_product_page.dart';

import '../../../../../injector_container.dart';

mixin SimpleProductMixin on State<SimpleProductPage> {
  late final SimpleProductBloc bloc = context.read<SimpleProductBloc>();

  @override
  void initState() {
    if (widget.product.hasModifier) {
      bloc.add(GetSimpleWithModifierProductEvent(id: widget.product.id));
    } else {
      bloc.add(GetSimpleProductEvent(id: widget.product.id));
    }
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
