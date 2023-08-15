import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff_and_kebab/src/config/router/app_routes.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/app_icons.dart';
import 'package:ploff_and_kebab/src/config/theme/app_images.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';
import 'package:ploff_and_kebab/src/core/extension/extension.dart';
import 'package:ploff_and_kebab/src/data/models/home/category_product_model.dart';
import 'package:ploff_and_kebab/src/presentation/components/buttons/bouncing_button.dart';
import 'package:ploff_and_kebab/src/presentation/components/dialogs/dialogs.dart';
import 'package:ploff_and_kebab/src/presentation/pages/main/home/widgets/category_with_products.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/components/product_recomend.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        centerTitle: true,
        title: Text(
          context.tr('cart'),
          style: MyTextStyle.w600.copyWith(
            color: AppColor.black,
            fontSize: 20.sp,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: BouncingButton(
              onPressed: () {
                showAlertDialog(
                    context: context,
                    title: 'Очистить корзину?',
                    content: "Вы уверены, что хотите очистить корзину?",
                    defaultActionText: 'Да',
                    cancelActionText: "Нет");
              },
              child: SvgPicture.asset(
                AppIcons.icDelete,
                width: 24.w,
                height: 24.h,
              ),
            ),
          ),
        ],
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
                      // ListView.builder(
                      //   physics: const NeverScrollableScrollPhysics(),
                      //   shrinkWrap: true,
                      //   primary: false,
                      //   padding: EdgeInsets.symmetric(
                      //       horizontal: 24.w, vertical: 16.h),
                      //   itemCount: catList[1].item.length,
                      //   itemBuilder: (context, index) {
                      //     var product = catList[1].item[index];
                      //     return CartItemWidget(product: product);
                      //   },
                      // ),
                    ],
                  ),
                ),
                16.verticalSpace,
                Container(
                  width: double.infinity,
                  height: 110.h,
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.tr('comment'),
                        style: MyTextStyle.w600.copyWith(
                          color: AppColor.c5F5F5F,
                          fontSize: 16.sp,
                        ),
                      ),
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
                              border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
                16.verticalSpace,
                ProductRecommendWidget(
                  marginBottom: 110.h,
                )
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

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.product,
  });

  final CategoryProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 88.h,
            child: Row(
              children: [
                Container(
                  width: 88.w,
                  height: 88.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    image: DecorationImage(
                      image: AssetImage(
                        AppImages.appLogo,
                      ),
                    ),
                  ),
                ),
                8.horizontalSpace,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "",
                            style: MyTextStyle.w600.copyWith(
                              color: AppColor.c2B2A28,
                              fontSize: 17.sp,
                            ),
                          ),
                          BouncingButton(
                              child: const Icon(
                                Icons.close,
                                color: AppColor.c9AA6AC,
                                size: 20,
                              ),
                              onPressed: () {}),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "500",
                            style: MyTextStyle.w600.copyWith(
                              color: AppColor.c2B2A28,
                              fontSize: 17.sp,
                            ),
                          ),
                          const Spacer(),
                          BouncingButton(
                            child: Container(
                              width: 32.w,
                              height: 32.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: AppColor.cF4F4F2,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.remove,
                                  color: AppColor.c2B2A28,
                                ),
                              ),
                            ),
                            onPressed: () {},
                          ),
                          8.horizontalSpace,
                          Text(
                            "1",
                            style: MyTextStyle.w400.copyWith(
                                color: AppColor.black, fontSize: 15.sp),
                          ),
                          8.horizontalSpace,
                          BouncingButton(
                            child: Container(
                              width: 32.w,
                              height: 32.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: AppColor.cF4F4F2,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  color: AppColor.c2B2A28,
                                ),
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          16.verticalSpace,
          const Divider(
            thickness: 2,
            color: AppColor.cF5F5F5,
          ),
        ],
      ),
    );
  }
}
