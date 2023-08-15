import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';
import 'package:ploff_and_kebab/src/core/extension/extension.dart';
import 'package:ploff_and_kebab/src/presentation/components/dropdown/custom_dropdown.dart';
import 'package:ploff_and_kebab/src/presentation/components/inputs/custom_text_field.dart';
import 'package:ploff_and_kebab/src/presentation/pages/place_an_order/pages/delivery_page/components/current_location_widget.dart';

class DeliveryAddressWidget extends StatelessWidget {
  const DeliveryAddressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColor.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr('delivery_address'),
            style: MyTextStyle.w600.copyWith(
              color: AppColor.c2B2A28,
              fontSize: 17.sp,
            ),
          ),
          14.verticalSpace,
          Text(
            context.tr('current_address'),
            style: MyTextStyle.w400.copyWith(
              color: AppColor.c5F5F5F,
              fontSize: 15.sp,
            ),
          ),
          12.verticalSpace,
          const CustomTextField(
            haveBorder: false,
            filled: true,
            fillColor: AppColor.cF5F5F5,
          ),
          12.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: const CustomTextField(
                  haveBorder: false,
                  filled: true,
                  hintText: 'Подъезд',
                  fillColor: AppColor.cF5F5F5,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: const CustomTextField(
                  haveBorder: false,
                  hintText: 'Этаж',
                  filled: true,
                  fillColor: AppColor.cF5F5F5,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: const CustomTextField(
                  haveBorder: false,
                  hintText: 'Квартира',
                  filled: true,
                  fillColor: AppColor.cF5F5F5,
                ),
              ),
            ],
          ),
          12.verticalSpace,
          const CurrentLocationWidget(),
          14.verticalSpace,
          CustomDropDown(
            label: context.tr('my_address'),
            hintText: "Бешкайрагач 12",
          )
        ],
      ),
    );
  }
}
