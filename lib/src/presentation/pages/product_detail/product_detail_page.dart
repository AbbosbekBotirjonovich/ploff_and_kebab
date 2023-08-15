import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/presentation/components/buttons/bouncing_button.dart';
import 'package:ploff_and_kebab/src/presentation/components/toast/show_toast.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/components/porduct_custom_scroll_widget.dart';

import '../../../config/theme/my_text_style.dart';
import '../../../data/models/home/category_product_model.dart';
import '../main/home/widgets/category_with_products.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.product});

  final Category product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cF5F5F5,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 170.h,
              color: AppColor.white,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 113.w,
                        height: 44.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            border:
                                Border.all(color: AppColor.cEEEEEE, width: 1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            BouncingButton(
                              onPressed: () {},
                              child: const Icon(
                                Icons.remove,
                                color: AppColor.black,
                                size: 20,
                              ),
                            ),
                            Text(
                              "1",
                              style: MyTextStyle.w500.copyWith(
                                fontSize: 18.sp,
                                color: AppColor.c141414,
                              ),
                            ),
                            BouncingButton(
                              onPressed: () {},
                              child: const Icon(
                                Icons.add,
                                color: AppColor.black,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "47 000 сум",
                        style: MyTextStyle.w600.copyWith(
                          color: AppColor.black,
                          fontSize: 18.sp,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 52.h,
                    child: ElevatedButton(
                      onPressed: () {
                        showStyleToast(context, "Buyurtmangiz qabul qilindi!");
                      },
                      child: Text(
                        "Добавить в корзину",
                        style: MyTextStyle.w600.copyWith(
                          color: AppColor.black,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


