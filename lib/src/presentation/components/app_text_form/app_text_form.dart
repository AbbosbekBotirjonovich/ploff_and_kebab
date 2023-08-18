import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/theme/app_color.dart';
import '../../../config/theme/my_text_style.dart';

class AppTextForm extends StatelessWidget {
  TextEditingController controller;
  String? title;
  String? hintText;
  String? Function(String?)? validator;
  List<TextInputFormatter>? inputFormat;
  TextInputType? keyboardType;
  bool isVisible;
  int? maxLength;
  int? maxLines;
  Color? fillColor;
  bool hasBorder;
  bool isCapital;
  bool readOnly;
  Widget? suffixIcon;
  Widget? suffix;
  String? prefixIcon;
  void Function(String)? onChanged;
  bool? isRequired;

  AppTextForm(
      {required this.controller,
      this.title,
      this.hintText,
      this.validator,
      this.inputFormat,
      this.keyboardType,
      this.isVisible = false,
      this.maxLength,
      this.maxLines,
      this.fillColor,
      this.hasBorder = true,
      this.isCapital = false,
      this.suffixIcon,
      this.readOnly = false,
      this.prefixIcon,
      this.suffix,
      this.onChanged,
      this.isRequired = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null
            ? isRequired!
                ? Row(
                    children: [
                      Text(
                        title!,
                        style: MyTextStyle.w400.copyWith(fontSize: 14.sp),
                      ),
                      Column(
                        children: [
                          Text(
                            '*',
                            style: MyTextStyle.w500.copyWith(
                                fontSize: 14.sp, color: AppColor.cF30404),
                          )
                        ],
                      )
                    ],
                  )
                : Text(
                    title!,
                    style: MyTextStyle.w500.copyWith(fontSize: 14.sp),
                  )
            : const SizedBox.shrink(),
        title != null ? 8.verticalSpace : 0.verticalSpace,
        TextFormField(
          controller: controller,
          validator: validator,
          inputFormatters: inputFormat,
          keyboardType: keyboardType,
          maxLength: maxLength,
          style: MyTextStyle.w500.copyWith(color: AppColor.c2B2A28),
          textCapitalization: isCapital
              ? TextCapitalization.characters
              : TextCapitalization.none,
          obscureText: isVisible,
          readOnly: readOnly,
          onTapOutside: (val) {
            FocusManager.instance.primaryFocus!.unfocus();
            SystemChannels.textInput.invokeMethod('TextInput.hide');
          },
          maxLines: maxLines ?? 1,
          onChanged: onChanged,
          decoration: InputDecoration(
            fillColor: fillColor ?? AppColor.cF5F5F5,
            filled: true,
            hintText: hintText ?? '',
            counterText: '',
            contentPadding: REdgeInsets.symmetric(vertical: 0, horizontal: 16),
            hintStyle: MyTextStyle.w400.copyWith(
              fontSize: 15.sp,
              color: AppColor.c858585,
            ),
            suffix: suffix,
            prefixIcon: prefixIcon != null
                ? Transform.scale(
                    scale: 0.5,
                    child: SvgPicture.asset(
                      prefixIcon!,
                      height: 20.r,
                      width: 20.r,
                      fit: BoxFit.cover,
                    ))
                : null,
            suffixIcon: suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: hasBorder
                  ? const BorderSide(color: AppColor.cF5F5F5, width: 1)
                  : BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide:
                    const BorderSide(color: AppColor.cF30404, width: 1)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide:
                    const BorderSide(color: AppColor.cF30404, width: 1)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide.none,
            ),
          ),
        )
      ],
    );
  }
}
