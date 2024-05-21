import 'package:flutter/material.dart';
import 'package:rebuy/core/utils/app_export.dart';

class ShoppingPriceRow extends StatelessWidget {
  const ShoppingPriceRow(
      {required this.shippingLabel,
      required this.priceLabel,
      this.textStyle1,
      this.textStyle2});
  final String shippingLabel;
  final TextStyle? textStyle1;
  final TextStyle? textStyle2;
  final String priceLabel;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: EdgeInsets.only(top: 1.v),
          child: Text(shippingLabel,
              style: textStyle1 ?? theme.textTheme.bodySmall!)),
      Text(priceLabel,
          style: textStyle2 ??
              CustomTextStyles.bodySmallOnPrimary
                  .copyWith(color: theme.colorScheme.onPrimary.withOpacity(1)))
    ]);
  }
}
