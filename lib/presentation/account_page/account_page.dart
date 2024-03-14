import 'package:flutter/material.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/presentation/account_page/widgets/account_option_order_w.dart';
import 'package:rebuy/widgets/app_bar/appbar_title.dart';
import 'package:rebuy/widgets/app_bar/appbar_trailing_image.dart';
import 'package:rebuy/widgets/app_bar/custom_app_bar.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 11.v),
            child: Column(children: [
              AccountOptionOrderWidget(
                  bagIconImage: AppImageConstants.imgUserPrimary,
                  orderText: AppStrings.profile,
                  onTapAccountOptionOrder: () {
                    Navigator.pushNamed(context, AppRoutes.profileScreen);
                  }),
              AccountOptionOrderWidget(
                  bagIconImage: AppImageConstants.imgBagIcon,
                  orderText: AppStrings.order),
              AccountOptionOrderWidget(
                  bagIconImage: AppImageConstants.imgLocation,
                  orderText: AppStrings.address),
              SizedBox(height: 5.v),
              AccountOptionOrderWidget(
                  bagIconImage: AppImageConstants.imgCreditCardIcon,
                  orderText: AppStrings.payment,
                  onTapAccountOptionOrder: () {
                    Navigator.pushNamed(context, AppRoutes.addPaymentScreen);
                  })
            ])));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        title: AppbarTitle(
            text: AppStrings.account, margin: EdgeInsets.only(left: 16.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: AppImageConstants.imgNotificationIcon,
              color: appTheme.blueGray300,
              margin: EdgeInsets.fromLTRB(13.h, 15.v, 13.h, 16.v),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.notificationScreen);
              })
        ]);
  }
}
