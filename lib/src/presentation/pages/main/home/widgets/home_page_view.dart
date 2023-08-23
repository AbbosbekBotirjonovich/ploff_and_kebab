import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/app_icons.dart';
import 'package:ploff_and_kebab/src/core/extension/extension.dart';
import 'package:ploff_and_kebab/src/data/models/home/banner.dart';
import 'package:ploff_and_kebab/src/data/models/home/category_product_model.dart';
import 'package:ploff_and_kebab/src/data/models/home/product_search_model.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/main/home/home_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/components/app_text_form/app_text_form.dart';
import 'package:ploff_and_kebab/src/presentation/pages/main/home/widgets/category_with_products.dart';
import 'package:ploff_and_kebab/src/presentation/pages/main/home/widgets/home_app_bar.dart';
import 'package:ploff_and_kebab/src/presentation/pages/main/home/widgets/home_category_widget.dart';
import 'package:ploff_and_kebab/src/presentation/pages/main/home/widgets/search_view.dart';

import 'home_banner.dart';

class HomePageView extends StatefulWidget {
  const HomePageView(
      {super.key,
      required this.bloc,
      this.isSearchView = false,
      this.banner,
      this.category,
      this.searchModel});

  final HomeBloc bloc;
  final BannerModel? banner;
  final CategoryProductModel? category;
  final ProductSearchModel? searchModel;
  final bool isSearchView;

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  TextEditingController controller = TextEditingController();

  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 200.h,
          color: AppColor.white,
          child: Column(
            children: [
              Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                  child: const HomeAppBar()),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: AppTextForm(
                  controller: controller,
                  prefixIcon: AppIcons.icSearch,
                  hintText: context.tr("search_all_food"),
                  suffixIcon: widget.bloc.isHasCancel.value
                      ? InkWell(
                          onTap: () {
                            controller.clear();
                            widget.bloc.isHasCancel.value = true;
                          },
                          child: const Icon(
                            Icons.clear,
                            color: AppColor.c858585,
                          ),
                        )
                      : const SizedBox.shrink(),
                  onChanged: (val) {
                    if (val.length > 2) {
                      _onSearchChanged(val);
                    } else {
                      _refresh();
                    }
                  },
                ),
              ),
              24.verticalSpace, //0102295870
              SizedBox(
                width: double.infinity,
                height: 44.h,
                child: HomeCategoryWidget(
                  category: widget.category!.categories,
                  bloc: widget.bloc,
                ),
              )
            ],
          ),
        ),
        16.verticalSpace,
        controller.text.isNotEmpty
            ? SizedBox(
                height: 250.h,
                child: SearchView(
                  bloc: widget.bloc,
                  searchModel: widget.searchModel,
                ),
              )
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
                          banner: widget.banner!.banners,
                        ),
                        16.verticalSpace,
                        CategoryWithProduct(
                          product: widget.category!.categories,
                          bloc: widget.bloc,
                        )
                      ],
                    ),
                  ),
                ),
              )
      ],
    );
  }

  _onSearchChanged(String val) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      widget.bloc.add(
        GetSearchEvent(productName: val),
      );
    });
  }

  Future<void> _refresh() async {
    widget.bloc.add(GetCategoryEvent());
  }
}
