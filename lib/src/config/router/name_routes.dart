part of 'app_routes.dart';

sealed class Routes {
  Routes._();
  static const String initial = '/';
  static const String main = '/main';
  static const String internetConnection = '/internet_connection';
  static const String settings = '/settings';
  static const String auth = '/auth';
  static const String confirmCode = '/confirm_code';
  static const String register = '/register';
  static const String discount = '/discount';
  static const String productDetail = '/product';
  static const String addAddress = '/address';
  static const String cart = '/cart';
  static const String placeAnOrder = '/placeAnOrder';
  static const String orderItem = '/orderItem';
  static const String comboProduct = '/combo';
  static const String originProduct = '/origin';
  static const String simpleProduct = '/simple';
  static const String modifierProduct = '/modifier';
}
