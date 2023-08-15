import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/app_icons.dart';
import 'package:ploff_and_kebab/src/presentation/pages/place_an_order/components/my_radio_button.dart';

class PaymenyTypeWidget extends StatelessWidget {
  const PaymenyTypeWidget({super.key});

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
            title: 'Тип оплаты',
            items: [
              RadioButtonModel(title: "Наличные", icon: AppIcons.icMoney),
              RadioButtonModel(title: "Payme", icon: AppIcons.icPayme),
              RadioButtonModel(title: "Click", icon: AppIcons.icClick),
            ],
            isLeft: false,
          ),
    );
  }
}
