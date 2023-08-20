import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/data/models/detail/combo_product_model.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/combo/components/radio_button.dart';

import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/my_text_style.dart';

class ComboProductBody extends StatelessWidget {
  const ComboProductBody({super.key, required this.products});

  final ComboProductModel products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      primary: false,
      padding: EdgeInsets.zero,
      itemCount: products.groups!.length,
      itemBuilder: (context, index) {
        var comboProduct = products.groups![index];
        return Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 8.h),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r), color: AppColor.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                comboProduct.title!.uz!,
                style: MyTextStyle.w600.copyWith(
                  color: AppColor.c2B2A28,
                  fontSize: 16.sp,
                ),
              ),
              12.verticalSpace,
              RadioButtonsWidget(
                comboProduct: comboProduct,
                callback: (value) {},
              )
            ],
          ),
        );
      },
    );
  }
}
