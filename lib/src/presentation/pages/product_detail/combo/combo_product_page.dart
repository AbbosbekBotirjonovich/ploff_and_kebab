import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';
import 'package:ploff_and_kebab/src/data/models/home/category_product_model.dart';
import 'package:ploff_and_kebab/src/presentation/components/buttons/bouncing_button.dart';
import 'package:ploff_and_kebab/src/presentation/components/extensions/number_format.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/combo/components/combo_product_body.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/combo/mixin/combo_product_mixin.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/components/product_desc_widget.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/components/product_sliver_app_bar.dart';

import '../../../../config/theme/app_color.dart';
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
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
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
                      imgUrl: widget.product.image!,
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
                  child: Container(
                    width: double.infinity,
                    height: 170.h,
                    color: AppColor.white,
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ValueListenableBuilder(
                            valueListenable: bloc.amountPrice,
                            builder: (context, count, _) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 114.w,
                                    height: 44.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        border: Border.all(
                                            color: AppColor.cEEEEEE, width: 1)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        BouncingButton(
                                          onPressed: () {
                                            if (bloc.getAmount() > 1) {
                                              --bloc.amountPrice.value;
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
                                    NumberFormatExtension(
                                            "${bloc.getAmount() * widget.product.outPrice!}")
                                        .formatWithThousandsSeparator(),
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
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Добавить в корзину",
                              style: MyTextStyle.w600.copyWith(
                                color: AppColor.black,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
