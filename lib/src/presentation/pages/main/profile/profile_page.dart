import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/app_icons.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';
import 'package:ploff_and_kebab/src/core/extension/extension.dart';
import 'package:ploff_and_kebab/src/presentation/pages/main/profile/widgets/logout_dialog.dart';
import 'package:ploff_and_kebab/src/presentation/pages/main/profile/widgets/user_data_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColor.cF5F5F5,
        appBar: AppBar(
          title: Text(
            context.tr('profile'),
            style: MyTextStyle.w600.copyWith(
              color: AppColor.black,
              fontSize: 20.sp,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            16.verticalSpace,
            const UserDataWidget(),
            16.verticalSpace,
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColor.white,
              ),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: SvgPicture.asset(
                      AppIcons.icLocation,
                      width: 24.w,
                      height: 24.h,
                    ),
                    title: Text(
                      "Филиалы",
                      style: MyTextStyle.w500.copyWith(
                        color: AppColor.black,
                        fontSize: 16.sp,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 24,
                      color: AppColor.c5F5F5F,
                    ),
                  ),
                  const Divider(
                    color: AppColor.cF5F5F5,
                    thickness: 2,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.settings),
                    title: Text(
                      "Настройки",
                      style: MyTextStyle.w500.copyWith(
                        color: AppColor.black,
                        fontSize: 16.sp,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 24,
                      color: AppColor.c5F5F5F,
                    ),
                  ),
                  const Divider(
                    color: AppColor.cF5F5F5,
                    thickness: 2,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: SvgPicture.asset(
                      AppIcons.icLocation,
                      width: 24.w,
                      height: 24.h,
                    ),
                    title: Text(
                      "Филиалы",
                      style: MyTextStyle.w500.copyWith(
                        color: AppColor.black,
                        fontSize: 16.sp,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 24,
                      color: AppColor.c5F5F5F,
                    ),
                  ),
                  const Divider(
                    color: AppColor.cF5F5F5,
                    thickness: 2,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.settings),
                    title: Text(
                      "Настройки",
                      style: MyTextStyle.w500.copyWith(
                        color: AppColor.black,
                        fontSize: 16.sp,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 24,
                      color: AppColor.c5F5F5F,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => const LogOutDialog(),
                );
              },
              child: Container(
                width: double.infinity,
                height: 52.h,
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColor.white,
                ),
                child: Center(
                  child: Text(
                    "Выйти",
                    style: MyTextStyle.w600
                        .copyWith(color: AppColor.cF30404, fontSize: 15.sp),
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      );
}
