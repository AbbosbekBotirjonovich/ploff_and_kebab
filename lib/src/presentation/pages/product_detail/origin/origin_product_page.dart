import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/data/models/home/category_product_model.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/components/product_detail_initial_widget.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/components/product_sliver_app_bar.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/origin/mixin/origin_product_mixin.dart';

import '../../../bloc/detail/origin/origin_product_bloc.dart';
import 'components/origin_product_page_view.dart';

class OriginProductPage extends StatefulWidget {
  const OriginProductPage({super.key, required this.product});

  final Product product;

  @override
  State<OriginProductPage> createState() => _OriginProductPageState();
}

class _OriginProductPageState extends State<OriginProductPage>
    with TickerProviderStateMixin, OriginProductMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.cF5F5F5,
        body: BlocBuilder<OriginProductBloc, OriginProductState>(
          builder: (context, state) {
            if (state is OriginProductInitial) {
              return ProductDetailInitialWidget(product: widget.product);
            } else if (state is OriginProductSuccess) {
              var product = state.product;
              return OriginProductPageView(
                product: product,
                bloc: bloc,
              );
            } else {
              return const Center(
                child: Text("Error"),
              );
            }
          },
        ));
  }
}
