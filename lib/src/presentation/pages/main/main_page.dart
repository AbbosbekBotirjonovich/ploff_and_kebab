import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff_and_kebab/src/config/router/app_routes.dart';
import 'package:ploff_and_kebab/src/config/theme/app_icons.dart';
import 'package:ploff_and_kebab/src/core/constants/constants.dart';
import 'package:ploff_and_kebab/src/core/extension/extension.dart';
import 'package:ploff_and_kebab/src/core/utils/utils.dart';
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
  Widget build(BuildContext context) =>
      BlocSelector<MainBloc, MainState, BottomMenu>(
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
                  icon: AppIcons.icHome,
                  activeIcon: AppIcons.icHomeActive,
                ),
                _navigationBarItem(
                  label: context.tr('cart'),
                  icon: AppIcons.icCart,
                  activeIcon: AppIcons.icCartActive,
                ),
                _navigationBarItem(
                  label: context.tr('orders'),
                  icon: AppIcons.icShopping,
                  activeIcon: AppIcons.icShoppingActive,
                ),
                _navigationBarItem(
                  label: context.tr('profile'),
                  icon: AppIcons.icProfile,
                  activeIcon: AppIcons.icProfileActive,
                ),
              ],
            ),
          ),
        ),
      );

  BottomNavigationBarItem _navigationBarItem({
    required String label,
    required String icon,
    required String activeIcon,
  }) =>
      BottomNavigationBarItem(
        icon: Padding(
          padding: AppUtils.kPaddingBottom2,
          child: SvgPicture.asset(
            icon,
            height: 24,
            width: 24,
          ),
        ),
        activeIcon: Padding(
          padding: AppUtils.kPaddingBottom2,
          child: SvgPicture.asset(
            activeIcon,
            height: 24,
            width: 24,
          ),
        ),
        label: label,
        tooltip: label,
      );
}
