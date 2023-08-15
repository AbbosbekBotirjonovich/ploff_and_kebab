import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/presentation/pages/main/home/widgets/custom_search_widget.dart';
import 'package:ploff_and_kebab/src/presentation/pages/main/home/widgets/home_app_bar.dart';
import 'package:ploff_and_kebab/src/presentation/pages/main/home/widgets/home_category_widget.dart';

class HomeHeaderWidget extends StatefulWidget {
  const HomeHeaderWidget({super.key, required this.callback});
  final VoidCallback callback;
  @override
  State<HomeHeaderWidget> createState() => _HomeHeaderWidgetState();
}

class _HomeHeaderWidgetState extends State<HomeHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.callback,
      child: Container(
        width: double.infinity,
        height: 200.h,
        color: AppColor.white,
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                child: const HomeAppBar()),
            const CustomSearchWidget(),
            24.verticalSpace,
            SizedBox(
              width: double.infinity,
              height: 44.h,
              child: HomeCategoryWidget(),
            )
          ],
        ),
      ),
    );
  }
}
