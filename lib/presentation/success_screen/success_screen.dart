import 'package:flutter/material.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/widgets/custom_elevated_button.dart';
import 'package:rebuy/widgets/custom_icon_button.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSuccessSection(context),
                      SizedBox(height: 16.v),
                      CustomElevatedButton(
                          text: "Back To Order",
                          onPressed: () {
                            onTapBackToOrder(context);
                          }),
                      SizedBox(height: 5.v)
                    ]))));
  }

  /// Section Widget
  Widget _buildSuccessSection(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 55.h),
        child: Column(children: [
          CustomIconButton(
              height: 72.adaptSize,
              width: 72.adaptSize,
              padding: EdgeInsets.all(24.h),
              decoration: IconButtonStyleHelper.outlinePrimary,
              child:
                  CustomImageView(imagePath: AppImageConstants.imgCheckmark)),
          SizedBox(height: 15.v),
          Text("Success", style: CustomTextStyles.headlineSmallOnPrimary),
          SizedBox(height: 11.v),
          Opacity(
              opacity: 0.5,
              child: Text("thank you for shopping using lafyuu",
                  style: CustomTextStyles.bodySmallOnPrimary_1))
        ]));
  }

  /// Navigates to the orderScreen when the action is triggered.
  onTapBackToOrder(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.orderScreen);
  }
}
