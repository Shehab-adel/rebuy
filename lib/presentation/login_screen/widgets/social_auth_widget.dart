import 'package:flutter/material.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/widgets/custom_outlined_button.dart';

class SocialAuthWidget extends StatelessWidget {
  const SocialAuthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomOutlinedButton(
          text: AppStrings.loginWithGoogle,
          leftIcon: Container(
              margin: EdgeInsets.only(right: 30.h),
              child: CustomImageView(
                  imagePath: AppImageConstants.imgGoogleIcon,
                  height: 24.adaptSize,
                  width: 24.adaptSize))),
      SizedBox(height: 8.v),
      CustomOutlinedButton(
          text: AppStrings.loginWithFacebook,
          leftIcon: Container(
              margin: EdgeInsets.only(right: 30.h),
              child: CustomImageView(
                  imagePath: AppImageConstants.imgFacebookIcon,
                  height: 24.adaptSize,
                  width: 24.adaptSize)))
    ]);
  }
}
