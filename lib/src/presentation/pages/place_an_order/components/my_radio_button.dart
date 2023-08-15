import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/app_icons.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';

class MyRadioButton extends StatelessWidget {
  MyRadioButton({
    super.key,
    required this.title,
    required this.items,
    required this.isLeft,
  });

  final String title;
  final List<RadioButtonModel> items;
  final bool isLeft;

  final _selectedIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: MyTextStyle.w600.copyWith(
            color: AppColor.c2B2A28,
            fontSize: 17.sp,
          ),
        ),
        16.verticalSpace,
        ValueListenableBuilder(
          valueListenable: _selectedIndex,
          builder: (context, value, child) {
            return Column(
              children: [
                ...List.generate(
                  items.length,
                  (index) => InkWell(
                    onTap: () {
                      _selectedIndex.value = index;
                    },
                    child: Container(
                      padding: EdgeInsets.only(bottom: 16.h),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              isLeft == true && items[index].icon == null
                                  ? SvgPicture.asset(
                                      _selectedIndex.value == index
                                          ? AppIcons.icRadioActive
                                          : AppIcons.icRadioInActive,
                                      width: 24.w,
                                      height: 24.h,
                                    )
                                  : SvgPicture.asset(
                                      items[index].icon!,
                                      width: 24.w,
                                      height: 24.h,
                                    ),
                              12.horizontalSpace,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      items[index].title,
                                      style: MyTextStyle.w600.copyWith(
                                        color: AppColor.c2B2A28,
                                        fontSize: 15.sp,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    if (items[index].subtitle != null)
                                      Text(
                                        items[index].subtitle!,
                                        style: MyTextStyle.w400.copyWith(
                                          color: AppColor.c858585,
                                          fontSize: 15.sp,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                  ],
                                ),
                              ),
                              12.horizontalSpace,
                              if (isLeft == false && items[index].icon != null)
                                SvgPicture.asset(
                                  _selectedIndex.value == index
                                      ? AppIcons.icRadioActive
                                      : AppIcons.icRadioInActive,
                                  width: 24.w,
                                  height: 24.h,
                                ),
                            ],
                          ),
                          if (index != items.length - 1)
                            const Divider(
                              color: AppColor.cF5F5F5,
                            )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        )
      ],
    );
  }
}

class RadioButtonModel {
  final String? icon;
  final String title;
  final String? subtitle;
  RadioButtonModel({this.icon, required this.title, this.subtitle});
}
