import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';

class CustomDropDown<T> extends StatelessWidget {
  const CustomDropDown({
    super.key,
    this.value,
    this.items,
    this.onChanged,
    this.label,
    this.hintText,
    this.currentFocus,
    this.nextFocus,
  });

  final T? value;
  final String? label;
  final String? hintText;
  final List<DropdownMenuItem<T>>? items;
  final ValueChanged<T?>? onChanged;
  final FocusNode? currentFocus, nextFocus;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (label != null)
            Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Text(
                  '$label',
                  style: MyTextStyle.w400.copyWith(
                    color: AppColor.c5F5F5F,
                    fontSize: 15.sp,
                  ),
                ),
            ),
          DropdownButtonHideUnderline(
            child: DropdownButton2<T>(
              isExpanded: true,
              hint: Text(
                hintText ?? '',
                style: MyTextStyle.w400.copyWith(
                  fontSize: 16.sp,
                  color: AppColor.c2B2A28
                ),
              ),
              focusNode: currentFocus,
              onMenuStateChange: (isMenuOpen) {
                if (isMenuOpen) {
                  currentFocus?.unfocus();
                  nextFocus?.requestFocus();
                }
              },
              items: items,
              value: value,
              onChanged: onChanged,
              buttonStyleData: const ButtonStyleData(
                elevation: 0,
                padding: EdgeInsets.fromLTRB(0, 2, 12, 2),
                decoration: BoxDecoration(
                  color: AppColor.cF5F5F5,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  border: Border.fromBorderSide(
                    BorderSide.none,
                  ),
                ),
              ),
              dropdownStyleData: const DropdownStyleData(
                maxHeight: 300,
                padding: EdgeInsets.zero,
                scrollPadding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: AppColor.cF5F5F5,
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.keyboard_arrow_down,
                ),
                openMenuIcon: Icon(
                  Icons.keyboard_arrow_up,
                ),
              ),
            ),
          ),
        ],
      );
}
