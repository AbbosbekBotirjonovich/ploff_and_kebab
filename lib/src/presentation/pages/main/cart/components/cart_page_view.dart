import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/core/extension/extension.dart';
import 'package:ploff_and_kebab/src/data/models/favourite/favourite_product_model.dart';
import 'package:ploff_and_kebab/src/presentation/pages/main/cart/components/cart_page_app_bar.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/my_text_style.dart';
import '../../../../bloc/main/cart/cart_bloc.dart';
import 'cart_item_widget.dart';

class CartPageView extends StatelessWidget {
  CartPageView({super.key, required this.products, required this.bloc});

  List<FavouriteProductModel> products;
  final CartBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cF5F5F5,
      appBar: CartPageAppBar(
        bloc: bloc,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 16.h),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Column(
                    children: [
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        primary: false,
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.w, vertical: 16.h),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          var product = products[index];
                          return CartItemWidget(
                            product: product,
                            bloc: bloc,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                16.verticalSpace,
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.tr('comment'),
                        style: MyTextStyle.w600.copyWith(
                          color: AppColor.c5F5F5F,
                          fontSize: 16.sp,
                        ),
                      ),
                      8.verticalSpace,
                      SizedBox(
                        width: double.infinity,
                        height: 48.h,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColor.cF5F5F5,
                            focusColor: AppColor.c5F5F5F,
                            hintText: 'Напишите комментарий к заказу',
                            hintMaxLines: 1,
                            hintStyle: MyTextStyle.w400.copyWith(
                                color: AppColor.c9AA6AC, fontSize: 15.sp),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                100.verticalSpace,
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 84.h,
              color: AppColor.white,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: SizedBox(
                height: 52.h,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.placeAnOrder);
                  },
                  child: Text(
                    "Оформить заказ",
                    style: MyTextStyle.w600.copyWith(
                      color: AppColor.black,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
