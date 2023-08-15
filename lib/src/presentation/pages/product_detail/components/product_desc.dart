
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';
import 'package:ploff_and_kebab/src/data/models/home/category_product_model.dart';
import 'package:ploff_and_kebab/src/presentation/pages/main/home/widgets/category_with_products.dart';

class ProductDescWidget extends StatelessWidget {
  const ProductDescWidget({
    super.key,
    required this.product,
  });

  final CategoryProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 168.h,
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
      ),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "",
            style: MyTextStyle.w600
                .copyWith(color: AppColor.black, fontSize: 22.sp),
          ),
          Text(
            "Своим именем чайханский плов обязан старой ташкентской традиции «ош», когда мужчины собираются по четвергам в чайхане собственно «на ош», что означает «на плов».",
            style: MyTextStyle.w400.copyWith(
              color: AppColor.c858585,
              fontSize: 15.sp,
            ),
          ),
        ],
      ),
    );
  }
}
