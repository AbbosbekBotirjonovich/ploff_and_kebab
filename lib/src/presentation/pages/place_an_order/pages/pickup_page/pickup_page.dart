import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/app_icons.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';
import 'package:ploff_and_kebab/src/presentation/pages/place_an_order/components/my_radio_button.dart';
import 'package:ploff_and_kebab/src/presentation/pages/place_an_order/pages/delivery_page/components/check_price_widget.dart';
import 'package:ploff_and_kebab/src/presentation/pages/place_an_order/pages/delivery_page/components/current_location_widget.dart';
import 'package:ploff_and_kebab/src/presentation/pages/place_an_order/pages/delivery_page/components/payment_type_widget.dart';

class PickupPage extends StatelessWidget {
  const PickupPage({super.key});

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
              borderRadius: BorderRadius.circular(16.r),
              color: AppColor.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ближайший филиал",
                  style: MyTextStyle.w600
                      .copyWith(color: AppColor.c2B2A28, fontSize: 18.sp),
                ),
                12.verticalSpace,
                const CurrentLocationWidget(),
                MyRadioButton(
                  title: '',
                  items: [
                    RadioButtonModel(
                        title: "Samarqand Darvoza",
                        subtitle: 'STaшкeнт, 100000, Узбекистан',
                        icon: AppIcons.icMarket),
                    RadioButtonModel(
                        title: "Sebzor",
                        subtitle: 'STaшкeнт, 100000, Узбекистан',
                        icon: AppIcons.icMarket),
                  ],
                  isLeft: false,
                ),
              ],
            ),
          ),
          16.verticalSpace,
          const PaymenyTypeWidget(),
          16.verticalSpace,
          const CheckPriceWidget(),
          16.verticalSpace,
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            color: AppColor.white,
            child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Заказать",
                  style: MyTextStyle.w600.copyWith(
                    color: AppColor.black,
                    fontSize: 15.sp,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
