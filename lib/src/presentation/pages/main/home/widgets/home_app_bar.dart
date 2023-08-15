import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff_and_kebab/src/config/theme/app_icons.dart';
import 'package:ploff_and_kebab/src/config/theme/themes.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppIcons.icLocation,
          height: 20.h,
          width: 20.w,
        ),
        Text(
          "Add Location",
          style: ThemeTextStyles.light.regularSubheadline,
        ),
        8.horizontalSpace,
        SvgPicture.asset(
          AppIcons.icDropDown,
          height: 10,
          width: 6,
        ),
      ],
    );
  }
}
