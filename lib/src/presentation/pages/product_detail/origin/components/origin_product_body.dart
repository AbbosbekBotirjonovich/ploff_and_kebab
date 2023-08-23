import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';
import 'package:ploff_and_kebab/src/data/models/detail/origin_product_model.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/origin/components/origin_product_radio_button.dart';

class OriginProductBody extends StatelessWidget {
  const OriginProductBody({super.key, required this.product});

  final OriginProductModel product;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      primary: false,
      padding: EdgeInsets.zero,
      itemCount: product.properties!.length,
      itemBuilder: (context, index) {
        var item = product.properties![index];
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
                item.title!.uz!,
                style: MyTextStyle.w600.copyWith(
                  color: AppColor.c2B2A28,
                  fontSize: 16.sp,
                ),
              ),
              12.verticalSpace,
              product.properties != null
                  ? OriginProductRadioButton(
                      product: item,
                      callback: (value) {},
                    )
                  : const SizedBox()
            ],
          ),
        );
      },
    );
  }
}
