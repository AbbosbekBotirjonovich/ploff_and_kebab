
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/core/extension/extension.dart';
import 'package:ploff_and_kebab/src/presentation/pages/place_an_order/components/my_radio_button.dart';

class CallCureerWidget extends StatelessWidget {
  const CallCureerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColor.white,
      ),
      child: MyRadioButton(
          title: "Хотели бы что бы вам позвонил курьер?",
          items: [
            RadioButtonModel(title: context.tr('yes')),
            RadioButtonModel(title: context.tr('no')),
          ],
          isLeft: true),
    );
  }
}
