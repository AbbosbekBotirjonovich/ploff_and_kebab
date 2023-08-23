import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/core/extension/extension.dart';
import 'package:ploff_and_kebab/src/data/models/detail/simple_product_model.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/detail/simple/simple_product_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/main/cart/cart_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/components/extensions/number_format.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/components/product_desc_widget.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/components/product_sliver_app_bar.dart';

import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/my_text_style.dart';
import '../../../../../data/models/favourite/favourite_product_model.dart';
import '../../../../bloc/main/main_bloc.dart';
import '../../../../components/buttons/bouncing_button.dart';
import '../../../../components/toast/show_toast.dart';

class SimpleProductPageView extends StatelessWidget {
  const SimpleProductPageView(
      {super.key, required this.product, required this.bloc});

  final SimpleProductModel product;
  final SimpleProductBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc.addPrice(product.outPrice!);
    bloc.hasProductCheck(product.id!);
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            ProductSliverAppBar(
              imgUrl: product.image!,
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  ProductDescWidget(product: product),
                ],
              ),
            )
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: 170.h,
            color: AppColor.white,
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ValueListenableBuilder(
                    valueListenable: bloc.priceValue,
                    builder: (context, count, _) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 114.w,
                            height: 44.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border.all(
                                    color: AppColor.cEEEEEE, width: 1)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                BouncingButton(
                                  onPressed: () {
                                    if (bloc.getAmount() > 1) {
                                      --bloc.amountPrice.value;
                                      bloc.addPrice(1);
                                      bloc.removePrice(1);
                                    }
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    color: AppColor.black,
                                    size: 20,
                                  ),
                                ),
                                Text(
                                  "${bloc.getAmount()}",
                                  style: MyTextStyle.w500.copyWith(
                                    fontSize: 18.sp,
                                    color: AppColor.c141414,
                                  ),
                                ),
                                BouncingButton(
                                  onPressed: () {
                                    ++bloc.amountPrice.value;
                                    bloc.addPrice(1);
                                    bloc.removePrice(1);
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: AppColor.black,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "${NumberFormatExtension("${bloc.getSumPrice()}").formatWithThousandsSeparator()} ${product.currency}",
                            style: MyTextStyle.w600.copyWith(
                              color: AppColor.black,
                              fontSize: 18.sp,
                            ),
                          )
                        ],
                      );
                    }),
                SizedBox(
                  width: double.infinity,
                  height: 52.h,
                  child: ValueListenableBuilder(
                    valueListenable: bloc.hasProduct,
                    builder: (context, count, _) {
                      return ElevatedButton(
                        onPressed: () {
                          if (bloc.hasProduct.value) {
                            context
                                .read<MainBloc>()
                                .add(const MainEventChanged(BottomMenu.cart));
                            Navigator.pop(context);
                          } else {
                            bloc.setFavourite(
                              FavouriteProductModel(
                                id: product.id,
                                image: product.image,
                                title: FavouriteDescription(
                                  uz: product.title?.uz,
                                  ru: product.title?.ru,
                                  en: product.title?.en,
                                ),
                                description: FavouriteDescription(
                                  uz: product.description?.uz,
                                  ru: product.description?.ru,
                                  en: product.description?.en,
                                ),
                                price: bloc.getSumPrice(),
                                outPrice: product.outPrice,
                                count: bloc.getAmount(),
                              ),
                            );
                            showStyleToast(context, context.tr('toast_title'));
                          }
                          context.read<MainBloc>().productCount.value =
                              bloc.getAllProducts().length;
                        },
                        child: Text(
                          bloc.hasProduct.value
                              ? context.tr('cart')
                              : context.tr('add_to_cart'),
                          style: MyTextStyle.w600.copyWith(
                            color: AppColor.black,
                            fontSize: 16.sp,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
