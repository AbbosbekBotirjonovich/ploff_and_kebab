import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/core/extension/extension.dart';
import 'package:ploff_and_kebab/src/presentation/pages/place_an_order/mixin/place_an_order_mixin.dart';
import 'package:ploff_and_kebab/src/presentation/pages/place_an_order/pages/delivery_page/delivery_page.dart';
import 'package:ploff_and_kebab/src/presentation/pages/place_an_order/pages/pickup_page/pickup_page.dart';

class PlaceAnOrderPage extends StatefulWidget {
  const PlaceAnOrderPage({super.key});

  @override
  State<PlaceAnOrderPage> createState() => _PlaceAnOrderPageState();
}

class _PlaceAnOrderPageState extends State<PlaceAnOrderPage>
    with SingleTickerProviderStateMixin, PlaceAnOrderMixin {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initStateController(this);
  }

  var selectedIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cF5F5F5,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          context.tr('place_an_order'),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColor.black,
            size: 20,
          ),
        ),
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
                  Tab(text: context.tr('delivery'), height: 36.h),
                  Tab(text: context.tr('pickup'), height: 36.h),
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
              ? const DeliveryPage()
              : const PickupPage();
        },
      ),
    );
  }
}
