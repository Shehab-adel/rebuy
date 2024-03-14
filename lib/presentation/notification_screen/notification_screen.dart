import 'package:flutter/material.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/presentation/notification_screen/widgets/notification_option_row.dart';
import 'package:rebuy/widgets/app_bar/appbar_leading_image.dart';
import 'package:rebuy/widgets/app_bar/appbar_subtitle.dart';
import 'package:rebuy/widgets/app_bar/custom_app_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            leadingWidth: 40.h,
            leading: AppbarLeadingImage(
                imagePath: AppImageConstants.imgArrowLeftBlueGray300,
                margin: EdgeInsets.only(left: 16.h, top: 16.v, bottom: 15.v),
                onTap: () {
                  Navigator.pop(context);
                }),
            title: AppbarSubtitle(
                text: AppStrings.notification,
                margin: EdgeInsets.only(left: 12.h))),
        body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 12.v),
            child: Column(children: [
              NotificationOptionRow(
                  imagePath: AppImageConstants.imgOffer,
                  text: AppStrings.offer,
                  onTap: () {
                    Navigator.pushNamed(
                        context, AppRoutes.notificationOfferScreen);
                  }),
              NotificationOptionRow(
                  imagePath: AppImageConstants.imgListIcon,
                  text: AppStrings.feed,
                  onTap: () {
                    Navigator.pushNamed(
                        context, AppRoutes.notificationFeedScreen);
                  }),
              SizedBox(height: 5.v),
              NotificationOptionRow(
                  imagePath: AppImageConstants.imgNotificationIconPrimary,
                  text: AppStrings.acivity,
                  onTap: () {
                    Navigator.pushNamed(
                        context, AppRoutes.notificationActivityScreen);
                  })
            ])));
  }
}
