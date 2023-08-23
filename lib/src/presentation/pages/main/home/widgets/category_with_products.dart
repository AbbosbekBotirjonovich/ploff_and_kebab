import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';
import 'package:ploff_and_kebab/src/data/models/home/category_product_model.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/main/home/home_bloc.dart';

import 'category_with_product_item.dart';

class CategoryWithProduct extends StatelessWidget {
  const CategoryWithProduct(
      {super.key, required this.product, required this.bloc});

  final List<Category> product;
  final HomeBloc bloc;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: bloc.updateProduct,
        builder: (context, count, _) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            primary: false,
            shrinkWrap: true,
            itemCount: bloc.newProducts.isEmpty
                ? product.length
                : bloc.newProducts.length,
            itemBuilder: (context, index) {
              var category = bloc.newProducts.isEmpty
                  ? product[index]
                  : bloc.newProducts[index];
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                margin: EdgeInsets.only(bottom: 16.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: AppColor.white),
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
        });
  }
}
