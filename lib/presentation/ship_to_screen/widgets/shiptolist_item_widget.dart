import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/presentation/profile_screen/cubit/profile_cubit.dart';
import 'package:rebuy/presentation/ship_to_screen/cubit/shipping_cubit.dart';
import 'package:rebuy/presentation/ship_to_screen/cubit/shipping_state.dart';

class ShiptolistItemWidget extends StatelessWidget {
  const ShiptolistItemWidget(
      {required this.shippingToCubit, required this.index});

  final ShippingToCubit shippingToCubit;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 23.h,
          vertical: 21.v,
        ),
        decoration: AppDecoration.outlinePrimary.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder5,
        ),
        child: BlocBuilder<ShippingToCubit, ShippingToState>(
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ProfileCubit.get(context).fullName,
                  style: theme.textTheme.titleSmall,
                ),
                SizedBox(height: 19.v),
                Container(
                  width: 264.h,
                  margin: EdgeInsets.only(right: 30.h),
                  child: Text(
                    shippingToCubit.shippingToItemList[index].address,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall!.copyWith(
                      height: 1.80,
                    ),
                  ),
                ),
                SizedBox(height: 20.v),
                Text(
                  shippingToCubit.shippingToItemList[index].phone,
                  style: theme.textTheme.bodySmall,
                ),
                SizedBox(height: 19.v),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        shippingToCubit.changeIsAdd(false);
                        shippingToCubit.showEditDialog(context, index: index);
                      },
                      child: Text(
                        AppStrings.Edit,
                        style: CustomTextStyles.titleSmallPrimary,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 32.h),
                      child: Text(
                        AppStrings.delete,
                        style: CustomTextStyles.titleSmallPink300,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3.v),
              ],
            );
          },
        ));
  }
}
