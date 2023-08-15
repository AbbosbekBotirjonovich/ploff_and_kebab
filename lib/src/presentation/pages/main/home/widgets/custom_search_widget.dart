import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/app_icons.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';
import 'package:ploff_and_kebab/src/core/extension/extension.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 44.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Center(
        child: TextField(
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            hintText: context.tr("search_all_food"),
            hintStyle: MyTextStyle.w400.copyWith(
              fontSize: 15.sp,
              color: AppColor.c858585,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12.w),
            filled: true,
            fillColor: AppColor.cF5F5F5,
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: SvgPicture.asset(AppIcons.icSearch),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
