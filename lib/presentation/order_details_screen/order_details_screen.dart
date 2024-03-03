import 'package:flutter/material.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/widgets/app_bar/appbar_leading_image.dart';
import 'package:rebuy/widgets/app_bar/appbar_subtitle.dart';
import 'package:rebuy/widgets/app_bar/custom_app_bar.dart';
import 'package:rebuy/widgets/custom_elevated_button.dart';
import 'package:rebuy/widgets/custom_icon_button.dart';
import '../order_details_screen/widgets/orderdetails_item_widget.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 10.v),
                child: Column(children: [
                  SizedBox(height: 27.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 15.h, right: 15.h, bottom: 5.v),
                              child: Column(children: [
                                _buildTracking(context),
                                SizedBox(height: 24.v),
                                _buildProduct(context),
                                SizedBox(height: 24.v),
                                _buildShippingDetails(context),
                                SizedBox(height: 46.v),
                                _buildPaymentDetails(context)
                              ]))))
                ])),
            bottomNavigationBar: _buildNotifyMe(context)));
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
            text: "Order Details", margin: EdgeInsets.only(left: 12.h)));
  }

  /// Section Widget
  Widget _buildTracking(BuildContext context) {
    return SizedBox(
        height: 57.v,
        width: 342.h,
        child: Stack(alignment: Alignment.center, children: [
          Align(
              alignment: Alignment.topCenter,
              child: Padding(
                  padding: EdgeInsets.only(top: 12.v),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                            width: 96.h,
                            child: Divider(
                                color:
                                    theme.colorScheme.primary.withOpacity(1))),
                        SizedBox(
                            width: 96.h,
                            child: Divider(
                                color:
                                    theme.colorScheme.primary.withOpacity(1))),
                        SizedBox(width: 96.h, child: Divider())
                      ]))),
          Align(
              alignment: Alignment.center,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: [
                      CustomIconButton(
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                          padding: EdgeInsets.all(8.h),
                          decoration: IconButtonStyleHelper.fillPrimaryTL12,
                          child: CustomImageView(
                              imagePath: AppImageConstants.imgPacing)),
                      SizedBox(height: 15.v),
                      Text("Packing", style: theme.textTheme.bodySmall)
                    ]),
                    Column(children: [
                      CustomIconButton(
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                          padding: EdgeInsets.all(8.h),
                          decoration: IconButtonStyleHelper.fillPrimaryTL12,
                          child: CustomImageView(
                              imagePath: AppImageConstants.imgPacing)),
                      SizedBox(height: 15.v),
                      Text("Shipping", style: theme.textTheme.bodySmall)
                    ]),
                    Column(children: [
                      CustomIconButton(
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                          padding: EdgeInsets.all(8.h),
                          decoration: IconButtonStyleHelper.fillPrimaryTL12,
                          child: CustomImageView(
                              imagePath: AppImageConstants.imgPacing)),
                      SizedBox(height: 15.v),
                      Text("Arriving", style: theme.textTheme.bodySmall)
                    ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                              imagePath: AppImageConstants.imgCheckmarkBlue50,
                              height: 24.adaptSize,
                              width: 24.adaptSize,
                              margin: EdgeInsets.only(left: 13.h)),
                          SizedBox(height: 13.v),
                          Text("Success", style: theme.textTheme.bodySmall)
                        ])
                  ]))
        ]));
  }

  /// Section Widget
  Widget _buildProduct(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: Text("Product", style: theme.textTheme.titleSmall)),
      SizedBox(height: 12.v),
      Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(height: 8.v);
              },
              itemCount: 2,
              itemBuilder: (context, index) {
                return OrderdetailsItemWidget();
              }))
    ]);
  }

  /// Section Widget
  Widget _buildShippingDetails(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: Text("Shipping Details", style: theme.textTheme.titleSmall)),
      SizedBox(height: 11.v),
      Container(
          margin: EdgeInsets.only(left: 2.h),
          padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 18.v),
          decoration: AppDecoration.outlineBlue
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            _buildShipping(context,
                shippingLabel: "Date Shipping",
                pOSReggular: "January 16, 2020"),
            SizedBox(height: 15.v),
            _buildShipping(context,
                shippingLabel: "Shipping", pOSReggular: "POS Reggular"),
            SizedBox(height: 14.v),
            _buildShipping(context,
                shippingLabel: "No. Resi", pOSReggular: "000192848573"),
            SizedBox(height: 15.v),
            _buildShipping(context,
                shippingLabel: "Address",
                pOSReggular: "2727 New  Owerri, Owerri, Imo State 78410")
          ]))
    ]);
  }

  /// Section Widget
  Widget _buildPaymentDetails(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 1.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 1.h),
              child:
                  Text("Payment Details", style: theme.textTheme.titleSmall)),
          SizedBox(height: 11.v),
          Container(
              padding: EdgeInsets.all(15.h),
              decoration: AppDecoration.outlineBlue
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildShipping1(context,
                        shippingLabel: "Items (3)", priceLabel: "598.86"),
                    SizedBox(height: 16.v),
                    _buildShipping1(context,
                        shippingLabel: "Shipping", priceLabel: "40.00"),
                    SizedBox(height: 14.v),
                    _buildShipping1(context,
                        shippingLabel: "Import charges", priceLabel: "128.00"),
                    SizedBox(height: 12.v),
                    Divider(),
                    SizedBox(height: 10.v),
                    _buildShipping1(context,
                        shippingLabel: "Total Price", priceLabel: "766.86")
                  ]))
        ]));
  }

  /// Section Widget
  Widget _buildNotifyMe(BuildContext context) {
    return CustomElevatedButton(
        text: "Notify Me",
        onPressed: () {},
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v));
  }

  /// Common widget
  Widget _buildShipping(
    BuildContext context, {
    required String shippingLabel,
    required String pOSReggular,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Opacity(
          opacity: 0.5,
          child: Text(shippingLabel,
              style: CustomTextStyles.bodySmallOnPrimary_1
                  .copyWith(color: theme.colorScheme.onPrimary))),
      Text(pOSReggular,
          style: CustomTextStyles.bodySmallOnPrimary
              .copyWith(color: theme.colorScheme.onPrimary.withOpacity(1)))
    ]);
  }

  /// Common widget
  Widget _buildShipping1(
    BuildContext context, {
    required String shippingLabel,
    required String priceLabel,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: EdgeInsets.only(top: 1.v),
          child: Text(shippingLabel,
              style: theme.textTheme.bodySmall!
                  .copyWith(color: appTheme.blueGray300))),
      Text(priceLabel,
          style: CustomTextStyles.bodySmallOnPrimary
              .copyWith(color: theme.colorScheme.onPrimary.withOpacity(1)))
    ]);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
