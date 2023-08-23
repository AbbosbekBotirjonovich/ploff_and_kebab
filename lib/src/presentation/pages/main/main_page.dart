import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff_and_kebab/src/config/router/app_routes.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/app_icons.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';
import 'package:ploff_and_kebab/src/core/constants/constants.dart';
import 'package:ploff_and_kebab/src/core/extension/extension.dart';
import 'package:ploff_and_kebab/src/core/utils/utils.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/main/cart/cart_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/main/home/home_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/main/main_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/components/fade_indexed_stack/animated_fade_indexed_stack.dart';
import 'package:ploff_and_kebab/src/presentation/pages/main/cart/cart_page.dart';
import 'home/home_page.dart';
import 'orders/orders_page.dart';
import 'profile/profile_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<MainBloc>().productCount.value =
        context.read<MainBloc>().getAllProducts().length;
    return BlocSelector<MainBloc, MainState, BottomMenu>(
      selector: (state) => state.bottomMenu,
      builder: (_, bottomMenu) => WillPopScope(
        onWillPop: () async {
          if (bottomMenu.index != 0) {
            context
                .read<MainBloc>()
                .add(MainEventChanged(BottomMenu.values[0]));
            return false;
          }
          return true;
        },
        child: Scaffold(
          body: FadeIndexedStack(
            index: bottomMenu.index,
            children: const [
              HomePage(),
              CartPage(),
              OrdersPage(),
              ProfilePage()
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            key: Constants.bottomNavigatorKey,
            onTap: (i) {
              if (bottomMenu.index == 0 && i == 0) {
                context.read<HomeBloc>();
                return;
              }
              if (i == 1) {
                context.read<CartBloc>().add(GetCartProductEvent());
              }
              if (i == 3 && !localSource.hasProfile) {
                Navigator.pushNamed(context, Routes.auth);
                return;
              }
              context
                  .read<MainBloc>()
                  .add(MainEventChanged(BottomMenu.values[i]));
            },
            currentIndex: bottomMenu.index,
            items: [
              _navigationBarItem(
                label: context.tr('home'),
                icon: SvgPicture.asset(AppIcons.icHome),
                activeIcon: SvgPicture.asset(AppIcons.icHomeActive),
              ),
              _navigationBarItem(
                label: context.tr('cart'),
                icon: cartBadge(context, AppIcons.icCart),
                activeIcon: cartBadge(context, AppIcons.icCartActive),
              ),
              _navigationBarItem(
                label: context.tr('orders'),
                icon: SvgPicture.asset(AppIcons.icShopping),
                activeIcon: SvgPicture.asset(AppIcons.icShoppingActive),
              ),
              _navigationBarItem(
                label: context.tr('profile'),
                icon: SvgPicture.asset(AppIcons.icProfile),
                activeIcon: SvgPicture.asset(AppIcons.icProfileActive),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ValueListenableBuilder<int> cartBadge(BuildContext context, String icon) {
    return ValueListenableBuilder(
      valueListenable: context.read<MainBloc>().productCount,
      builder: (context, count, _) {
        if (context.read<MainBloc>().productCount.value == 0) {
          return SvgPicture.asset(icon);
        } else {
          return SizedBox(
            width: 30.w,
            height: 30.h,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: SvgPicture.asset(
                    icon,
                    height: 30.h,
                    width: 30.w,
                  ),
                ),
                Positioned(
                  top: 0.h,
                  right: 0.w,
                  child: Container(
                    width: 16.w,
                    height: 16.h,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.cF30404,
                    ),
                    child: Center(
                      child: Text(
                        "${context.read<MainBloc>().productCount.value}",
                        style: MyTextStyle.w600.copyWith(
                          color: AppColor.white,
                          fontSize: 11.sp,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }

  BottomNavigationBarItem _navigationBarItem({
    required String label,
    required Widget icon,
    required Widget activeIcon,
  }) =>
      BottomNavigationBarItem(
        icon: Padding(padding: AppUtils.kPaddingBottom2, child: icon),
        activeIcon: Padding(
          padding: AppUtils.kPaddingBottom2,
          child: activeIcon,
        ),
        label: label,
        tooltip: label,
      );
}
