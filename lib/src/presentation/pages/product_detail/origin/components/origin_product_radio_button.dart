import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ploff_and_kebab/src/config/theme/app_icons.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';
import 'package:ploff_and_kebab/src/data/models/detail/origin_product_model.dart';

import '../../../../../config/theme/app_color.dart';

class OriginProductRadioButton extends StatelessWidget {
  OriginProductRadioButton(
      {super.key, required this.product, required this.callback});

  final Brand product;
  final ValueChanged callback;
  var productType = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      primary: false,
      padding: EdgeInsets.zero,
      itemCount: product.options!.length,
      itemBuilder: (context, index) {
        var item = product.options![index];
        return ValueListenableBuilder(
          valueListenable: productType,
          builder: (_, __, ___) {
            return Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  onTap: () {
                    productType.value = index;
                    callback(index);
                  },
                  title: Text(
                    item.title!.uz!,
                    style: MyTextStyle.w400.copyWith(
                      color: AppColor.c141414,
                      fontSize: 16.sp,
                    ),
                  ),
                  leading: SvgPicture.asset(
                    productType.value == index
                        ? AppIcons.icRadioActive
                        : AppIcons.icRadioInActive,
                    width: 20.w,
                    height: 20.h,
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: AppColor.cF5F5F5,
                )
              ],
            );
          },
        );
      },
    );
  }
}
