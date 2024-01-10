import 'package:flutter/material.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/widgets/app_bar/appbar_title.dart';
import 'package:rebuy/widgets/app_bar/appbar_trailing_image.dart';
import 'package:rebuy/widgets/app_bar/custom_app_bar.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 11.v),
                child: Column(children: [
                  _buildAccountOptionOrder(context,
                      bagIconImage: AppImageConstants.imgUserPrimary,
                      orderText: "Profile", onTapAccountOptionOrder: () {
                    onTapAccountOption(context);
                  }),
                  _buildAccountOptionOrder(context,
                      bagIconImage: AppImageConstants.imgBagIcon,
                      orderText: "Order"),
                  _buildAccountOptionOrder(context,
                      bagIconImage: AppImageConstants.imgLocation,
                      orderText: "Address"),
                  SizedBox(height: 5.v),
                  _buildAccountOptionOrder(context,
                      bagIconImage: AppImageConstants.imgCreditCardIcon,
                      orderText: "Payment", onTapAccountOptionOrder: () {
                    onTapAccountOption1(context);
                  })
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        title:
            AppbarTitle(text: "Account", margin: EdgeInsets.only(left: 16.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: AppImageConstants.imgNotificationIcon,
              margin: EdgeInsets.fromLTRB(13.h, 15.v, 13.h, 16.v),
              onTap: () {
                onTapNotificationIcon(context);
              })
        ]);
  }

  /// Common widget
  Widget _buildAccountOptionOrder(
    BuildContext context, {
    required String bagIconImage,
    required String orderText,
    Function? onTapAccountOptionOrder,
  }) {
    return GestureDetector(
        onTap: () {
          onTapAccountOptionOrder!.call();
        },
        child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(16.h),
            decoration: AppDecoration.fillOnPrimaryContainer,
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomImageView(
                  imagePath: bagIconImage,
                  height: 24.adaptSize,
                  width: 24.adaptSize),
              Padding(
                  padding: EdgeInsets.only(left: 16.h, top: 2.v, bottom: 3.v),
                  child: Text(orderText,
                      style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.onPrimary.withOpacity(1))))
            ])));
  }

  /// Navigates to the notificationScreen when the action is triggered.
  onTapNotificationIcon(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.notificationScreen);
  }

  /// Navigates to the profileScreen when the action is triggered.
  onTapAccountOption(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profileScreen);
  }

  /// Navigates to the addPaymentScreen when the action is triggered.
  onTapAccountOption1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.addPaymentScreen);
  }
}
