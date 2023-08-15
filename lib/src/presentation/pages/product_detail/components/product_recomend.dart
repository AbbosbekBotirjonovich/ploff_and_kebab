
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';
import 'package:ploff_and_kebab/src/presentation/pages/main/home/widgets/category_with_products.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/components/product_recommend_item.dart';

class ProductRecommendWidget extends StatelessWidget {
  const ProductRecommendWidget({
    super.key, required this.marginBottom,
  });

  final double marginBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 294.h,
      margin: EdgeInsets.only(bottom: marginBottom.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColor.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              "Рекомендуемый",
              style: MyTextStyle.w600.copyWith(
                color: AppColor.c2B2A28,
                fontSize: 18.sp,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 230.h,
            // child: ListView.builder(
            //   scrollDirection: Axis.horizontal,
            //   itemCount: catList[1].item.length,
            //   itemBuilder: (context, index) {
            //     var item = catList[1].item[index];
            //     return ProductRecommendItemWidget(item: item);
            //   },
            // ),
          )
        ],
      ),
    );
  }
}
