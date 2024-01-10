import 'package:flutter/material.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/presentation/cart_page/widgets/coupon_code_row_widget.dart';
import 'package:rebuy/presentation/cart_page/widgets/total_price_details_w.dart';
import 'package:rebuy/widgets/app_bar/appbar_title.dart';
import 'package:rebuy/widgets/app_bar/appbar_trailing_image.dart';
import 'package:rebuy/widgets/app_bar/custom_app_bar.dart';
import 'package:rebuy/widgets/custom_elevated_button.dart';

import '../cart_page/widgets/cartlist_item_widget.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 7.v),
              child: Column(children: [
                CartlistItemWidget(),
                SizedBox(height: 52.v),
                CouponCodeRowWidget(),
                SizedBox(height: 16.v),
                TotalPriceDetailsWidget(),
                SizedBox(height: 16.v),
                CustomElevatedButton(
                    text: AppStrings.checkOut,
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.shipToScreen);
                    }),
                SizedBox(height: 8.v)
              ])),
        ));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        title: AppbarTitle(
            text: AppStrings.yourCart, margin: EdgeInsets.only(left: 16.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: AppImageConstants.imgNotificationIcon,
              margin: EdgeInsets.fromLTRB(13.h, 15.v, 13.h, 16.v),
              color: appTheme.blueGray300,
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.notificationScreen);
              })
        ]);
  }
}
