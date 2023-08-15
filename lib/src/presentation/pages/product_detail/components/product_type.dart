import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';
import 'package:ploff_and_kebab/src/presentation/components/radio_button/custom_radio_button.dart';

// ignore: must_be_immutable
class ProductTypeWidget extends StatelessWidget {
  ProductTypeWidget({
    super.key,
    required this.title,
    required this.list,
  });

  final String title;
  final List<String> list;

  var productType = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 158.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: MyTextStyle.w600.copyWith(
              color: AppColor.black,
              fontSize: 18.sp,
            ),
          ),
          ValueListenableBuilder(
            valueListenable: productType,
            builder: (context, value, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...List.generate(
                    list.length,
                    (index) => InkWell(
                      onTap: () => productType.value = index,
                      child: CustomRadioButton(
                        isActive: productType.value == index,
                        title: list[index],
                      ),
                    ),
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
