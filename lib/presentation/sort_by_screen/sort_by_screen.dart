import 'package:flutter/material.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/widgets/app_bar/appbar_leading_image.dart';
import 'package:rebuy/widgets/app_bar/appbar_subtitle.dart';
import 'package:rebuy/widgets/app_bar/custom_app_bar.dart';

class SortByScreen extends StatelessWidget {
  const SortByScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 28.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Best Match",
                          style: CustomTextStyles.labelLargePrimary),
                      SizedBox(height: 37.v),
                      Text("Time: ending soonest",
                          style: theme.textTheme.labelLarge),
                      SizedBox(height: 35.v),
                      Text("Time: newly listed",
                          style: theme.textTheme.labelLarge),
                      SizedBox(height: 36.v),
                      Text("Price + Shipping: lowest first",
                          style: theme.textTheme.labelLarge),
                      SizedBox(height: 36.v),
                      Text("Price + Shipping: highest first",
                          style: theme.textTheme.labelLarge),
                      SizedBox(height: 34.v),
                      Text("Distance: nearest first",
                          style: theme.textTheme.labelLarge),
                      SizedBox(height: 5.v)
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: AppImageConstants.imgArrowLeftBlueGray300,
            margin: EdgeInsets.only(left: 16.h, top: 14.v, bottom: 17.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "Sort By", margin: EdgeInsets.only(left: 12.h)));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
