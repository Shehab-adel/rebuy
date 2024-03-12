import 'package:flutter/material.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/presentation/product_detail_screen/widgets/product_overview_widget.dart';
import 'package:rebuy/presentation/product_detail_screen/widgets/review_widget.dart';
import 'package:rebuy/presentation/product_detail_screen/widgets/select_size_widget.dart';
import 'package:rebuy/presentation/product_detail_screen/widgets/specifications_widget.dart';
import 'package:rebuy/presentation/product_detail_screen/widgets/you_might_also_like_widget.dart';
import 'package:rebuy/widgets/app_bar/appbar_leading_image.dart';
import 'package:rebuy/widgets/app_bar/appbar_subtitle.dart';
import 'package:rebuy/widgets/app_bar/appbar_trailing_image.dart';
import 'package:rebuy/widgets/app_bar/custom_app_bar.dart';
import 'package:rebuy/widgets/custom_elevated_button.dart';
import '../product_detail_screen/widgets/recomended_item_widget.dart';

// ignore_for_file: must_be_immutable
class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({Key? key}) : super(key: key);

  int sliderIndex = 1;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 14.v),
              child: Column(children: [
                SizedBox(height: 12.v),
                Column(children: [
                  ProductOverviewWidget(),
                  SizedBox(height: 42.v),
                  SelectSizeWidget(),
                  SizedBox(height: 53.v),
                  SpecificationsWidget(),
                  SizedBox(height: 53.v),
                  ReviewWidget(),
                  SizedBox(height: 53.v),
                  YouMightAlsoLike(),
                  SizedBox(height: 30.v),
                ])
              ])),
        ),
        bottomNavigationBar: _buildAddToCart(context));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: AppImageConstants.imgArrowLeftBlueGray300,
            margin: EdgeInsets.only(left: 16.h, top: 16.v, bottom: 15.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "Nike Air Max 270 Rea...",
            margin: EdgeInsets.only(left: 12.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: AppImageConstants.imgNavExplore,
              margin: EdgeInsets.only(left: 16.h, top: 16.v, right: 15.h),
              onTap: () {
                onTapSearchIcon(context);
              }),
          AppbarTrailingImage(
              imagePath: AppImageConstants.imgMoreIcon,
              margin: EdgeInsets.only(left: 16.h, top: 16.v, right: 31.h))
        ]);
  }

  // /// Section Widget
  // Widget _buildSelectColor(BuildContext context) {
  //   return Container(
  //       padding: EdgeInsets.symmetric(horizontal: 9.h),
  //       child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
  //         Padding(
  //             padding: EdgeInsets.only(left: 7.h),
  //             child: Text("Select Color", style: theme.textTheme.titleSmall)),
  //         SizedBox(height: 12.v),
  //         CustomImageView(
  //             imagePath: AppImageConstants.imgColors,
  //             height: 48.v,
  //             width: 359.h,
  //             margin: EdgeInsets.only(left: 7.h))
  //       ]));
  // }

  /// Section Widget
  Widget _buildAddToCart(BuildContext context) {
    return CustomElevatedButton(
        text: "Add To Cart",
        onPressed: () {},
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the searchScreen when the action is triggered.
  onTapSearchIcon(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.searchScreen);
  }

  /// Navigates to the reviewProductScreen when the action is triggered.
  onTapTxtSeeMoreLink(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.reviewProductScreen);
  }
}
