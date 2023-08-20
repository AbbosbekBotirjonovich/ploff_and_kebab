import 'package:flutter/material.dart';
import 'package:ploff_and_kebab/src/data/models/detail/modifier_product_model.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/detail/simple/simple_product_bloc.dart';
import 'variant_item_widget.dart';

class ModifierVariantWidget extends StatelessWidget {
  ModifierVariantWidget({
    super.key,
    required this.groupModifier,
    required this.bloc,
  });

  final Modifier groupModifier;
  final SimpleProductBloc bloc;

  var isActive = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      primary: false,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: groupModifier.variants!.length,
      itemBuilder: (context, index) {
        var product = groupModifier.variants![index];
        return VariantItemWidget(
          title: product.title!.uz!,
          price: product.outPrice!,
          addCallback: (value) {
            bloc.addPrice(value);
          },
          removeCallback: (value) {
            bloc.removePrice(value);
          },
        );
      },
    );
  }
}
