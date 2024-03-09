import 'package:flutter/material.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/widgets/app_bar/appbar_leading_image.dart';
import 'package:rebuy/widgets/app_bar/appbar_subtitle.dart';
import 'package:rebuy/widgets/app_bar/custom_app_bar.dart';
import 'package:rebuy/widgets/custom_elevated_button.dart';
import 'package:rebuy/widgets/custom_rating_bar.dart';
import 'package:rebuy/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class WriteReviewFillScreen extends StatelessWidget {
  WriteReviewFillScreen({Key? key}) : super(key: key);

  TextEditingController addReviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
            leadingWidth: 40.h,
            leading: AppbarLeadingImage(
                imagePath: AppImageConstants.imgArrowLeftBlueGray300,
                margin: EdgeInsets.only(left: 16.h, top: 16.v, bottom: 15.v),
                onTap: () {
                  Navigator.pop(context);
                }),
            title: AppbarSubtitle(
                text: AppStrings.writeReview,
                margin: EdgeInsets.only(left: 12.h))),
        body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 27.v),
            child: Column(children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                    width: 343.h,
                    child: Text(AppStrings.plzWriteAllSatisfaction,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleSmall!
                            .copyWith(height: 1.50))),
                SizedBox(height: 13.v),
                CustomRatingBar(
                  initialRating: 5,
                  itemSize: 32,
                  onRatingUpdate: (n) {},
                )
              ]),
              SizedBox(height: 22.v),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(AppStrings.writeYourReview,
                    style: theme.textTheme.titleSmall),
                SizedBox(height: 13.v),
                CustomTextFormField(
                    controller: addReviewController,
                    hintText: AppStrings.addReview,
                    hintStyle: CustomTextStyles.labelLargeBluegray300,
                    textInputAction: TextInputAction.done,
                    maxLines: 8,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.h, vertical: 17.v))
              ]),
              SizedBox(height: 5.v)
            ])),
        bottomNavigationBar: CustomElevatedButton(
            text: AppStrings.writeReview,
            onPressed: () {},
            margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 34.v)));
  }
}
