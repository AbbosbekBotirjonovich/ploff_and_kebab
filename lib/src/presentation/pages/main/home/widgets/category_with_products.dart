import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/router/app_routes.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/app_images.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';
import 'package:ploff_and_kebab/src/data/models/home/category_product_model.dart';

class CategoryWithProduct extends StatelessWidget {
  const CategoryWithProduct({super.key, required this.product});

  final CategoryProductModel product;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      primary: false,
      shrinkWrap: true,
      itemCount: product.categories.length,
      itemBuilder: (context, index) {
        var category = product.categories[index];
        return Container(
          padding: EdgeInsets.only(left: 24.w, right: 24.w),
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

class CategoryWithProductItemWidget extends StatelessWidget {
  const CategoryWithProductItemWidget({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      primary: false,
      shrinkWrap: true,
      itemCount: category.products.length,
      itemBuilder: (context, index) {
        var categoryItem = category.products[index];
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.productDetail,
                arguments: categoryItem);
          },
          child: Container(
            width: double.infinity,
            height: 110.h,
            margin: EdgeInsets.symmetric(vertical: 16.h),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            categoryItem.title.uz,
                            style: MyTextStyle.w500.copyWith(
                                fontSize: 15.sp,
                                color: AppColor.c2B2A28,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            categoryItem.description.uz,
                            style: MyTextStyle.w400.copyWith(
                              fontSize: 13.sp,
                              color: AppColor.c2B2A28,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "${categoryItem.outPrice}",
                            style: MyTextStyle.w600.copyWith(
                              fontSize: 15.sp,
                              color: AppColor.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 88.h,
                      width: 88.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        image: DecorationImage(
                          image: AssetImage(categoryItem.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                index == 5
                    ? const SizedBox()
                    : const Divider(
                        thickness: 2,
                        color: AppColor.cF5F5F5,
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}