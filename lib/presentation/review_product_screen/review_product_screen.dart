import 'package:flutter/material.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/widgets/app_bar/appbar_leading_image.dart';
import 'package:rebuy/widgets/app_bar/appbar_subtitle.dart';
import 'package:rebuy/widgets/app_bar/custom_app_bar.dart';
import 'package:rebuy/widgets/custom_elevated_button.dart';
import 'package:rebuy/widgets/custom_rating_bar.dart';

class ReviewProductScreen extends StatelessWidget {
  const ReviewProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 9.v),
                child: Column(children: [
                  SizedBox(height: 18.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 19.h, right: 23.h, bottom: 5.v),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(children: [
                                      CustomImageView(
                                          imagePath: AppImageConstants
                                              .imgProfilePicture,
                                          height: 48.adaptSize,
                                          width: 48.adaptSize,
                                          radius: BorderRadius.circular(24.h)),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 16.h,
                                              top: 2.v,
                                              bottom: 4.v),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("James Lawson",
                                                    style: theme
                                                        .textTheme.titleSmall),
                                                SizedBox(height: 4.v),
                                                CustomRatingBar(
                                                    initialRating: 5,
                                                    itemSize: 16)
                                              ]))
                                    ]),
                                    SizedBox(height: 18.v),
                                    SizedBox(
                                        width: 333.h,
                                        child: Text(
                                            "air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit, not sure if the box was always this small but the 90s are and will always be one of my favorites.",
                                            maxLines: 5,
                                            overflow: TextOverflow.ellipsis,
                                            style: theme.textTheme.bodySmall!
                                                .copyWith(height: 1.80))),
                                    SizedBox(height: 16.v),
                                    Text("December 10, 2016",
                                        style: CustomTextStyles.bodySmall10),
                                    SizedBox(height: 32.v),
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomImageView(
                                              imagePath: AppImageConstants
                                                  .imgProfilePicture48x48,
                                              height: 48.adaptSize,
                                              width: 48.adaptSize,
                                              radius:
                                                  BorderRadius.circular(24.h)),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 16.h, bottom: 4.v),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Laura Octavian",
                                                        style: theme.textTheme
                                                            .titleSmall),
                                                    SizedBox(height: 5.v),
                                                    CustomRatingBar(
                                                        initialRating: 4,
                                                        itemSize: 16)
                                                  ]))
                                        ]),
                                    SizedBox(height: 18.v),
                                    Container(
                                        width: 317.h,
                                        margin: EdgeInsets.only(right: 15.h),
                                        child: Text(
                                            "This is really amazing product, i like the design of product, I hope can buy it again!",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: theme.textTheme.bodySmall!
                                                .copyWith(height: 1.80))),
                                    SizedBox(height: 16.v),
                                    Text("December 10, 2016",
                                        style: CustomTextStyles.bodySmall10),
                                    SizedBox(height: 34.v),
                                    Row(children: [
                                      CustomImageView(
                                          imagePath: AppImageConstants
                                              .imgProfilePicture1,
                                          height: 48.adaptSize,
                                          width: 48.adaptSize,
                                          radius: BorderRadius.circular(24.h)),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 16.h,
                                              top: 3.v,
                                              bottom: 4.v),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Jhonson Bridge",
                                                    style: theme
                                                        .textTheme.titleSmall),
                                                SizedBox(height: 3.v),
                                                CustomRatingBar(
                                                    initialRating: 5,
                                                    itemSize: 16)
                                              ]))
                                    ]),
                                    SizedBox(height: 18.v),
                                    SizedBox(
                                        width: 331.h,
                                        child: Text(
                                            "air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit",
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: theme.textTheme.bodySmall!
                                                .copyWith(height: 1.80))),
                                    SizedBox(height: 16.v),
                                    Text("December 10, 2016",
                                        style: CustomTextStyles.bodySmall10),
                                    SizedBox(height: 26.v),
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomImageView(
                                              imagePath: AppImageConstants
                                                  .imgProfilePicture48x48,
                                              height: 48.adaptSize,
                                              width: 48.adaptSize,
                                              radius:
                                                  BorderRadius.circular(24.h)),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 16.h, bottom: 4.v),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Laura Octavian",
                                                        style: theme.textTheme
                                                            .titleSmall),
                                                    SizedBox(height: 5.v),
                                                    CustomRatingBar(
                                                        initialRating: 4,
                                                        itemSize: 16)
                                                  ]))
                                        ]),
                                    SizedBox(height: 18.v),
                                    Container(
                                        width: 317.h,
                                        margin: EdgeInsets.only(right: 15.h),
                                        child: Text(
                                            "This is really amazing product, i like the design of product, I hope can buy it again!",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: theme.textTheme.bodySmall!
                                                .copyWith(height: 1.80))),
                                    SizedBox(height: 16.v),
                                    Text("December 10, 2016",
                                        style: CustomTextStyles.bodySmall10),
                                    SizedBox(height: 34.v),
                                    Row(children: [
                                      CustomImageView(
                                          imagePath: AppImageConstants
                                              .imgProfilePicture1,
                                          height: 48.adaptSize,
                                          width: 48.adaptSize,
                                          radius: BorderRadius.circular(24.h)),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 16.h,
                                              top: 3.v,
                                              bottom: 4.v),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Jhonson Bridge",
                                                    style: theme
                                                        .textTheme.titleSmall),
                                                SizedBox(height: 3.v),
                                                CustomRatingBar(
                                                    initialRating: 5,
                                                    itemSize: 16)
                                              ]))
                                    ]),
                                    SizedBox(height: 18.v),
                                    SizedBox(
                                        width: 331.h,
                                        child: Text(
                                            "air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit",
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: theme.textTheme.bodySmall!
                                                .copyWith(height: 1.80))),
                                    SizedBox(height: 16.v),
                                    Text("December 10, 2016",
                                        style: CustomTextStyles.bodySmall10)
                                  ]))))
                ])),
            bottomNavigationBar: _buildWriteReview(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 43.h,
        leading: AppbarLeadingImage(
            imagePath: AppImageConstants.imgArrowLeftBlueGray300,
            margin: EdgeInsets.only(left: 19.h, top: 16.v, bottom: 15.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "5 Review", margin: EdgeInsets.only(left: 12.h)));
  }

  /// Section Widget
  Widget _buildWriteReview(BuildContext context) {
    return CustomElevatedButton(
        text: "Write Review",
        margin: EdgeInsets.only(left: 19.h, right: 13.h, bottom: 58.v),
        onPressed: () {
          onTapWriteReview(context);
        });
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the writeReviewFillScreen when the action is triggered.
  onTapWriteReview(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.writeReviewFillScreen);
  }
}
