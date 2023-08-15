import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';

modalBottomSheet({required BuildContext context, required Widget widget, bool hasInput = false}) {
  return showModalBottomSheet(
      backgroundColor: AppColor.transparent,
      isScrollControlled: true,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(25.r), topLeft: Radius.circular(25.r)),
      ),
      context: context,
      builder: (context) {
        return Column(
           mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 4.h,
              width: 40.w,
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColor.white,
              ),
            ),
            8.verticalSpace,
            Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.9
              ),
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25.r),
                    topLeft: Radius.circular(25.r),
                  ),
              ),
              child: IntrinsicHeight(
                  child: widget
              ),
            ),
          ],
        );
      });
}
