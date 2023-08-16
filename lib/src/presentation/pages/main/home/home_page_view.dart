import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';
import 'package:ploff_and_kebab/src/data/models/home/category_product_model.dart';
import 'package:ploff_and_kebab/src/presentation/pages/main/home/widgets/category_with_products.dart';
import 'package:ploff_and_kebab/src/presentation/pages/main/home/widgets/home_banner.dart';
import 'package:ploff_and_kebab/src/presentation/pages/main/home/widgets/home_header_widget.dart';

import '../../../../config/theme/app_color.dart';
import '../../../../injector_container.dart';
import '../../../bloc/main/home/banner/banner_bloc.dart';
import '../../../components/bottom_sheet/custom_bottom_sheet.dart';
import '../../../components/radio_button/custom_radio_button.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key, required this.product});

  final CategoryProductModel product;

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  late BannerBloc bloc;

  @override
  void initState() {
    bloc = sl<BannerBloc>();
    bloc.add(GetBanner());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BannerBloc>(
      create:(context)=> bloc,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
          child: Column(
            children: [
              HomeHeaderWidget(
                callback: () {
                  modalBottomSheet(
                    context: context,
                    widget: Container(
                      width: double.infinity,
                      height: 281.h,
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 24.h),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.r),
                          topRight: Radius.circular(12.r),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Мои адреса",
                            style: MyTextStyle.w600.copyWith(
                              color: AppColor.black,
                              fontSize: 20.sp,
                            ),
                          ),
                          const CustomRadioButton(
                            isActive: true,
                            title: "Бешкайрагач",
                            subtitle: "Бешкайрагач, Массив 19/30",
                          ),
                          const Divider(
                            color: AppColor.cF5F5F5,
                          ),
                          const CustomRadioButton(
                            isActive: true,
                            title: "Бешкайрагач",
                            subtitle: "Бешкайрагач, Массив 19/30",
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 52.h,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "+ Добавить новый адрес",
                                style: MyTextStyle.w600.copyWith(
                                  color: AppColor.black,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
              16.verticalSpace,
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      BlocBuilder<BannerBloc, BannerState>(
                        builder: (context, state) {
                          if (state is BannerInitial) {
                            return const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          }
                          if (state is SuccessBannerState) {
                            return HomeBannerWidget(
                              banner: state.banner,
                            );
                          }
                          return const Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        },
                      ),
                      16.verticalSpace,
                      CategoryWithProduct(
                        product: widget.product,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
