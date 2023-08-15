
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';

class CheckPriceWidget extends StatelessWidget {
  const CheckPriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColor.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Чек",
              style: MyTextStyle.w600.copyWith(
                color: AppColor.c2B2A28,
                fontSize: 18.sp,
              ),
            ),
            12.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                "Чайханский плов x1 ",
                style: MyTextStyle.w500.copyWith(
                  color: AppColor.c858585,
                  fontSize: 16.sp,
                ),
              ),
              Text(
                "55 000 сум",
                style: MyTextStyle.w600.copyWith(
                  color: AppColor.c858585,
                  fontSize: 16.sp,
                ),
              ),
              ],
            ),
            12.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                "Чайханский плов x1 ",
                style: MyTextStyle.w500.copyWith(
                  color: AppColor.c858585,
                  fontSize: 16.sp,
                ),
              ),
              Text(
                "55 000 сум",
                style: MyTextStyle.w600.copyWith(
                  color: AppColor.c858585,
                  fontSize: 16.sp,
                ),
              ),
              ],
            ),
            12.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                "Чайханский плов x1 ",
                style: MyTextStyle.w500.copyWith(
                  color: AppColor.c858585,
                  fontSize: 16.sp,
                ),
              ),
              Text(
                "55 000 сум",
                style: MyTextStyle.w600.copyWith(
                  color: AppColor.c858585,
                  fontSize: 16.sp,
                ),
              ),
              ],
            ),
            12.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                "Общая сумма",
                style: MyTextStyle.w600.copyWith(
                  color: AppColor.black,
                  fontSize: 18.sp,
                ),
              ),
              Text(
                "95 000 сум",
                style: MyTextStyle.w600.copyWith(
                  color: AppColor.black,
                  fontSize: 18.sp,
                ),
              ),
              ],
            ),
          ],
        ));
  }
}
