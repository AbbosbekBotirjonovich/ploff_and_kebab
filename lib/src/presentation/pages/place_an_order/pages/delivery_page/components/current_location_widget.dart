
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/app_icons.dart';
import 'package:ploff_and_kebab/src/config/theme/app_images.dart';

class CurrentLocationWidget extends StatelessWidget {
  const CurrentLocationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 156.h,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              image: const DecorationImage(
                  image: AssetImage(
                    AppImages.carousel,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 36.w,
              height: 36.h,
              margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColor.white,
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppIcons.icResize,
                  width: 20.w,
                  height: 20.h,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 36.w,
              height: 36.h,
              margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColor.white,
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppIcons.icPointer,
                  width: 20.w,
                  height: 20.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
