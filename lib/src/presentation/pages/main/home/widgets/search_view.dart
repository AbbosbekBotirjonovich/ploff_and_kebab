import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/main/home/home_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/components/extensions/number_format.dart';

import '../../../../../data/models/home/product_search_model.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.bloc, this.searchModel});

  final HomeBloc bloc;
  final ProductSearchModel? searchModel;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: bloc.isNoResult,
      builder: (context, count, _) {
        return bloc.isNoResult.value
            ? const Center(
                child: Text("No found"),
              )
            : ListView.builder(
                itemCount: searchModel!.products.length,
                itemBuilder: (ctx, index) {
                  var product = searchModel!.products[index];
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
                          product.title.uz,
                          style: MyTextStyle.w500
                              .copyWith(color: AppColor.c2B2A28),
                        ),
                        trailing: Text(
                          NumberFormatExtension("${product.outPrice}")
                              .formatWithThousandsSeparator(),
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
