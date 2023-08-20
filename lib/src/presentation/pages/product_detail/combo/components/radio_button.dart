import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';

import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/app_icons.dart';
import '../../../../../data/models/detail/combo_product_model.dart';

class RadioButtonsWidget extends StatelessWidget {
  RadioButtonsWidget(
      {super.key, required this.comboProduct, required this.callback});

  final Group comboProduct;
  final ValueChanged callback;
  var productType = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: comboProduct.variants!.length,
      itemBuilder: (context, itemIndex) {
        return ValueListenableBuilder(
          valueListenable: productType,
          builder: (_, __, ___) {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: () {
                productType.value = itemIndex;
                callback(comboProduct.variants![itemIndex]);
              },
              title: Text(
                comboProduct.variants![itemIndex].title!.uz!,
                style: MyTextStyle.w400.copyWith(
                  color: AppColor.c141414,
                  fontSize: 16.sp,
                ),
              ),
              leading: SvgPicture.asset(
                productType.value == itemIndex
                    ? AppIcons.icRadioActive
                    : AppIcons.icRadioInActive,
                width: 20.w,
                height: 20.h,
              ),
              trailing: Text(
                "x${comboProduct.variants![itemIndex].measurement!.accuracy}",
                style: MyTextStyle.w400.copyWith(
                  color: AppColor.c141414,
                  fontSize: 16.sp,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
