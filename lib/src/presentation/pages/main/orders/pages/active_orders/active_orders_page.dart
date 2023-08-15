import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';

class ActiveOrdersPage extends StatelessWidget {
  const ActiveOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          16.verticalSpace,
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: AppColor.white,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Заказ №341",
                      style: MyTextStyle.w600.copyWith(
                        color: AppColor.black,
                        fontSize: 18.sp,
                      ),
                    ),
                    Container(
                      width: 107.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColor.c0E73F6.withOpacity(0.15),
                      ),
                      child: Center(
                        child: Text(
                          "Доставлен",
                          style: MyTextStyle.w500.copyWith(
                            color: AppColor.c0E73F6,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                24.verticalSpace,
              ],
            ),
          )
        ],
      ),
    );
  }
}
