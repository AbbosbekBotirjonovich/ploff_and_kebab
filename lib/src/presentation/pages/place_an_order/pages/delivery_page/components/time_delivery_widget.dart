
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/app_icons.dart';
import 'package:ploff_and_kebab/src/presentation/pages/place_an_order/components/my_radio_button.dart';

class TimeDeliveryWidget extends StatelessWidget {
  const TimeDeliveryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColor.white,
      ),
      child: MyRadioButton(
        title: 'Время доставка',
        items: [
          RadioButtonModel(title: "Срочная доставка", icon: AppIcons.icBike),
          RadioButtonModel(title: "Срочная доставка", icon: AppIcons.icClock),
        ],
        isLeft: false,
      ),
    );
  }
}
