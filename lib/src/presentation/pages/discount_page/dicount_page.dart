import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/core/extension/extension.dart';
import 'package:ploff_and_kebab/src/data/models/home/banner.dart';

import '../../../config/theme/my_text_style.dart';

class DiscountPage extends StatelessWidget {
  const DiscountPage({super.key, required this.banner});

  final BannerElement banner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cF5F5F5,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: AppColor.black,
          ),
        ),
        title: Text(
          context.tr('discount'),
          style: MyTextStyle.w600.copyWith(
            color: AppColor.black,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: 200.h,
        margin: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 16.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColor.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: "discount",
              child: Container(
                width: double.infinity,
                height: 150.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: CachedNetworkImage(
                      imageUrl: banner.image,
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: Text(
                banner.title.uz,
                style: MyTextStyle.w500.copyWith(
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: Text(
                banner.title.uz,
                style: MyTextStyle.w400.copyWith(
                  color: AppColor.c2B2A28,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
