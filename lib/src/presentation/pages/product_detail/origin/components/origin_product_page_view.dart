import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';
import 'package:ploff_and_kebab/src/core/extension/extension.dart';
import 'package:ploff_and_kebab/src/data/models/detail/origin_product_model.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/detail/origin/origin_product_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/components/extensions/number_format.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/origin/components/origin_product_body.dart';

import '../../../../../config/theme/app_color.dart';
import '../../../../components/buttons/bouncing_button.dart';
import '../../components/product_desc_widget.dart';
import '../../components/product_sliver_app_bar.dart';

class OriginProductPageView extends StatelessWidget {
  const OriginProductPageView(
      {super.key, required this.product, required this.bloc});

  final OriginProductModel product;
  final OriginProductBloc bloc;

  @override
  Widget build(BuildContext context) {
    // bloc.addPrice(product.outPrice!);
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
                  12.verticalSpace,
                  OriginProductBody(product: product),
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
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ValueListenableBuilder(
                    valueListenable: bloc.priceValue,
                    builder: (context, count, _) {
                      return product.count == "0"
                          ? Text(
                              context.tr('empty_product'),
                              style: MyTextStyle.w600.copyWith(
                                  color: AppColor.cF30404, fontSize: 18.sp),
                            )
                          : Row(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      BouncingButton(
                                        onPressed: () {
                                          // if (bloc.getAmount() > 1) {
                                          //   --bloc.amountPrice.value;
                                          //   bloc.addPrice(1);
                                          //   bloc.removePrice(1);
                                          // }
                                        },
                                        child: const Icon(
                                          Icons.remove,
                                          color: AppColor.black,
                                          size: 20,
                                        ),
                                      ),
                                      // Text(
                                      // "${bloc.getAmount()}",
                                      // style: MyTextStyle.w500.copyWith(
                                      //   fontSize: 18.sp,
                                      //   color: AppColor.c141414,
                                      // ),
                                      // ),
                                      BouncingButton(
                                        onPressed: () {
                                          // ++bloc.amountPrice.value;
                                          // bloc.addPrice(1);
                                          // bloc.removePrice(1);
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
                                  NumberFormatExtension("${product.outPrice}")
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
                      context.tr('add_to_cart'),
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
}
