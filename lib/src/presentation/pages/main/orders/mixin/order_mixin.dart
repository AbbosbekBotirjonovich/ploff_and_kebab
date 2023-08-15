part of 'package:ploff_and_kebab/src/presentation/pages/main/orders/orders_page.dart';

mixin OrdersMixin on State<OrdersPage> {
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
