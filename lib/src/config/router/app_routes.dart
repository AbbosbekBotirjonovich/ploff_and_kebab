import 'package:chuck_interceptor/chuck.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_and_kebab/src/data/models/home/banner.dart';
import 'package:ploff_and_kebab/src/data/models/home/category_product_model.dart';
import 'package:ploff_and_kebab/src/data/source/favourite_product_source.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/auth/confirm/confirm_code_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/auth/register/register_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/detail/combo/combo_product_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/detail/origin/origin_product_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/detail/simple/simple_product_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/main/cart/cart_bloc.dart';
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
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/combo/combo_product_page.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/origin/origin_product_page.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/simple/simple_product_page.dart';
import 'package:ploff_and_kebab/src/presentation/pages/splash/splash_page.dart';

import '../../data/source/local_source.dart';
import '../../injector_container.dart';
import '../../presentation/bloc/splash/splash_bloc.dart';

part 'name_routes.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final localSource = sl<LocalSource>();
final productSource = sl<FavouriteProductSource>();

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
              BlocProvider(
                create: (_) => sl<CartBloc>()
                  ..add(
                    GetCartProductEvent(),
                  ),
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
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<AuthBloc>(),
            child: const AuthPage(),
          ),
        );
      case Routes.confirmCode:
        final AuthSuccessState state = settings.arguments! as AuthSuccessState;
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<ConfirmCodeBloc>(),
            child: ConfirmCodePage(
              state: state,
            ),
          ),
        );
      case Routes.register:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<RegisterBloc>(),
            child: const RegisterPage(),
          ),
        );
      case Routes.discount:
        final BannerElement banner = settings.arguments as BannerElement;
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return DiscountPage(banner: banner);
          },
        );
      case Routes.simpleProduct:
        final Product product = settings.arguments as Product;
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return BlocProvider(
              create: (context) => sl<SimpleProductBloc>(),
              child: SimpleProductPage(
                product: product,
              ),
            );
          },
        );
      case Routes.originProduct:
        final Product product = settings.arguments as Product;
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return BlocProvider(
              create: (context) => sl<OriginProductBloc>()
                ..add(
                  GetOriginProductEvent(id: product.id),
                ),
              child: OriginProductPage(
                product: product,
              ),
            );
          },
        );
      case Routes.comboProduct:
        final Product product = settings.arguments as Product;
        return CupertinoPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return BlocProvider(
              create: (context) => sl<ComboProductBloc>()
                ..add(GetComboProductEvent(id: product.id)),
              child: ComboProductPage(
                product: product,
              ),
            );
          },
        );
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
