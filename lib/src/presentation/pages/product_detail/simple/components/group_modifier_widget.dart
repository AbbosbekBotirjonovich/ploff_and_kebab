import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';
import 'package:ploff_and_kebab/src/data/models/detail/modifier_product_model.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/detail/simple/simple_product_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/simple/components/modifier_variant_widget.dart';

import '../../../../../config/theme/app_color.dart';

class GroupModifierWidget extends StatelessWidget {
  const GroupModifierWidget({
    super.key,
    required this.modifier,
    required this.bloc,
  });

  final ModifierProductModel modifier;
  final SimpleProductBloc bloc;

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
              ModifierVariantWidget(
                groupModifier: groupModifier,
                bloc: bloc,
              )
            ],
          ),
        );
      },
    );
  }
}
