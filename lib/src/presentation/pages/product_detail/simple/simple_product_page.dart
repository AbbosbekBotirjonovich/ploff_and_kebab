import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/data/models/home/category_product_model.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/detail/simple/simple_product_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/simple/components/simple_product_page_view.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/simple/components/simple_with_modifier_page.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/simple/mixin/simple_product_mixin.dart';

class SimpleProductPage extends StatefulWidget {
  const SimpleProductPage({super.key, required this.product});

  final Product product;

  @override
  State<SimpleProductPage> createState() => _SimpleProductPageState();
}

class _SimpleProductPageState extends State<SimpleProductPage>
    with TickerProviderStateMixin, SimpleProductMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cF5F5F5,
      body: BlocBuilder<SimpleProductBloc, SimpleProductState>(
        builder: (context, state) {
          if (state is SimpleProductInitial) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          else if (state is SimpleProductSuccess) {
            var product = state.product;
            return SimpleProductPageView(
              product: product,
            );
          }
          else if (state is SimpleWithModifierProductSuccess) {
            var product = state.product;
            var modifier = state.modifier;
            return SimpleWithModifierPage(product: product, modifier: modifier);
          }
          else {
            return const Center(
              child: Text("Error"),
            );
          }
        },
      ),
    );
  }
}
