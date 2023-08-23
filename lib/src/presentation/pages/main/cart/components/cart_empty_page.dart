import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ploff_and_kebab/src/config/theme/app_icons.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';
import 'package:ploff_and_kebab/src/core/extension/extension.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/main/main_bloc.dart';

import '../../../../../config/theme/app_color.dart';

class CartEmptyPage extends StatelessWidget {
  const CartEmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cF5F5F5,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          context.tr('cart'),
          style: MyTextStyle.w600.copyWith(
            color: AppColor.black,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppIcons.icTakeAway,
                  width: 104.w,
                  height: 104.h,
                ),
                16.verticalSpace,
                Text(
                  "Savatda hali mahsulot yo'q",
                  style: MyTextStyle.w500.copyWith(
                    color: AppColor.c858585,
                    fontSize: 18.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 56.h,
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: ElevatedButton(
                onPressed: () {
                  context.read<MainBloc>().add(
                        const MainEventChanged(BottomMenu.home),
                      );
                },
                child: Text(
                  "Mahsulot qo'shing",
                  style: MyTextStyle.w600.copyWith(
                    color: AppColor.c2B2A28,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
