import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';

import '../../../../../data/models/home/category_product_model.dart';

// ignore: must_be_immutable
class HomeCategoryWidget extends StatelessWidget {
  HomeCategoryWidget({super.key, required this.category});

  final List<Category> category;

  var selected = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selected,
      builder:(context, value, child) {
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: category.length,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  selected.value = category[index].isChecked;
                  category[index].isChecked = !category[index].isChecked;
                },
                child: Container(
                  height: 40.h,
                  margin: EdgeInsets.only(right: 8.w),
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                      color: selected.value
                      ? Colors.orange
                      : AppColor.cF5F5F5,
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Center(
                    child: Text(
                      category[index].title.uz,
                      style: MyTextStyle.w500
                          .copyWith(fontSize: 15.sp, color: AppColor.c2B2A28),
                    ),
                  ),
                ),
              );
            });
      }
    );
  }
}
