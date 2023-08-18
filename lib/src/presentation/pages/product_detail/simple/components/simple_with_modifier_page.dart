import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';
import 'package:ploff_and_kebab/src/data/models/detail/modifier_product_model.dart';
import 'package:ploff_and_kebab/src/data/models/detail/simple_product_model.dart';
import 'package:ploff_and_kebab/src/presentation/components/buttons/add_cart_button.dart';
import 'package:ploff_and_kebab/src/presentation/components/extensions/number_format.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/components/product_sliver_app_bar.dart';

import '../../../../../config/theme/app_icons.dart';
import '../../../../components/toast/show_toast.dart';

class SimpleWithModifierPage extends StatelessWidget {
  const SimpleWithModifierPage(
      {super.key, required this.product, required this.modifier});

  final SimpleProductModel product;
  final ModifierProductModel modifier;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            ProductSliverAppBar(
              imgUrl: product.image,
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 100.h,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          product.title.uz,
                          style: MyTextStyle.w600.copyWith(
                            color: AppColor.black,
                            fontSize: 18.sp,
                          ),
                        ),
                        Text(
                          product.description.uz,
                          style: MyTextStyle.w400.copyWith(
                            color: AppColor.c141414,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  12.verticalSpace,
                  modifier.productModifiers?.singleModifiers != null
                      ? SingleModifierWidget(modifier: modifier)
                      : const SizedBox(),
                  12.verticalSpace,
                  GroupModifierWidget(modifier: modifier),
                  190.verticalSpace,
                ],
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: AddCartButton(
            price: product.outPrice,
            callback: (value) {
              showStyleToast(context, "$value");
            },
          ),
        )
      ],
    );
  }
}

class GroupModifierWidget extends StatelessWidget {
  const GroupModifierWidget({
    super.key,
    required this.modifier,
  });

  final ModifierProductModel modifier;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      primary: false,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: modifier.productModifiers!.groupModifiers!.length,
      itemBuilder: (context, index) {
        var groupModifier = modifier.productModifiers!.groupModifiers![index];
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          margin: EdgeInsets.only(bottom: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: AppColor.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                groupModifier.name!.uz!,
                style: MyTextStyle.w600.copyWith(
                  color: AppColor.black,
                  fontSize: 18.sp,
                ),
              ),
              ModifierVariantWidget(groupModifier: groupModifier)
            ],
          ),
        );
      },
    );
  }
}

class ModifierVariantWidget extends StatelessWidget {
  const ModifierVariantWidget({
    super.key,
    required this.groupModifier,
  });

  final Modifier groupModifier;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      primary: false,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: groupModifier.variants!.length,
      itemBuilder: (context, index) {
        var product = groupModifier.variants![index];
        return ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            product.title!.uz!,
            style: MyTextStyle.w500.copyWith(
              color: AppColor.c2B2A28,
              fontSize: 16.sp,
            ),
          ),
          leading: SvgPicture.asset(
            AppIcons.icRadioActive,
            width: 20.w,
            height: 20.h,
          ),
          trailing: Text(
            "+${NumberFormatExtension("${product.outPrice!}").formatWithThousandsSeparator()}",
            style: MyTextStyle.w400
                .copyWith(color: AppColor.c5F5F5F, fontSize: 14.sp),
          ),
        );
      },
    );
  }
}

class SingleModifierWidget extends StatelessWidget {
  const SingleModifierWidget({
    super.key,
    required this.modifier,
  });

  final ModifierProductModel modifier;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      primary: false,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: modifier.productModifiers?.singleModifiers?.length,
      itemBuilder: (context, index) {
        var product = modifier.productModifiers!.singleModifiers![index];
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          margin: EdgeInsets.only(bottom: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: AppColor.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name!.uz!,
                style: MyTextStyle.w600.copyWith(
                  color: AppColor.black,
                  fontSize: 18.sp,
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  product.categoryName!.uz!,
                  style: MyTextStyle.w500.copyWith(
                    color: AppColor.c2B2A28,
                    fontSize: 16.sp,
                  ),
                ),
                leading: SvgPicture.asset(
                  AppIcons.icRadioActive,
                  width: 20.w,
                  height: 20.h,
                ),
                trailing: Text(
                  "+${NumberFormatExtension(product.price!).formatWithThousandsSeparator()}",
                  style: MyTextStyle.w400
                      .copyWith(color: AppColor.c5F5F5F, fontSize: 14.sp),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
