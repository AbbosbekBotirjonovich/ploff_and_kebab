import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';
import 'package:ploff_and_kebab/src/data/models/detail/modifier_product_model.dart';
import 'package:ploff_and_kebab/src/data/models/detail/simple_product_model.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/detail/simple/simple_product_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/components/buttons/add_cart_button.dart';
import 'package:ploff_and_kebab/src/presentation/components/extensions/number_format.dart';
import 'package:ploff_and_kebab/src/presentation/components/product_sum/product_sum_widget.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/components/product_sliver_app_bar.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/simple/components/group_modifier_widget.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/simple/components/single_modifier_widget.dart';

import '../../../../components/buttons/bouncing_button.dart';
import '../../../../components/toast/show_toast.dart';
import '../../components/product_desc_widget.dart';

class SimpleWithModifierPage extends StatefulWidget {
  const SimpleWithModifierPage(
      {super.key,
      required this.product,
      required this.modifier,
      required this.bloc});

  final SimpleProductModel product;
  final ModifierProductModel modifier;
  final SimpleProductBloc bloc;

  @override
  State<SimpleWithModifierPage> createState() => _SimpleWithModifierPageState();
}

class _SimpleWithModifierPageState extends State<SimpleWithModifierPage> {
  late final SimpleProductBloc bloc;

  int amount = 1;

  @override
  void initState() {
    bloc = widget.bloc;
    bloc.setPrice(widget.product.outPrice!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          shrinkWrap: true,
          slivers: [
            ProductSliverAppBar(
              imgUrl: widget.product.image!,
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  ProductDescWidget(product: widget.product),
                  12.verticalSpace,
                  widget.modifier.productModifiers?.singleModifiers != null
                      ? SingleModifierWidget(
                          modifier: widget.modifier,
                          bloc: bloc,
                        )
                      : const SizedBox(),
                  12.verticalSpace,
                  GroupModifierWidget(
                    modifier: widget.modifier,
                    bloc: bloc,
                  ),
                  190.verticalSpace,
                ],
              ),
            ),
          ],
        ),
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
                ValueListenableBuilder(
                    valueListenable: bloc.priceValue,
                    builder: (context, count, _) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 114.w,
                            height: 44.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border.all(
                                    color: AppColor.cEEEEEE, width: 1)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                BouncingButton(
                                  onPressed: () {
                                    if (bloc.getAmount() > 1) {
                                      --bloc.amountPrice.value;
                                      bloc.addPrice(1);
                                      bloc.removePrice(1);
                                    }
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    color: AppColor.black,
                                    size: 20,
                                  ),
                                ),
                                Text(
                                  "${bloc.getAmount()}",
                                  style: MyTextStyle.w500.copyWith(
                                    fontSize: 18.sp,
                                    color: AppColor.c141414,
                                  ),
                                ),
                                BouncingButton(
                                  onPressed: () {
                                    ++bloc.amountPrice.value;
                                    bloc.addPrice(1);
                                    bloc.removePrice(1);
                                  },
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
                            NumberFormatExtension("${bloc.getSumPrice()}")
                                .formatWithThousandsSeparator(),
                            style: MyTextStyle.w600.copyWith(
                              color: AppColor.black,
                              fontSize: 18.sp,
                            ),
                          )
                        ],
                      );
                    }),
                SizedBox(
                  width: double.infinity,
                  height: 52.h,
                  child: ElevatedButton(
                    onPressed: () {},
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
        ),
      ],
    );
  }
}
