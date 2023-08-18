import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/presentation/components/buttons/bouncing_button.dart';
import 'package:ploff_and_kebab/src/presentation/components/extensions/number_format.dart';

import '../../../config/theme/app_color.dart';
import '../../../config/theme/my_text_style.dart';

class AddCartButton extends StatelessWidget {
  AddCartButton({
    super.key,
    required this.price,
    required this.callback,
  });

  final ValueChanged callback;
  final _countProduct = ValueNotifier<int>(1);
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
              valueListenable: _countProduct,
              builder: (context, count, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 113.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          border:
                              Border.all(color: AppColor.cEEEEEE, width: 1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BouncingButton(
                            onPressed: () {
                              if (_countProduct.value > 1) {
                                --_countProduct.value;
                              }
                            },
                            child: const Icon(
                              Icons.remove,
                              color: AppColor.black,
                              size: 20,
                            ),
                          ),
                          Text(
                            "${_countProduct.value}",
                            style: MyTextStyle.w500.copyWith(
                              fontSize: 18.sp,
                              color: AppColor.c141414,
                            ),
                          ),
                          BouncingButton(
                            onPressed: () {
                              ++_countProduct.value;
                            },
                            child: const Icon(
                              Icons.add,
                              color: AppColor.black,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      NumberFormatExtension("${_countProduct.value * price}")
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
              onPressed: () {
                callback(_countProduct.value * price);
              },
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
