import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/core/extension/extension.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/detail/combo/combo_product_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/components/buttons/bouncing_button.dart';
import 'package:ploff_and_kebab/src/presentation/components/extensions/number_format.dart';

import '../../../../../config/theme/my_text_style.dart';

class ComboAddCartButton extends StatelessWidget {
  const ComboAddCartButton(
      {super.key,
      required this.bloc,
      required this.callback,
      required this.price,
      required this.currency,
      required this.title});

  final ComboProductBloc bloc;
  final VoidCallback callback;
  final int price;
  final String currency;
  final String title;

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
              valueListenable: bloc.amountPrice,
              builder: (context, count, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 114.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border:
                              Border.all(color: AppColor.cEEEEEE, width: 1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BouncingButton(
                            onPressed: () {
                              if (bloc.getAmount() > 1) {
                                --bloc.amountPrice.value;
                              }
                            },
                            child: const Icon(
                              Icons.remove,
                              color: AppColor.black,
                              size: 20,
                            ),
                          ),
                          Text(
                            "${bloc.getAmount()}",
                            style: MyTextStyle.w500.copyWith(
                              fontSize: 18.sp,
                              color: AppColor.c141414,
                            ),
                          ),
                          BouncingButton(
                            onPressed: () {
                              ++bloc.amountPrice.value;
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
                      "${NumberFormatExtension("$price").formatWithThousandsSeparator()} $currency",
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
                title,
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
