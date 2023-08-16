import 'package:chuck_interceptor/chuck.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_and_kebab/src/data/models/home/banner.dart';
import 'package:ploff_and_kebab/src/data/models/home/category_product_model.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/auth/confirm/confirm_code_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/auth/register/register_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/main/home/home_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/pages/add_address/address_page.dart';
import 'package:ploff_and_kebab/src/presentation/pages/auth/auth_page.dart';
import 'package:ploff_and_kebab/src/presentation/pages/auth/confirm/confirm_code_page.dart';
import 'package:ploff_and_kebab/src/presentation/pages/auth/register/register_page.dart';
import 'package:ploff_and_kebab/src/presentation/pages/discount_page/dicount_page.dart';
import 'package:ploff_and_kebab/src/presentation/pages/error/error_page.dart';
import 'package:ploff_and_kebab/src/presentation/pages/internet_connection/internet_connection_page.dart';
import 'package:ploff_and_kebab/src/presentation/pages/main/main_page.dart';
import 'package:ploff_and_kebab/src/presentation/pages/main/orders/pages/order_item/order_item_page.dart';
import 'package:ploff_and_kebab/src/presentation/pages/main/profile/settings/settings_page.dart';
import 'package:ploff_and_kebab/src/presentation/pages/place_an_order/place_an_order_page.dart';
import 'package:ploff_and_kebab/src/presentation/pages/splash/splash_page.dart';

import '../../data/source/local_source.dart';
import '../../injector_container.dart';
import '../../presentation/bloc/splash/splash_bloc.dart';

part 'name_routes.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final localSource = sl<LocalSource>();

final Chuck chuck = Chuck(navigatorKey: rootNavigatorKey);

sealed class AppRoutes {
  AppRoutes._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    if (kDebugMode) {
      print('route : ${settings.name}');
    }
    switch (settings.name) {
      case Routes.initial:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<SplashBloc>(),
            child: const SplashPage(),
          ),
        );
      case Routes.main:
        return FadePageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => sl<HomeBloc>()
                  ..add(GetMobileApp())
                  ..add(GetCategoryEvent()),
              ),
            ],
            child: const MainPage(),
          ),
        );
      case Routes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      case Routes.internetConnection:
        return MaterialPageRoute(
          builder: (_) => const InternetConnectionPage(),
        );
      case Routes.auth:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<AuthBloc>(),
            child: const AuthPage(),
          ),
        );
      case Routes.confirmCode:
        final AuthSuccessState state = settings.arguments! as AuthSuccessState;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<ConfirmCodeBloc>(),
            child: ConfirmCodePage(
              state: state,
            ),
          ),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<RegisterBloc>(),
            child: const RegisterPage(),
          ),
        );
      case Routes.discount:
        final BannerElement banner = settings.arguments as BannerElement;
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => DiscountPage(
            banner: banner,
          ),
          transitionDuration: const Duration(microseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      // case Routes.productDetail:
      //   final Category product =
      //       settings.arguments as Category;
      //   return PageRouteBuilder(
      //     settings: settings,
      //     pageBuilder: (_, __, ___) => ProductDetailPage(
      //       product: product,
      //     ),
      //     transitionDuration: const Duration(milliseconds: 400),
      //     transitionsBuilder: (_, animation, __, child) {
      //       return SlideTransition(
      //         position: Tween<Offset>(
      //           begin: const Offset(1, 0),
      //           end: Offset.zero,
      //         ).animate(animation),
      //         child: child,
      //       );
      //     },
      //   );

      case Routes.addAddress:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const AddressPage(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      case Routes.placeAnOrder:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const PlaceAnOrderPage(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      case Routes.orderItem:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const OrderItemPage(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      default:
        return MaterialPageRoute(builder: (_) => ErrorPage(settings: settings));
    }
  }

  static Route<dynamic>? onUnknownRoute(RouteSettings settings) {
    if (kDebugMode) {
      print('Navigate to: $settings');
    }
    return MaterialPageRoute(
      builder: (_) => ErrorPage(
        settings: settings,
      ),
    );
  }
}

class FadePageRoute<T> extends PageRouteBuilder<T> {
  FadePageRoute({required this.builder})
      : super(
          pageBuilder: (
            context,
            animation,
            secondaryAnimation,
          ) =>
              builder(context),
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
  final WidgetBuilder builder;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 1000);
}
