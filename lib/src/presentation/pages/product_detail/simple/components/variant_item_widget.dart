import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';
import 'package:ploff_and_kebab/src/presentation/components/extensions/number_format.dart';

import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/app_icons.dart';
import '../../../../../data/models/detail/modifier_product_model.dart';
import '../../../../components/product_sum/product_sum_widget.dart';

class VariantItemWidget extends StatelessWidget {
  VariantItemWidget({
    super.key,
    required this.title,
    required this.price,
    this.minAmount = 1,
    this.maxAmount = 100,
    required this.addCallback,
    required this.removeCallback,
  });

  final String title;
  final int price;
  final int minAmount;
  final int maxAmount;
  final ValueChanged addCallback;
  final ValueChanged removeCallback;

  final isActive = ValueNotifier<bool>(false);

  int amount = 1;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isActive,
      builder: (context, count, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              onTap: () {
                isActive.value = !isActive.value;
                if (!isActive.value) {
                  removeCallback(amount * price);
                  amount = 1;
                }else{
                  addCallback(price);
                }
              },
              contentPadding: EdgeInsets.zero,
              title: Text(
                title,
                style: MyTextStyle.w500.copyWith(
                  color: AppColor.c2B2A28,
                  fontSize: 16.sp,
                ),
              ),
              leading: SvgPicture.asset(
                isActive.value
                    ? AppIcons.icRadioActive
                    : AppIcons.icRadioInActive,
                width: 20.w,
                height: 20.h,
              ),
              trailing: Text(
                "+${NumberFormatExtension("$price").formatWithThousandsSeparator()}",
                style: MyTextStyle.w400
                    .copyWith(color: AppColor.c5F5F5F, fontSize: 14.sp),
              ),
            ),
            isActive.value
                ? ProductSumWidget(
                    minAmount: minAmount,
                    maxAmount: maxAmount,
                    addCallback: (value) {
                      addCallback(price);
                      amount = value;
                    },
                    removeCallback: (value) {
                      removeCallback(price);
                      amount = value;
                    },
                    height: 38.h,
                    width: 90.w,
                  )
                : const SizedBox()
          ],
        );
      },
    );
  }
}
