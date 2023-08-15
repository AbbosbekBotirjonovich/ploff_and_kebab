import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/app_images.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';
import 'package:ploff_and_kebab/src/presentation/pages/main/home/widgets/category_with_products.dart';

class ProductRecommendItemWidget extends StatelessWidget {
  const ProductRecommendItemWidget({
    super.key,
    required this.item,
  });

  final Category item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 148.w,
      height: 224.h,
      margin: EdgeInsets.only(left: 24.w),
      decoration: BoxDecoration(
        color: AppColor.cF8F8F8,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 112.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r),
              ),
              image: DecorationImage(
                image: AssetImage(AppImages.appLogo),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Spacer(),
          Text(
            "",
            style: MyTextStyle.w500.copyWith(
              color: AppColor.c2B2A28,
              fontSize: 16.sp,
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Container(
            width: double.infinity,
            height: 36.h,
            margin: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColor.white,
            ),
            child: Center(
              child: Text(
                "",
                style: MyTextStyle.w500.copyWith(
                  color: AppColor.black,
                  fontSize: 15.sp,
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
