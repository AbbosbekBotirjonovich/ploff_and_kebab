import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';
import 'package:ploff_and_kebab/src/presentation/components/buttons/bouncing_button.dart';

class ProductSumWidget extends StatelessWidget {
  const ProductSumWidget({
    super.key,
    required this.minAmount,
    required this.maxAmount,
    required this.addCallback,
    required this.removeCallback,
    required this.height,
    required this.width,
  });

  final int minAmount;
  final int maxAmount;
  final ValueChanged addCallback;
  final ValueChanged removeCallback;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final countProduct = ValueNotifier<int>(minAmount);
    return ValueListenableBuilder(
      valueListenable: countProduct,
      builder: (context, count, _) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColor.cEEEEEE, width: 1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BouncingButton(
                onPressed: () {
                  if (countProduct.value > minAmount) {
                    --countProduct.value;
                    removeCallback(countProduct.value);
                  }
                },
                child: const Icon(
                  Icons.remove,
                  color: AppColor.black,
                  size: 20,
                ),
              ),
              Text(
                "${countProduct.value}",
                style: MyTextStyle.w500.copyWith(
                  fontSize: 18.sp,
                  color: AppColor.c141414,
                ),
              ),
              BouncingButton(
                onPressed: () {
                  if (countProduct.value < maxAmount) {
                    ++countProduct.value;
                    addCallback(countProduct.value);
                  }
                },
                child: const Icon(
                  Icons.add,
                  color: AppColor.black,
                  size: 20,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
