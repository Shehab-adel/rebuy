import 'package:flutter/material.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/core/utils/value_manager.dart';
import 'package:rebuy/widgets/custom_outlined_button.dart';

class SocialAuthWidget extends StatelessWidget {
  const SocialAuthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomOutlinedButton(
          text: AppStrings.loginWithGoogle,
          leftIcon: Container(
              margin: EdgeInsets.only(right: AppMargin.m30.h),
              child: CustomImageView(
                  imagePath: AppImageConstants.imgGoogleIcon,
                  height: AppSize.s24.adaptSize,
                  width: AppSize.s24.adaptSize))),
      SizedBox(height: AppSize.s8.v),
      CustomOutlinedButton(
          text: AppStrings.loginWithFacebook,
          leftIcon: Container(
              margin: EdgeInsets.only(right: AppMargin.m30.h),
              child: CustomImageView(
                  imagePath: AppImageConstants.imgFacebookIcon,
                  height: AppSize.s24.adaptSize,
                  width: AppSize.s24.adaptSize)))
    ]);
  }
}
