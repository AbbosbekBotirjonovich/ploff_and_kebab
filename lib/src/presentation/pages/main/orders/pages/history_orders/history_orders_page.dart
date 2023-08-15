import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff_and_kebab/src/config/router/app_routes.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/app_icons.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';

enum OrderStatus { delivered, cancelled }

class HistoryOrdersPage extends StatelessWidget {
  const HistoryOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          16.verticalSpace,
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.orderItem);
            },
            child: HistoryOrderWidget(
              numberOrder: "Заказ №341",
              status: OrderStatus.delivered.name,
              price: "85 000 сум",
              date: "11.05.2022",
            ),
          ),
          16.verticalSpace,
          HistoryOrderWidget(
            numberOrder: "Заказ №123",
            status: OrderStatus.cancelled.name,
            price: "85 000 сум",
            date: "11.05.2022",
          ),
          16.verticalSpace,
          HistoryOrderWidget(
            numberOrder: "Заказ №152",
            status: OrderStatus.delivered.name,
            price: "85 000 сум",
            date: "11.05.2022",
          ),
        ],
      ),
    );
  }
}

class HistoryOrderWidget extends StatelessWidget {
  const HistoryOrderWidget({
    super.key,
    required this.numberOrder,
    required this.status,
    required this.price,
    required this.date,
  });

  final String numberOrder;
  final String status;
  final String price;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r), color: AppColor.white),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                numberOrder,
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
                  color: status == OrderStatus.delivered.name
                      ? AppColor.c22C348.withOpacity(0.15)
                      : AppColor.cF30404.withOpacity(0.15),
                ),
                child: Center(
                  child: Text(
                    status,
                    style: MyTextStyle.w500.copyWith(
                      color: status == OrderStatus.delivered.name
                      ? AppColor.c22C348
                      : AppColor.cF30404,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              )
            ],
          ),
          24.verticalSpace,
          Row(
            children: [
              Text(
                price,
                style: MyTextStyle.w600.copyWith(
                  color: AppColor.c5F5F5F,
                  fontSize: 18.sp,
                ),
              ),
              const Spacer(),
              SvgPicture.asset(AppIcons.icDate),
              4.horizontalSpace,
              Text(
                date,
                style: MyTextStyle.w400.copyWith(
                  color: AppColor.c858585,
                  fontSize: 15.sp,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
