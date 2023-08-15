import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_images.dart';
import 'package:ploff_and_kebab/src/presentation/pages/main/home/widgets/category_with_products.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/components/product_app_bar_icons.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/components/product_desc.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/components/product_recomend.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/components/product_type.dart';

class ProductCustomScrollWidget extends StatelessWidget {
  const ProductCustomScrollWidget({
    super.key,
    required this.product,
  });

  final Category product;

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
              ProductTypeWidget(
                title: "Тип",
                list: const [
                  "Чайханский плов",
                  "Свадебный плов",
                ],
              ),
              16.verticalSpace,
              ProductTypeWidget(
                title: "Размер*",
                list: const [
                  "1 порция",
                  "0,7 порция",
                ],
              ),
              16.verticalSpace,
              ProductTypeWidget(
                title: "Гуруппа модефикаторов",
                list: const ["Яйцо", "Томат"],
              ),
              16.verticalSpace,
              ProductRecommendWidget(marginBottom: 200.h,)
            ],
          ),
        )
      ],
    );
  }
}
