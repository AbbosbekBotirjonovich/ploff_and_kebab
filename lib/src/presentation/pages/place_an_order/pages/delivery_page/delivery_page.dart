import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';
import 'package:ploff_and_kebab/src/presentation/pages/place_an_order/pages/delivery_page/components/call_cureer_widget.dart';
import 'package:ploff_and_kebab/src/presentation/pages/place_an_order/pages/delivery_page/components/check_price_widget.dart';
import 'package:ploff_and_kebab/src/presentation/pages/place_an_order/pages/delivery_page/components/delivery_address_widget.dart';
import 'package:ploff_and_kebab/src/presentation/pages/place_an_order/pages/delivery_page/components/payment_type_widget.dart';
import 'package:ploff_and_kebab/src/presentation/pages/place_an_order/pages/delivery_page/components/time_delivery_widget.dart';

class DeliveryPage extends StatelessWidget {
  const DeliveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          16.verticalSpace,
          const DeliveryAddressWidget(),
          16.verticalSpace,
          const CallCureerWidget(),
          16.verticalSpace,
          const TimeDeliveryWidget(),
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
