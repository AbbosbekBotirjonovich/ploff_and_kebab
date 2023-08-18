import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_images.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/components/product_app_bar_icons.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/components/product_recomend.dart';

class ProductCustomScrollWidget extends StatelessWidget {
  const ProductCustomScrollWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          stretch: true,
          leadingWidth: 0,
          leading: const SizedBox(),
          title: const ProductAppBarIcons(),
          expandedHeight: 240.h,
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [
              StretchMode.zoomBackground,
              StretchMode.blurBackground,
              StretchMode.fadeTitle,
            ],
            background: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
              child: Image.asset(
                AppImages.img1,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              16.verticalSpace,
              ProductRecommendWidget(marginBottom: 200.h,)
            ],
          ),
        )
      ],
    );
  }
}
