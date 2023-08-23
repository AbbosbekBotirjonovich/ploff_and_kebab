import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/main/cart/cart_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/components/dialogs/dialogs.dart';
import 'package:ploff_and_kebab/src/presentation/components/extensions/number_format.dart';

import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/app_icons.dart';
import '../../../../../config/theme/my_text_style.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../data/models/favourite/favourite_product_model.dart';
import '../../../../bloc/main/main_bloc.dart';
import '../../../../components/buttons/bouncing_button.dart';
import '../../../../components/product_sum/product_sum_widget.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.product,
    required this.bloc,
  });

  final FavouriteProductModel product;
  final CartBloc bloc;

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
                SizedBox(
                  height: 70.h,
                  width: 70.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: CachedNetworkImage(
                      imageUrl: "${Constants.imgUrl}${product.image}",
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          SvgPicture.asset(AppIcons.icPlaceHolder),
                      errorWidget: (ctx, url, error) {
                        return SvgPicture.asset(AppIcons.icPlaceHolder);
                      },
                    ),
                  ),
                ),
                12.horizontalSpace,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.title!.uz!,
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
                            onPressed: () {
                              showAlertDialog(
                                context: context,
                                title: "Diqqat!",
                                content:
                                    "Haqiqatdan ham mahsulotni ro'yxatdan olib tashlamoqchimisiz?",
                                positiveCallback: () {
                                  bloc.deleteProduct(product: product);
                                  bloc.add(GetCartProductEvent());
                                  context.read<MainBloc>().productCount.value =
                                      bloc.getAllProducts().length;
                                  Navigator.pop(context);
                                },
                                negativeCallback: () {
                                  Navigator.pop(context);
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            NumberFormatExtension("${product.price}")
                                .formatWithThousandsSeparator(),
                            style: MyTextStyle.w600.copyWith(
                              color: AppColor.c2B2A28,
                              fontSize: 17.sp,
                            ),
                          ),
                          const Spacer(),
                          ProductSumWidget(
                            minAmount: 1,
                            maxAmount: 100,
                            addCallback: (value) {},
                            removeCallback: (value) {
                              if (value == 0) {
                                showAlertDialog(
                                  context: context,
                                  title: "Diqqat!",
                                  content:
                                      "Haqiqatdan ham mahsulotni ro'yxatdan olib tashlamoqchimisiz?",
                                  positiveCallback: () {
                                    bloc.deleteProduct(product: product);
                                    bloc.add(GetCartProductEvent());
                                    context
                                        .read<MainBloc>()
                                        .productCount
                                        .value = bloc.getAllProducts().length;
                                    Navigator.pop(context);
                                  },
                                  negativeCallback: () {
                                    Navigator.pop(context);
                                  },
                                );
                              }
                            },
                            height: 36.h,
                            width: 90.w,
                          )
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
