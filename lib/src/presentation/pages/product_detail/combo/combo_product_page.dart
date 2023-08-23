import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/core/extension/extension.dart';
import 'package:ploff_and_kebab/src/data/models/home/category_product_model.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/main/main_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/components/toast/show_toast.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/combo/components/combo_addcart_button.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/combo/components/combo_product_body.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/combo/mixin/combo_product_mixin.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/components/product_desc_widget.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/components/product_detail_initial_widget.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/components/product_sliver_app_bar.dart';

import '../../../../config/theme/app_color.dart';
import '../../../../data/models/favourite/favourite_product_model.dart';
import '../../../bloc/detail/combo/combo_product_bloc.dart';

class ComboProductPage extends StatefulWidget {
  const ComboProductPage({super.key, required this.product});

  final Product product;

  @override
  State<ComboProductPage> createState() => _ComboProductPageState();
}

class _ComboProductPageState extends State<ComboProductPage>
    with TickerProviderStateMixin, ComboProductMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cF5F5F5,
      body: BlocBuilder<ComboProductBloc, ComboProductState>(
        builder: (context, state) {
          if (state is ComboProductInitial) {
            return ProductDetailInitialWidget(product: widget.product);
          }
          if (state is ComboProductSuccess) {
            var products = state.product;
            return Stack(
              children: [
                CustomScrollView(
                  shrinkWrap: true,
                  primary: true,
                  slivers: [
                    ProductSliverAppBar(
                      imgUrl: widget.product.image,
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          ProductDescWidget(product: widget.product),
                          12.verticalSpace,
                          products.groups != null
                              ? ComboProductBody(products: products)
                              : const SizedBox(),
                          190.verticalSpace,
                        ],
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ValueListenableBuilder(
                      valueListenable: bloc.hasProduct,
                      builder: (context, count, _) {
                        return ComboAddCartButton(
                          price: bloc.getAmount() * widget.product.outPrice,
                          bloc: bloc,
                          callback: () {
                            if (bloc.hasProduct.value) {
                              context
                                  .read<MainBloc>()
                                  .add(const MainEventChanged(BottomMenu.cart));
                              Navigator.pop(context);
                            } else {
                              bloc.setFavourite(
                                FavouriteProductModel(
                                  id: widget.product.id,
                                  image: widget.product.image,
                                  title: FavouriteDescription(
                                    uz: widget.product.title.uz,
                                    ru: widget.product.title.ru,
                                    en: widget.product.title.en,
                                  ),
                                  description: FavouriteDescription(
                                    uz: widget.product.description.uz,
                                    ru: widget.product.description.ru,
                                    en: widget.product.description.en,
                                  ),
                                  price: bloc.getAmount() *
                                      widget.product.outPrice,
                                  outPrice: widget.product.outPrice,
                                  count: bloc.getAmount(),
                                ),
                              );
                              showStyleToast(
                                  context, context.tr('toast_title'));
                            }
                            context.read<MainBloc>().productCount.value =
                                bloc.getAllProducts().length;
                          },
                          currency: widget.product.currency.name,
                          title: bloc.hasProduct.value
                              ? context.tr('cart')
                              : context.tr('add_to_cart'),
                        );
                      }),
                )
              ],
            );
          }
          if (state is ComboProductError) {
            return Center(
              child: Text(state.error),
            );
          }
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
    );
  }
}
