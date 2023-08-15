
import 'package:flutter/material.dart';
import 'package:ploff_and_kebab/src/presentation/pages/place_an_order/place_an_order_page.dart';

mixin PlaceAnOrderMixin on State<PlaceAnOrderPage>{
  late final TabController tabController;
  void initStateController(TickerProvider tickerProvider) {
    tabController = TabController(length: 2, vsync: tickerProvider);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}