import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/core/extension/extension.dart';

import '../../../config/theme/app_color.dart';
import '../../../config/theme/my_text_style.dart';

Future showAlertDialog(
    {required BuildContext context,
    required String title,
    required String content,
    required VoidCallback positiveCallback,
    required VoidCallback negativeCallback}) async {
  return showDialog(
    context: context,
    builder: (_) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
          side: BorderSide.none,
        ),
        child: Container(
          height: 250.h,
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppColor.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: MyTextStyle.w600.copyWith(
                  color: AppColor.c2B2A28,
                  fontSize: 26.sp,
                ),
              ),
              Text(
                content,
                style: MyTextStyle.w600.copyWith(
                  color: AppColor.c858585,
                  fontSize: 20.sp,
                ),
                textAlign: TextAlign.center,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 56.h,
                      child: ElevatedButton(
                        onPressed: negativeCallback,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.cF5F5F5,
                        ),
                        child: Text(
                          context.tr('cancel'),
                          style: MyTextStyle.w600.copyWith(
                            color: AppColor.c2B2A28,
                          ),
                        ),
                      ),
                    ),
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: SizedBox(
                      height: 56.h,
                      child: ElevatedButton(
                        onPressed: positiveCallback,
                        child: Text(
                          context.tr('yes'),
                          style: MyTextStyle.w600.copyWith(
                            color: AppColor.c2B2A28,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
