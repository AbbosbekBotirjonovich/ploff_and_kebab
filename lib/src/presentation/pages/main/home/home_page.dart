import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';
import 'package:ploff_and_kebab/src/core/extension/extension.dart';
import 'package:ploff_and_kebab/src/data/models/home/banner.dart';
import 'package:ploff_and_kebab/src/data/models/home/product_search_model.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/main/home/home_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/pages/main/home/widgets/category_with_products.dart';
import 'package:ploff_and_kebab/src/presentation/pages/main/home/widgets/home_app_bar.dart';
import 'package:ploff_and_kebab/src/presentation/pages/main/home/widgets/home_banner.dart';
import 'package:ploff_and_kebab/src/presentation/pages/main/home/widgets/home_category_widget.dart';
import 'package:ploff_and_kebab/src/presentation/pages/main/home/widgets/home_header_widget.dart';

import '../../../../config/router/app_routes.dart';
import '../../../../config/theme/app_color.dart';
import '../../../../config/theme/app_icons.dart';
import '../../../../data/models/home/category_product_model.dart';
import '../../../components/app_text_form/app_text_form.dart';

part 'mixin/home_mixin.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin, HomeMixin {
  Set<BannerElement> banner = {};
  Set<Category> categories = {};
  Set<SearchProduct> resultSearch = {};

  Timer? _debounce;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (BuildContext context, HomeState state) {
              if (state is HomeLoadingState || state is HomeInitialState) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              if (state is SuccessDataState) {
                banner.addAll(state.banner.banners.toSet());
                categories.addAll(state.product.categories.toSet());
                state.banner.banners.clear();
                state.product.categories.clear();
                return homePageView();
              }
              if (state is SuccessSearchState) {
                resultSearch.addAll(state.searchProduct.products.toSet());
                state.searchProduct.products.clear();
                return homePageView(isSearchView: true);
              }
              if (state is HomeErrorState) {
                return Center(
                  child: Text(state.error),
                );
              }
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            },
          ),
        ),
      );

  homePageView({bool isSearchView = false}) {
    return Column(
      children: [
        ValueListenableBuilder(
          valueListenable: bloc.isHasCancel,
          builder: (context, count, _) {
            return InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: 200.h,
                color: AppColor.white,
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 16.w),
                        child: const HomeAppBar()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: AppTextForm(
                        controller: controller,
                        prefixIcon: AppIcons.icSearch,
                        hintText: context.tr("search_all_food"),
                        suffixIcon: bloc.isHasCancel.value
                            ? InkWell(
                                onTap: () {
                                  controller.clear();
                                  bloc.add(GetClearSearchData());
                                  bloc.isHasCancel.value = false;
                                },
                                child: const Icon(
                                  Icons.clear,
                                  color: AppColor.c858585,
                                ),
                              )
                            : const SizedBox.shrink(),
                        onChanged: (val) {
                          if (val == '') {
                            bloc.add(GetClearSearchData());
                            bloc.isHasCancel.value = false;
                          } else {
                            bloc.isHasCancel.value = true;
                          }
                          if (val.length > 2) {
                            _onSearchChanged(val);
                          } else {
                            _refresh();
                          }
                        },
                      ),
                    ),
                    24.verticalSpace,
                    SizedBox(
                      width: double.infinity,
                      height: 44.h,
                      child: HomeCategoryWidget(
                        category: categories.toList(),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
        16.verticalSpace,
        controller.text.isNotEmpty
            ? SizedBox(height: 250.h, child: searchView())
            : Expanded(
                child: RefreshIndicator(
                  onRefresh: () {
                    return _refresh();
                  },
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        HomeBannerWidget(
                          banner: banner.toList(),
                        ),
                        16.verticalSpace,
                        CategoryWithProduct(
                          product: categories.toList(),
                        )
                      ],
                    ),
                  ),
                ),
              )
      ],
    );
  }

  Future<void> _refresh() async {
    banner.clear();
    categories.clear();
    bloc.add(GetCategoryEvent());
  }

  _onSearchChanged(String val) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      banner.clear();
      categories.clear();
      bloc.add(
        GetSearchEvent(productName: val),
      );
    });
  }

  searchView() {
    return ValueListenableBuilder(
      valueListenable: bloc.isNoResult,
      builder: (context, count, _) {
        return bloc.isNoResult.value
            ? const Center(
                child: Text("No found"),
              )
            : ListView.builder(
                itemCount: resultSearch.length,
                itemBuilder: (ctx, index) {
                  return Container(
                    width: double.infinity,
                    height: 70.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                    margin:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: AppColor.white,
                    ),
                    child: Center(
                      child: ListTile(
                        title: Text(
                          resultSearch.toList()[index].title.uz,
                          style: MyTextStyle.w500
                              .copyWith(color: AppColor.c2B2A28),
                        ),
                        trailing: Text(
                          "${resultSearch.toList()[index].outPrice}",
                          style:
                              MyTextStyle.w600.copyWith(color: AppColor.black),
                        ),
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}
