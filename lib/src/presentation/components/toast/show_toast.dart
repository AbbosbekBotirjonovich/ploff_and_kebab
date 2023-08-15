import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';

void showStyleToast(BuildContext context, String msg, {bool isSuccess = false}) {
  showToast(
    msg,
    textStyle: MyTextStyle.w600.copyWith(
      color: AppColor.white,
      fontSize: 17.sp
    ),
    textPadding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 24.h),
    context: context,
    animation: StyledToastAnimation.slideFromTop,
    reverseAnimation: StyledToastAnimation.slideFromTop,
    position: StyledToastPosition.top,
    animDuration: const Duration(seconds: 1),
    duration: const Duration(seconds: 3),
    curve: Curves.elasticOut,
    backgroundColor:Colors.green,
    reverseCurve: Curves.linear,
  );
}