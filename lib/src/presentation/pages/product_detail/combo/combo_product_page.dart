import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ploff_and_kebab/src/config/theme/app_icons.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';
import 'package:ploff_and_kebab/src/data/models/detail/combo_product_model.dart';
import 'package:ploff_and_kebab/src/data/models/home/category_product_model.dart';
import 'package:ploff_and_kebab/src/presentation/components/buttons/add_cart_button.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/combo/components/combo_product_body.dart';
import 'package:ploff_and_kebab/src/presentation/pages/product_detail/components/product_sliver_app_bar.dart';

import '../../../../config/theme/app_color.dart';
import '../../../bloc/detail/combo/combo_product_bloc.dart';
import '../../../components/toast/show_toast.dart';

class ComboProductPage extends StatefulWidget {
  const ComboProductPage({super.key, required this.product});

  final Product product;

  @override
  State<ComboProductPage> createState() => _ComboProductPageState();
}

class _ComboProductPageState extends State<ComboProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cF5F5F5,
      body: BlocBuilder<ComboProductBloc, ComboProductState>(
        builder: (context, state) {
          if (state is ComboProductInitial) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is ComboProductSuccess) {
            var products = state.product;
            return Stack(
              children: [
                CustomScrollView(
                  shrinkWrap: true,
                  primary: true,
                  slivers: [
                    ProductSliverAppBar(
                      imgUrl: widget.product.image,
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          ComboProductBody(products: products),
                          190.verticalSpace,
                        ],
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AddCartButton(
                    price: products.groups[0].variants[0].outPrice,
                    callback: (value) {
                      showStyleToast(context, "$value");
                    },
                  ),
                )
              ],
            );
          }
          if (state is ComboProductError) {
            return Center(
              child: Text(state.error),
            );
          }
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
    );
  }
}

class RadioButtonsWidget extends StatelessWidget {
  RadioButtonsWidget(
      {super.key, required this.comboProduct, required this.callback});

  final Group comboProduct;
  final ValueChanged callback;
  var productType = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: comboProduct.variants.length,
      itemBuilder: (context, itemIndex) {
        return ValueListenableBuilder(
          valueListenable: productType,
          builder: (_, __, ___) {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: () {
                productType.value = itemIndex;
                callback(comboProduct.variants[itemIndex]);
              },
              title: Text(
                comboProduct.variants[itemIndex].title.uz,
                style: MyTextStyle.w400.copyWith(
                  color: AppColor.c141414,
                  fontSize: 16.sp,
                ),
              ),
              leading: SvgPicture.asset(
                productType.value == itemIndex
                    ? AppIcons.icRadioActive
                    : AppIcons.icRadioInActive,
                width: 20.w,
                height: 20.h,
              ),
              trailing: Text(
                "x${comboProduct.variants[itemIndex].measurement.accuracy}",
                style: MyTextStyle.w400.copyWith(
                  color: AppColor.c141414,
                  fontSize: 16.sp,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
