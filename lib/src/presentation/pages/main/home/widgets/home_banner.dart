import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/router/app_routes.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/data/models/home/banner.dart';

// ignore: must_be_immutable
class HomeBannerWidget extends StatelessWidget {
  HomeBannerWidget({super.key, required this.banner});

  final List<BannerElement> banner;

  var selectedIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColor.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: double.infinity,
            height: 160.h,
            child: PageView.builder(
              itemCount: banner.length,
              onPageChanged: (postionIndex) =>
                  selectedIndex.value = postionIndex,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.discount,
                        arguments: banner[index],
                      );
                    },
                    child: Hero(
                      tag: "discount",
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: CachedNetworkImage(
                          imageUrl: banner[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          ValueListenableBuilder(
              valueListenable: selectedIndex,
              builder: (context, value, child) {
                return Wrap(
                  children: List.generate(
                    banner.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                      child: Container(
                        width: selectedIndex.value == index ? 20.w : 12.w,
                        height: 4.h,
                        margin: const EdgeInsets.only(right: 6),
                        decoration: BoxDecoration(
                          color: selectedIndex.value == index
                              ? Theme.of(context).colorScheme.primary
                              : AppColor.cF5F5F5,
                          borderRadius: BorderRadius.all(
                            Radius.circular(55.r),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
