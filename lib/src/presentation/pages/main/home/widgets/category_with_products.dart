import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';
import 'package:ploff_and_kebab/src/data/models/home/category_product_model.dart';

import 'category_with_product_item.dart';

class CategoryWithProduct extends StatelessWidget {
  const CategoryWithProduct({super.key, required this.product});

  final List<Category> product;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      primary: false,
      shrinkWrap: true,
      itemCount: product.length,
      itemBuilder: (context, index) {
        var category = product[index];
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          margin: EdgeInsets.only(bottom: 16.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r), color: AppColor.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category.title.uz,
                style: MyTextStyle.w600
                    .copyWith(color: AppColor.c2B2A28, fontSize: 22.sp),
              ),
              CategoryWithProductItemWidget(category: category),
            ],
          ),
        );
      },
    );
  }
}
