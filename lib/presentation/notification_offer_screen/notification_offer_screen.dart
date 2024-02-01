import 'package:flutter/material.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/widgets/app_bar/appbar_leading_image.dart';
import 'package:rebuy/widgets/app_bar/appbar_subtitle.dart';
import 'package:rebuy/widgets/app_bar/custom_app_bar.dart';
import 'widgets/offer_body.dart';

class NotificationOfferScreen extends StatelessWidget {
  const NotificationOfferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            leadingWidth: 40.h,
            leading: AppbarLeadingImage(
                imagePath: AppImageConstants.imgArrowLeftBlueGray300,
                margin: EdgeInsets.only(left: 16.h, top: 16.v, bottom: 15.v),
                onTap: () {
                  Navigator.of(context).pop();
                }),
            title: AppbarSubtitle(
                text: AppStrings.notification,
                margin: EdgeInsets.only(left: 12.h))),
        body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 12.v),
            child: Column(children: [
              OfferBody(
                  offerTitle: "The Best Title",
                  offerDescription:
                      "Culpa cillum consectetur labore nulla nulla magna irure. Id veniam culpa officia aute dolor amet deserunt ex proident commodo",
                  offerTime: "April 30, 2014 1:01 PM"),
              OfferBody(
                  offerTitle: "SUMMER OFFER 98% Cashback",
                  offerDescription:
                      "Culpa cillum consectetur labore nulla nulla magna irure. Id veniam culpa officia aute dolor amet deserunt ex proident commodo",
                  offerTime: "April 30, 2014 1:01 PM"),
              SizedBox(height: 5.v),
              OfferBody(
                  offerTitle: "Special Offer 25% OFF",
                  offerDescription:
                      "Culpa cillum consectetur labore nulla nulla magna irure. Id veniam culpa officia aute dolor amet deserunt ex proident commodo",
                  offerTime: "April 30, 2014 1:01 PM")
            ])));
  }
}
