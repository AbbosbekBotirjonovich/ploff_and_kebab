import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ploff_and_kebab/src/config/theme/app_color.dart';
import 'package:ploff_and_kebab/src/config/theme/app_icons.dart';
import 'package:ploff_and_kebab/src/config/theme/my_text_style.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/main/home/home_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/components/extensions/number_format.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../data/models/home/category_product_model.dart';
import '../../../../../data/models/home/product_search_model.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.bloc, this.searchModel});

  final HomeBloc bloc;
  final ProductSearchModel? searchModel;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: searchModel?.products.length ?? 0,
      itemBuilder: (ctx, index) {
        var product = searchModel?.products[index];
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: AppColor.white,
          ),
          child: Center(
            child: ListTile(
              onTap: (){
                if (product.type == Type.COMBO) {
                  Navigator.pushNamed(context, Routes.comboProduct,
                      arguments: product);
                }
                if (product.type == Type.SIMPLE) {
                  Navigator.pushNamed(context, Routes.simpleProduct,
                      arguments: product);
                }
                if (product.type == Type.ORIGIN) {
                  Navigator.pushNamed(context, Routes.originProduct,
                      arguments: product);
                }
              },
              leading: SizedBox(
                height: 60.h,
                width: 60.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: CachedNetworkImage(
                    imageUrl: "${Constants.imgUrl}${product!.image}",
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        SvgPicture.asset(AppIcons.icPlaceHolder),
                    errorWidget: (ctx, url, error) {
                      return SvgPicture.asset(AppIcons.icPlaceHolder);
                    },
                  ),
                ),
              ),
              title: Text(
                product.title.uz ,
                style: MyTextStyle.w500.copyWith(color: AppColor.c2B2A28),
              ),
              trailing: Text(
                "${NumberFormatExtension("${product.outPrice}")
                    .formatWithThousandsSeparator()} ${product.currency}",
                style: MyTextStyle.w600.copyWith(color: AppColor.black,fontSize: 16.sp),
              ),
            ),
          ),
        );
      },
    );
  }
}
