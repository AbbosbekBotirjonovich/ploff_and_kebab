import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';
import 'package:ploff_and_kebab/src/core/extension/extension.dart';
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.errorText,
    this.showError = false,
    this.controller,
    this.keyboardType,
    this.inputAction,
    this.maxLines,
    this.onChanged,
    this.inputFormatters,
    this.obscureText,
    this.suffixIcon,
    this.titleText,
    this.enabled,
    this.onTap,
    this.readOnly = false,
    this.fillColor,
    this.minLines,
    this.onComplete,
    this.validator,
    this.autofocus,
    this.prefixIcon,
    this.prefixText,
    this.prefixStyle,
    this.contentPadding,
    this.haveBorder = true,
    this.style,
    this.filled,
  });

  final String? hintText;
  final String? errorText;
  final bool showError;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? inputAction;
  final int? maxLines;
  final int? minLines;
  final String? titleText;
  final void Function(String?)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final bool? obscureText;
  final bool readOnly;
  final Color? fillColor;
  final bool? autofocus;
  final bool? enabled;
  final void Function()? onTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function()? onComplete;
  final String Function(String?)? validator;
  final String? prefixText;
  final TextStyle? prefixStyle;
  final EdgeInsets? contentPadding;
  final bool haveBorder;
  final TextStyle? style;
  final bool? filled;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (titleText != null)
            Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: Text(
                '$titleText',
                style: MyTextStyle.w400.copyWith(
                  fontSize: 15.sp,
                  height: 14 / 12,
                ),
              ),
            ),
          TextFormField(
            validator: (value) => validator!(value),
            textCapitalization: TextCapitalization.sentences,
            readOnly: readOnly,
            enabled: enabled ?? true,
            autofocus: autofocus ?? false,
            obscureText: obscureText ?? false,
            controller: controller,
            onTap: onTap,
            style: style ??
                 MyTextStyle.w400.copyWith(
                  fontSize: 14.sp,
                  height: 16 / 14,
                ),
            textInputAction: inputAction ?? TextInputAction.next,
            onChanged: onChanged,
            decoration: InputDecoration(
              fillColor: fillColor,
              filled: filled,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              errorText: showError ? errorText : null,
              errorStyle: const TextStyle(fontSize: 13),
              hintText: hintText,
              contentPadding: contentPadding,
              focusedBorder: OutlineInputBorder(
                borderSide: haveBorder
                    ? const BorderSide(color: AppColor.cF5F5F5)
                    : BorderSide.none,
                borderRadius: BorderRadius.circular(12.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: haveBorder
                    ? BorderSide(color: Colors.grey.shade300)
                    : BorderSide.none,
                borderRadius: BorderRadius.circular(12.r),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: haveBorder
                    ? const BorderSide(color: Colors.red)
                    : BorderSide.none,
                borderRadius: BorderRadius.circular(12.r),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: haveBorder
                    ? const BorderSide(color: Colors.red)
                    : BorderSide.none,
                borderRadius: BorderRadius.circular(12.r),
              ),
              prefixText: prefixText,
              prefixStyle: prefixStyle,
            ),
            cursorColor: context.theme.colorScheme.primary,
            keyboardType: keyboardType,
            maxLines: maxLines ?? 1,
            minLines: minLines ?? 1,
            inputFormatters: inputFormatters,
            onEditingComplete: onComplete,
          ),
        ],
      );
}
