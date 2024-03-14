import 'package:flutter/material.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/widgets/app_bar/appbar_leading_image.dart';
import 'package:rebuy/widgets/app_bar/appbar_subtitle.dart';
import 'package:rebuy/widgets/app_bar/appbar_trailing_image.dart';
import 'package:rebuy/widgets/app_bar/custom_app_bar.dart';

import '../super_flash_sale_screen/widgets/superflashsale_item_widget.dart';

class SuperFlashSaleScreen extends StatelessWidget {
  const SuperFlashSaleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 26.v),
                child: Column(children: [
                  _buildOfferBanner(context),
                  SizedBox(height: 16.v),
                  _buildSuperFlashSale(context)
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
            text: "Super Flash Sale", margin: EdgeInsets.only(left: 12.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: AppImageConstants.imgNavExplore,
              margin: EdgeInsets.fromLTRB(16.h, 14.v, 16.h, 17.v),
              onTap: () {
                onTapSearchIcon(context);
              })
        ]);
  }

  /// Section Widget
  Widget _buildOfferBanner(BuildContext context) {
    return SizedBox(
        height: 206.v,
        width: 343.h,
        child: Stack(alignment: Alignment.centerLeft, children: [
          CustomImageView(
              imagePath: AppImageConstants.imgPromotionImage,
              height: 206.v,
              width: 343.h,
              radius: BorderRadius.circular(5.h),
              alignment: Alignment.center),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 24.h),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 209.h,
                            child: Text("Super Flash Sale\n50% Off",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.headlineSmall!
                                    .copyWith(height: 1.50))),
                        SizedBox(height: 31.v),
                        Row(children: [
                          Container(
                              width: 42.h,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 9.h, vertical: 8.v),
                              decoration: AppDecoration.fillOnPrimaryContainer
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder5),
                              child: Text("08",
                                  style: theme.textTheme.titleMedium)),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 4.h, top: 10.v, bottom: 9.v),
                              child: Text(":",
                                  style: CustomTextStyles
                                      .titleSmallOnPrimaryContainer)),
                          Container(
                              width: 42.h,
                              margin: EdgeInsets.only(left: 4.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 9.h, vertical: 8.v),
                              decoration: AppDecoration.fillOnPrimaryContainer
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder5),
                              child: Text("34",
                                  style: theme.textTheme.titleMedium)),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 4.h, top: 10.v, bottom: 9.v),
                              child: Text(":",
                                  style: CustomTextStyles
                                      .titleSmallOnPrimaryContainer)),
                          Container(
                              width: 42.h,
                              margin: EdgeInsets.only(left: 4.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.h, vertical: 8.v),
                              decoration: AppDecoration.fillOnPrimaryContainer
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder5),
                              child: Text("52",
                                  style: theme.textTheme.titleMedium))
                        ])
                      ])))
        ]));
  }

  /// Section Widget
  Widget _buildSuperFlashSale(BuildContext context) {
    return Expanded(
        child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 283.v,
                crossAxisCount: 2,
                mainAxisSpacing: 13.h,
                crossAxisSpacing: 13.h),
            physics: BouncingScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              return SuperflashsaleItemWidget(onTapProductItem: () {
                onTapProductItem(context);
              });
            }));
  }

  /// Navigates to the productDetailScreen when the action is triggered.
  onTapProductItem(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.productDetailScreen);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the searchScreen when the action is triggered.
  onTapSearchIcon(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.searchScreen);
  }
}
