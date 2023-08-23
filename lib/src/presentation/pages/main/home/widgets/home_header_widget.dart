import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/app_icons.dart';
import 'package:ploff_and_kebab/src/core/extension/extension.dart';
import 'package:ploff_and_kebab/src/presentation/components/app_text_form/app_text_form.dart';
import 'package:ploff_and_kebab/src/presentation/pages/main/home/widgets/home_app_bar.dart';
import 'package:ploff_and_kebab/src/presentation/pages/main/home/widgets/home_category_widget.dart';

import '../../../../../data/models/home/category_product_model.dart';
import '../../../../bloc/main/home/home_bloc.dart';

class HomeHeaderWidget extends StatefulWidget {
  const HomeHeaderWidget(
      {super.key,
      required this.callback,
      required this.category,
      required this.controller,
      required this.bloc});

  final VoidCallback callback;
  final List<Category> category;
  final TextEditingController controller;
  final HomeBloc bloc;

  @override
  State<HomeHeaderWidget> createState() => _HomeHeaderWidgetState();
}

class _HomeHeaderWidgetState extends State<HomeHeaderWidget> {
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    var bloc = widget.bloc;
    return InkWell(
      onTap: widget.callback,
      child: Container(
        width: double.infinity,
        height: 200.h,
        color: AppColor.white,
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                child: const HomeAppBar()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: AppTextForm(
                controller: widget.controller,
                prefixIcon: AppIcons.icSearch,
                hintText: context.tr("search_all_food"),
                suffixIcon: bloc.isHasCancel.value
                    ? InkWell(
                        onTap: () {
                          widget.controller.clear();
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
                  }
                },
              ),
            ),
            24.verticalSpace,
            SizedBox(
              width: double.infinity,
              height: 44.h,
              child: HomeCategoryWidget(
                category: widget.category,
                bloc: bloc,
              ),
            )
          ],
        ),
      ),
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
}
