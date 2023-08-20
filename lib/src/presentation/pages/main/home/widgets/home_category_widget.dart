import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';

import '../../../../../data/models/home/category_product_model.dart';

// ignore: must_be_immutable
class HomeCategoryWidget extends StatelessWidget {
  const HomeCategoryWidget({super.key, required this.category});

  final List<Category> category;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        itemBuilder: (context, index) {
          return CategoryItemWidget(
            category: category[index],
            callback: (value) {},
          );
        });
  }
}

class CategoryItemWidget extends StatelessWidget {
  CategoryItemWidget({
    super.key,
    required this.category,
    required this.callback,
  });

  final Category category;
  final ValueChanged callback;
  final selected = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: selected,
        builder: (context, count, _) {
          return InkWell(
            onTap: () {
              selected.value = !selected.value;
              callback(category);
            },
            child: Container(
              height: 40.h,
              margin: EdgeInsets.only(right: 8.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: selected.value ? Colors.orange : AppColor.cF5F5F5,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Center(
                child: Text(
                  category.title.uz,
                  style: MyTextStyle.w500
                      .copyWith(fontSize: 15.sp, color: AppColor.c2B2A28),
                ),
              ),
            ),
          );
        });
  }
}
