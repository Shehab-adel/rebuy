import 'package:flutter/material.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/widgets/app_bar/appbar_leading_image.dart';
import 'package:rebuy/widgets/app_bar/appbar_subtitle.dart';
import 'package:rebuy/widgets/app_bar/custom_app_bar.dart';
import 'package:rebuy/widgets/custom_elevated_button.dart';
import '../credit_card_and_debit_screen/widgets/creditcardanddebit_item_widget.dart';

class CreditCardAndDebitScreen extends StatelessWidget {
  const CreditCardAndDebitScreen({Key? key}) : super(key: key);

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
                text: "Credit Card And Debit",
                margin: EdgeInsets.only(left: 12.h))),
        body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 9.v),
            child: Column(children: [
              SizedBox(height: 8.v),
              CreditcardanddebitItemWidget()
            ])),
        bottomNavigationBar: CustomElevatedButton(
            text: "Add Card",
            margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v),
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.addCardScreen);
            }));
  }
}
