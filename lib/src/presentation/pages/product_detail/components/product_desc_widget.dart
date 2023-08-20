
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';
import 'package:ploff_and_kebab/src/data/models/detail/simple_product_model.dart';

import '../../../../config/theme/app_color.dart';

class ProductDescWidget extends StatelessWidget {
  const ProductDescWidget({
    super.key,
    required this.product,
  });

  final  product;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            product.title!.uz!,
            style: MyTextStyle.w600.copyWith(
              color: AppColor.black,
              fontSize: 18.sp,
            ),
          ),
          Text(
            product.description!.uz!,
            style: MyTextStyle.w400.copyWith(
              color: AppColor.c141414,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}
