
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/app_icons.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';
import 'package:ploff_and_kebab/src/presentation/components/buttons/bouncing_button.dart';

class UserDataWidget extends StatelessWidget {
  const UserDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColor.white,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          "Усмонов Акбар",
          style: MyTextStyle.w600.copyWith(
            color: AppColor.black,
            fontSize: 20.sp,
          ),
        ),
        subtitle: Text(
          "+998 12 433 87 32",
          style: MyTextStyle.w500.copyWith(
            color: AppColor.c5F5F5F,
            fontSize: 15.sp,
          ),
        ),
        trailing: BouncingButton(
          onPressed: () {},
          child: SvgPicture.asset(AppIcons.icEdit),
        ),
      ),
    );
  }
}
