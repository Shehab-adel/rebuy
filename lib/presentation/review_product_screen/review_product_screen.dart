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
    return Scaffold(
        appBar: CustomAppBar(
            leadingWidth: 43.h,
            leading: AppbarLeadingImage(
                imagePath: AppImageConstants.imgArrowLeftBlueGray300,
                margin: EdgeInsets.only(left: 19.h, top: 16.v, bottom: 15.v),
                onTap: () {
                  Navigator.pop(context);
                }),
            title: AppbarSubtitle(
                text: "5 Review", margin: EdgeInsets.only(left: 12.h))),
        body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 9.v),
            child: ListView.separated(
                padding: EdgeInsets.only(left: 19.h, right: 23.h, bottom: 5.v),
                itemBuilder: (context, index) {
                  return Column(children: [
                    SizedBox(height: 18.v),
                    Row(children: [
                      CustomImageView(
                          imagePath: AppImageConstants.imgProfilePicture,
                          height: 48.adaptSize,
                          width: 48.adaptSize,
                          radius: BorderRadius.circular(24.h)),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 16.h, top: 2.v, bottom: 4.v),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("James Lawson",
                                    style: theme.textTheme.titleSmall),
                                SizedBox(height: 4.v),
                                CustomRatingBar(initialRating: 5, itemSize: 16)
                              ]))
                    ]),
                    SizedBox(height: 18.v),
                    SizedBox(
                        width: double.infinity.h,
                        child: Text(
                            "air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit, not sure if the box was always this small but the 90s are and will always be one of my favorites.",
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodySmall!
                                .copyWith(height: 1.80))),
                    SizedBox(height: 16.v),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "December 10, 2016",
                        style: CustomTextStyles.bodySmall10,
                      ),
                    ),
                  ]);
                },
                separatorBuilder: (context, index) => SizedBox(height: 10.v),
                itemCount: 5)),
        bottomNavigationBar: CustomElevatedButton(
            text: "Write Review",
            margin: EdgeInsets.only(left: 19.h, right: 13.h, bottom: 58.v),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.writeReviewFillScreen);
            }));
  }
}
