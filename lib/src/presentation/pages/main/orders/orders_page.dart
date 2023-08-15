import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';

import 'package:ploff_and_kebab/src/presentation/pages/main/orders/pages/active_orders/active_orders_page.dart';
import 'package:ploff_and_kebab/src/presentation/pages/main/orders/pages/history_orders/history_orders_page.dart';

part 'mixin/order_mixin.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage>
    with SingleTickerProviderStateMixin, OrdersMixin {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initStateController(this);
  }

  var selectedIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColor.cF5F5F5,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Мои заказы'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(56.h),
            child: Padding(
              padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
              child: Material(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                color: AppColor.cF5F5F5,
                child: TabBar(
                  padding: const EdgeInsets.all(4),
                  controller: tabController,
                  indicatorColor: Colors.white,
                  labelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(text: 'Активные заказы', height: 36.h),
                    Tab(text: 'История заказов', height: 36.h),
                  ],
                  onTap: (value) => selectedIndex.value = value,
                ),
              ),
            ),
          ),
        ),
        body: ValueListenableBuilder(
          valueListenable: selectedIndex,
          builder: (context, value, child) {
            return selectedIndex.value == 0
                ? const ActiveOrdersPage()
                : const HistoryOrdersPage();
          },
        ),
      );
}
