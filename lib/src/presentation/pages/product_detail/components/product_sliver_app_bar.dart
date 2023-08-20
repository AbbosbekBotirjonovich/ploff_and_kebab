import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ploff_and_kebab/src/config/theme/app_icons.dart';
import 'package:ploff_and_kebab/src/core/constants/constants.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/components/product_app_bar_icons.dart';

class ProductSliverAppBar extends StatelessWidget {
  const ProductSliverAppBar({super.key, required this.imgUrl});

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      stretch: true,
      leadingWidth: 0,
      leading: const SizedBox(),
      title: const ProductAppBarIcons(),
      expandedHeight: 240.h,
      flexibleSpace: FlexibleSpaceBar(
        background: CachedNetworkImage(
          imageUrl: "${Constants.imgUrl}$imgUrl",
          fit: BoxFit.cover,
          placeholder: (context, url) =>
              SvgPicture.asset(AppIcons.icPlaceHolder),
          errorWidget: (ctx, url, error) {
            return SvgPicture.asset(AppIcons.icPlaceHolder);
          },
        ),
      ),
    );
  }
}
