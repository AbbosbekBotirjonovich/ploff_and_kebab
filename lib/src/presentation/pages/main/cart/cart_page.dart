import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/pages/main/cart/components/cart_empty_page.dart';
import '../../../bloc/main/cart/cart_bloc.dart';
import 'components/cart_page_view.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    CartBloc bloc = context.read<CartBloc>();
    return Scaffold(
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartSuccess) {
            return CartPageView(
              products: state.product,
              bloc: bloc,
            );
          } else {
            return const CartEmptyPage();
          }
        },
      ),
    );
  }
}
