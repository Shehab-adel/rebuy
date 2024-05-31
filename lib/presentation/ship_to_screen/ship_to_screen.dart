import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/presentation/profile_screen/cubit/profile_cubit.dart';
import 'package:rebuy/presentation/ship_to_screen/cubit/shipping_cubit.dart';
import 'package:rebuy/presentation/ship_to_screen/cubit/shipping_state.dart';
import 'package:rebuy/widgets/app_bar/appbar_leading_image.dart';
import 'package:rebuy/widgets/app_bar/appbar_subtitle.dart';
import 'package:rebuy/widgets/app_bar/appbar_trailing_image.dart';
import 'package:rebuy/widgets/app_bar/custom_app_bar.dart';
import 'package:rebuy/widgets/custom_elevated_button.dart';
import '../ship_to_screen/widgets/shiptolist_item_widget.dart';

class ShipToScreen extends StatelessWidget {
  const ShipToScreen({Key? key, required this.shippingToCubit})
      : super(key: key);
  final ShippingToCubit shippingToCubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            leadingWidth: 40.h,
            leading: AppbarLeadingImage(
                imagePath: AppImageConstants.imgArrowLeftBlueGray300,
                margin: EdgeInsets.only(left: 16.h, top: 13.v, bottom: 14.v),
                onTap: () {
                  Navigator.pop(context);
                }),
            title: AppbarSubtitle(
                text: AppStrings.ShipTo, margin: EdgeInsets.only(left: 12.h)),
            actions: [
              AppbarTrailingImage(
                  imagePath: AppImageConstants.imgPlusIcon,
                  margin: EdgeInsets.fromLTRB(16.h, 13.v, 16.h, 14.v))
            ]),
        body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 23.v),
            child: Column(children: [
              SizedBox(height: 4.v),
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: BlocBuilder<ShippingToCubit, ShippingToState>(
                        builder: (context, state) {
                          return ListView.separated(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 22.v);
                              },
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return ShiptolistItemWidget(
                                  shippingToCubit: shippingToCubit,
                                );
                              });
                        },
                      )))
            ])),
        bottomNavigationBar: CustomElevatedButton(
            text: "Next",
            margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.paymentMethodScreen);
            }));
  }
}
