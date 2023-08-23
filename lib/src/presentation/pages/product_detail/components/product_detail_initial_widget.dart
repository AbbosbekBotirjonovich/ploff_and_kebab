import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/core/extension/extension.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/components/product_desc_widget.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/components/product_sliver_app_bar.dart';

import '../../../../config/theme/my_text_style.dart';
import '../../../../data/models/home/category_product_model.dart';

class ProductDetailInitialWidget extends StatelessWidget {
  const ProductDetailInitialWidget({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          shrinkWrap: true,
          primary: true,
          slivers: [
            ProductSliverAppBar(
              imgUrl: product.image,
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
            height: 100.h,
            color: AppColor.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const LinearProgressIndicator(),
                Container(
                  width: double.infinity,
                  height: 52.h,
                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: AppColor.cF5F5F5),
                  child: Center(
                    child: Text(
                      context.tr("add_to_cart"),
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
