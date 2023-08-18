import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/data/models/detail/simple_product_model.dart';
import 'package:ploff_and_kebab/src/presentation/components/buttons/add_cart_button.dart';
import 'package:ploff_and_kebab/src/presentation/components/toast/show_toast.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/components/product_sliver_app_bar.dart';

import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/my_text_style.dart';

class SimpleProductPageView extends StatelessWidget {
  const SimpleProductPageView({super.key, required this.product});

  final SimpleProductModel product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            ProductSliverAppBar(imgUrl: product.image,),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 100.h,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          product.title.uz,
                          style: MyTextStyle.w600.copyWith(
                            color: AppColor.black,
                            fontSize: 18.sp,
                          ),
                        ),
                        Text(
                          product.description.uz,
                          style: MyTextStyle.w400.copyWith(
                            color: AppColor.c141414,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: AddCartButton(
            price: product.outPrice,
            callback: (value) {
              showStyleToast(context, "$value");
            },
          ),
        )
      ],
    );
  }
}
