import 'package:flutter/material.dart';
import 'package:rebuy/core/utils/app_export.dart';

class TotalPriceDetailsWidget extends StatelessWidget {
  const TotalPriceDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15.h),
        decoration: AppDecoration.outlineBlue50
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildShoppingPriceRow(context,
                  shippingLabel: "${AppStrings.items} (3)",
                  priceLabel: "598.86"),
              SizedBox(height: 16.v),
              _buildShoppingPriceRow(context,
                  shippingLabel: AppStrings.shipping, priceLabel: "40.00"),
              SizedBox(height: 14.v),
              _buildShoppingPriceRow(context,
                  shippingLabel: AppStrings.importCharges,
                  priceLabel: "128.00"),
              SizedBox(height: 12.v),
              Divider(),
              SizedBox(height: 10.v),
              _buildShoppingPriceRow(
                context,
                shippingLabel: AppStrings.totalPrice,
                priceLabel: "766.86",
                textStyle1: CustomTextStyles.labelLargePrimary.copyWith(
                    color: theme.colorScheme.onPrimary.withOpacity(1)),
                textStyle2: CustomTextStyles.labelLargePrimary,
              )
            ]));
  }

  /// Common widget
  Widget _buildShoppingPriceRow(BuildContext context,
      {required String shippingLabel,
      required String priceLabel,
      TextStyle? textStyle1,
      textStyle2}) {
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
