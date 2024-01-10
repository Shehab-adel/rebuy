import 'package:flutter/material.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/presentation/profile_screen/widgets/profile_details_options_w.dart';
import 'package:rebuy/widgets/app_bar/appbar_leading_image.dart';
import 'package:rebuy/widgets/app_bar/appbar_subtitle.dart';
import 'package:rebuy/widgets/app_bar/custom_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 36.v),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                  padding: EdgeInsets.only(left: 16.h),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                            imagePath: AppImageConstants.imgProfilePicture72x72,
                            height: 72.adaptSize,
                            width: 72.adaptSize,
                            radius: BorderRadius.circular(36.h)),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 16.h, top: 9.v, bottom: 14.v),
                            child: Column(children: [
                              Text("Dominic Ovo",
                                  style: theme.textTheme.titleSmall),
                              SizedBox(height: 8.v),
                              Text("@dominic_ovo",
                                  style: theme.textTheme.bodySmall)
                            ]))
                      ])),
              SizedBox(height: 32.v),
              ProfileDetailsOptionWidget(
                  imagePath: AppImageConstants.imgGenderIcon,
                  text: AppStrings.gender,
                  value: "Male"),
              ProfileDetailsOptionWidget(
                  imagePath: AppImageConstants.imgDateIcon,
                  text: AppStrings.birthday,
                  value: "12-12-2000"),
              ProfileDetailsOptionWidget(
                  imagePath: AppImageConstants.imgMailPrimary,
                  text: AppStrings.email,
                  value: "rex4dom@gmail.com"),
              ProfileDetailsOptionWidget(
                  imagePath: AppImageConstants.imgCreditCardIcon,
                  text: AppStrings.phoneNumber,
                  value: "(307) 555-0133"),
              SizedBox(height: 5.v),
              ProfileDetailsOptionWidget(
                  imagePath: AppImageConstants.imgLockPrimary,
                  text: AppStrings.changePassword,
                  value: "•••••••••••••••••",
                  onTap: () {
                    Navigator.pushNamed(
                        context, AppRoutes.changePasswordScreen);
                  })
            ])));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: AppImageConstants.imgArrowLeftBlueGray300,
            margin: EdgeInsets.only(left: 16.h, top: 16.v, bottom: 15.v),
            onTap: () {
              Navigator.pop(context);
            }),
        title: AppbarSubtitle(
            text: AppStrings.profile, margin: EdgeInsets.only(left: 12.h)));
  }
}
