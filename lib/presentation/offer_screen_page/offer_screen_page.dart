import 'package:flutter/material.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/presentation/offer_screen_page/widgets/cupon_prom_widget.dart';
import 'package:rebuy/widgets/app_bar/appbar_title.dart';
import 'package:rebuy/widgets/app_bar/appbar_trailing_image.dart';
import 'package:rebuy/widgets/app_bar/custom_app_bar.dart';

import '../offer_screen_page/widgets/offerscreen_item_widget.dart';

class OfferScreen extends StatelessWidget {
  const OfferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 28.v),
                child: Column(children: [
                  CuponPromotionWidget(),
                  SizedBox(height: 16.v),
                  Expanded(
                      child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 16.v);
                          },
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return OfferscreenItemWidget();
                          }))
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        title: AppbarTitle(
            text: AppStrings.offer, margin: EdgeInsets.only(left: 16.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: AppImageConstants.imgNotificationIcon,
              margin: EdgeInsets.fromLTRB(13.h, 16.v, 13.h, 15.v),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.notificationScreen);
              })
        ]);
  }
}
