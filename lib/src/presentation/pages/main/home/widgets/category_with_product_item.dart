import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ploff_and_kebab/src/config/theme/app_icons.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/my_text_style.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../data/models/home/category_product_model.dart';


class CategoryWithProductItemWidget extends StatelessWidget {
  const CategoryWithProductItemWidget({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      primary: false,
      shrinkWrap: true,
      itemCount: category.products.length,
      itemBuilder: (context, index) {
        var categoryItem = category.products[index];
        return InkWell(
          onTap: () {
            if (categoryItem.type == Type.COMBO) {
              Navigator.pushNamed(context, Routes.comboProduct,
                  arguments: categoryItem);
            }
            if (categoryItem.type == Type.SIMPLE) {
              Navigator.pushNamed(context, Routes.simpleProduct,
                  arguments: categoryItem);
            }
            if (categoryItem.type == Type.ORIGIN) {
              Navigator.pushNamed(context, Routes.originProduct,
                  arguments: categoryItem);
            }
          },
          child: SizedBox(
            width: double.infinity,
            height: 110.h,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            categoryItem.title.uz,
                            style: MyTextStyle.w500.copyWith(
                                fontSize: 15.sp,
                                color: AppColor.c2B2A28,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            categoryItem.description.uz,
                            style: MyTextStyle.w400.copyWith(
                              fontSize: 13.sp,
                              color: AppColor.c2B2A28,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "${categoryItem.outPrice} ${categoryItem.currency.name}",
                            style: MyTextStyle.w600.copyWith(
                              fontSize: 15.sp,
                              color: AppColor.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 70.h,
                      width: 70.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: CachedNetworkImage(
                          imageUrl: "${Constants.imgUrl}${categoryItem.image}",
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              SvgPicture.asset(AppIcons.icPlaceHolder),
                          errorWidget: (ctx, url, error) {
                            return SvgPicture.asset(AppIcons.icPlaceHolder);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                index == category.products.length - 1
                    ? const SizedBox()
                    : const Divider(
                        thickness: 2,
                        color: AppColor.cF5F5F5,
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
