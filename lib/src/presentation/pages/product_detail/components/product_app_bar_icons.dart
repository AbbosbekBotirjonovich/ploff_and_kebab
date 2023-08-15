
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';

class ProductAppBarIcons extends StatelessWidget {
  const ProductAppBarIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.white.withOpacity(0.8),
            ),
            child: const Center(
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 24,
                color: AppColor.c2B2A28,
              ),
            ),
          ),
        ),
        Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.white.withOpacity(0.8),
          ),
          child: const Center(
            child: Icon(
              Icons.share_rounded,
              size: 24,
              color: AppColor.c2B2A28,
            ),
          ),
        ),
      ],
    );
  }
}
