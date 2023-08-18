import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/app_icons.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
  });

  final String icon;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            width: 24.w,
            height: 24.h,
          ),
          12.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: MyTextStyle.w400.copyWith(
                  color: AppColor.c141414,
                  fontSize: 16.sp,
                ),
              ),
              subtitle != null
                  ? Text(
                      subtitle!,
                      style: MyTextStyle.w400.copyWith(
                        color: AppColor.c141414,
                        fontSize: 16.sp,
                      ),
                    )
                  : const SizedBox(),
            ],
          )
        ],
      ),
    );
  }
}
