import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/app_icons.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';
import 'package:ploff_and_kebab/src/presentation/components/buttons/bouncing_button.dart';
import 'package:ploff_and_kebab/src/presentation/pages/place_an_order/pages/delivery_page/components/check_price_widget.dart';

class OrderItemPage extends StatelessWidget {
  const OrderItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cF5F5F5,
      appBar: AppBar(
        leading: BouncingButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_rounded),
        ),
        centerTitle: true,
        title: Text(
          "Заказ №789",
          style: MyTextStyle.w600.copyWith(
            color: AppColor.black,
            fontSize: 17.sp,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                16.verticalSpace,
                const OrderNumberWidget(),
                16.verticalSpace,
                const CureerDataWidget(),
                16.verticalSpace,
                const CheckPriceWidget(),
                120.verticalSpace,
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              color: AppColor.white,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Повторить заказ",
                  style: MyTextStyle.w600
                      .copyWith(fontSize: 15.sp, color: AppColor.black),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CureerDataWidget extends StatelessWidget {
  const CureerDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColor.white),
      child: ListTile(
        leading: SvgPicture.asset(AppIcons.icProfile),
        title: Text(
          "Курьер",
          style: MyTextStyle.w600.copyWith(
            color: AppColor.c2B2A28,
            fontSize: 17.sp,
          ),
        ),
        subtitle: Text(
          "Abdullajanov Murod",
          style: MyTextStyle.w400.copyWith(
            color: AppColor.c858585,
            fontSize: 17.sp,
          ),
        ),
      ),
    );
  }
}

class OrderNumberWidget extends StatelessWidget {
  const OrderNumberWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  color: AppColor.c22C348.withOpacity(0.15),
                ),
                child: Center(
                  child: Text(
                    "Доставлен",
                    style: MyTextStyle.w500.copyWith(
                      color: AppColor.c22C348,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              )
            ],
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: SvgPicture.asset(AppIcons.icLocation),
            title: Text(
              "Адрес",
              style: MyTextStyle.w400.copyWith(
                fontSize: 16.sp,
                color: AppColor.c858585,
              ),
            ),
            trailing: Text(
              "Массив Бешягач 19",
              style: MyTextStyle.w500.copyWith(
                fontSize: 16.sp,
                color: AppColor.c2B2A28,
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: SvgPicture.asset(AppIcons.icClock),
            title: Text(
              "Время",
              style: MyTextStyle.w400.copyWith(
                fontSize: 16.sp,
                color: AppColor.c858585,
              ),
            ),
            trailing: Text(
              "20:56",
              style: MyTextStyle.w500.copyWith(
                fontSize: 16.sp,
                color: AppColor.c2B2A28,
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: SvgPicture.asset(AppIcons.icDate),
            title: Text(
              "Дата",
              style: MyTextStyle.w400.copyWith(
                fontSize: 16.sp,
                color: AppColor.c858585,
              ),
            ),
            trailing: Text(
              "11.05.2022",
              style: MyTextStyle.w500.copyWith(
                fontSize: 16.sp,
                color: AppColor.c2B2A28,
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: SvgPicture.asset(AppIcons.icShopping),
            title: Text(
              "Способ оплаты",
              style: MyTextStyle.w400.copyWith(
                fontSize: 16.sp,
                color: AppColor.c858585,
              ),
            ),
            trailing: Text(
              "Наличные",
              style: MyTextStyle.w500.copyWith(
                fontSize: 16.sp,
                color: AppColor.c2B2A28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
