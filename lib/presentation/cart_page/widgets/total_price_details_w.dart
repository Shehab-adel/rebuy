import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/presentation/cart_page/cubit/cart_cubit.dart';
import 'package:rebuy/presentation/cart_page/cubit/cart_state.dart';
import 'package:rebuy/presentation/cart_page/widgets/shopping_price_row.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/dash_cubit.dart';

class TotalPriceDetailsWidget extends StatelessWidget {
  const TotalPriceDetailsWidget({Key? key, required this.cartCubit})
      : super(key: key);
  final CartCubit cartCubit;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(builder: (context, state) {
      return Container(
          padding: EdgeInsets.all(15.h),
          decoration: AppDecoration.outlineBlue50
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShoppingPriceRow(
                    shippingLabel:
                        "${AppStrings.items} ${cartCubit.dashCubit.cartDataModelMap.length}",
                    priceLabel: "${DashCubit.get(context).itemsPrice}"),
                SizedBox(height: 16.v),
                ShoppingPriceRow(
                    shippingLabel: AppStrings.shipping, priceLabel: "40.00"),
                SizedBox(height: 14.v),
                ShoppingPriceRow(
                    shippingLabel: AppStrings.importCharges,
                    priceLabel: "128.00"),
                SizedBox(height: 12.v),
                Divider(),
                SizedBox(height: 10.v),
                ShoppingPriceRow(
                  shippingLabel: AppStrings.totalPrice,
                  priceLabel: "766.86",
                  textStyle1: CustomTextStyles.labelLargePrimary.copyWith(
                      color: theme.colorScheme.onPrimary.withOpacity(1)),
                  textStyle2: CustomTextStyles.labelLargePrimary,
                )
              ]));
    });
  }
}
