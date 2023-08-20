import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/data/models/detail/modifier_product_model.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/simple/components/variant_item_widget.dart';

import '../../../../../config/theme/my_text_style.dart';
import '../../../../bloc/detail/simple/simple_product_bloc.dart';

class SingleModifierWidget extends StatelessWidget {
  SingleModifierWidget({
    super.key,
    required this.modifier,
    required this.bloc,
  });

  final ModifierProductModel modifier;
  final SimpleProductBloc bloc;

  int priceSum = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint("Single Modifier Widget");
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
                product.categoryName!.uz!,
                style: MyTextStyle.w600.copyWith(
                  color: AppColor.black,
                  fontSize: 18.sp,
                ),
              ),
              VariantItemWidget(
                title: product.name!.uz!,
                price: int.parse(product.price!),
                minAmount: product.minAmount!,
                maxAmount: product.maxAmount!,
                addCallback: (value) {
                  bloc.addPrice(value);
                },
                removeCallback: (value) {
                  WidgetsBinding.instance.addPostFrameCallback(
                    (timeStamp) {
                      bloc.removePrice(value);
                    },
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
