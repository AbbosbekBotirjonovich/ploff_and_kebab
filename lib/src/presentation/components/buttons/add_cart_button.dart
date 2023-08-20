import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/presentation/components/extensions/number_format.dart';
import 'package:ploff_and_kebab/src/presentation/components/product_sum/product_sum_widget.dart';

import '../../../config/theme/app_color.dart';
import '../../../config/theme/my_text_style.dart';

class AddCartButton extends StatelessWidget {
  const AddCartButton({
    super.key,
    required this.callback,
    required this.priceValue,
    required this.price,
  });

  final VoidCallback callback;
  final ValueNotifier priceValue;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 170.h,
      color: AppColor.white,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ValueListenableBuilder(
              valueListenable: priceValue,
              builder: (context, count, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProductSumWidget(
                      minAmount: 1,
                      maxAmount: 100,
                      addCallback: (value) {
                        priceValue.value += price;
                      },
                      removeCallback: (value) {
                        priceValue.value += price;
                      },
                      height: 44.h,
                      width: 113.w,
                    ),
                    Text(
                      NumberFormatExtension("${price}")
                          .formatWithThousandsSeparator(),
                      style: MyTextStyle.w600.copyWith(
                        color: AppColor.black,
                        fontSize: 18.sp,
                      ),
                    )
                  ],
                );
              }),
          SizedBox(
            width: double.infinity,
            height: 52.h,
            child: ElevatedButton(
              onPressed: callback,
              child: Text(
                "Добавить в корзину",
                style: MyTextStyle.w600.copyWith(
                  color: AppColor.black,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
