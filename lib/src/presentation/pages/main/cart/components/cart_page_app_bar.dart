import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/core/extension/extension.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/main/cart/cart_bloc.dart';

import '../../../../../config/theme/app_icons.dart';
import '../../../../../config/theme/my_text_style.dart';
import '../../../../bloc/main/main_bloc.dart';
import '../../../../components/buttons/bouncing_button.dart';
import '../../../../components/dialogs/dialogs.dart';

class CartPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CartPageAppBar({super.key, required this.bloc});

  final CartBloc bloc;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const SizedBox(),
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
                title: "Diqqat!",
                content: "Haqiqatdan ham savatchani bo'shatmoqchimisiz?",
                positiveCallback: () {
                  bloc.deleteAll();
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
            child: SvgPicture.asset(
              AppIcons.icDelete,
              width: 24.w,
              height: 24.h,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
