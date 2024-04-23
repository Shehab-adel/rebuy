import 'package:flutter/material.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/presentation/add_card_screen/cubit/add_card_cubit.dart';
import 'package:rebuy/presentation/add_card_screen/widgets/custom_add_card_textformfield.dart';
import 'package:rebuy/widgets/app_bar/appbar_leading_image.dart';
import 'package:rebuy/widgets/app_bar/appbar_subtitle.dart';
import 'package:rebuy/widgets/app_bar/custom_app_bar.dart';
import 'package:rebuy/widgets/custom_elevated_button.dart';

class AddCardScreen extends StatelessWidget {
  AddCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddCardCubit addCardCubit = AddCardCubit.get(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
            leadingWidth: 40.h,
            leading: AppbarLeadingImage(
                imagePath: AppImageConstants.imgArrowLeftBlueGray300,
                margin: EdgeInsets.only(left: 16.h, top: 15.v, bottom: 16.v),
                onTap: () {
                  Navigator.pop(context);
                }),
            title: AppbarSubtitle(
                text: "Add Card", margin: EdgeInsets.only(left: 12.h))),
        body: Form(
            key: addCardCubit.formKey,
            child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 27.v),
                child: Column(children: [
                  CustomAddCardTextFormField(
                      addCardCubit: addCardCubit,
                      textEditingController: addCardCubit.cardNumberController,
                      title: 'Card Number',
                      hintText: "Enter Card Number"),
                  SizedBox(height: 24.v),
                  CustomAddCardTextFormField(
                      addCardCubit: addCardCubit,
                      textEditingController:
                          addCardCubit.expirationDateController,
                      title: "Expiration Date",
                      hintText: "Expiration Date"),
                  SizedBox(height: 29.v),
                  CustomAddCardTextFormField(
                      addCardCubit: addCardCubit,
                      textEditingController:
                          addCardCubit.securityCodeController,
                      title: "Security Code",
                      hintText: "Security Code"),
                  SizedBox(height: 23.v),
                  CustomAddCardTextFormField(
                      addCardCubit: addCardCubit,
                      textEditingController: addCardCubit.cardHolderController,
                      title: "Card Holder",
                      hintText: "Enter Card Number"),
                  SizedBox(height: 5.v)
                ]))),
        bottomNavigationBar: CustomElevatedButton(
            text: "Add Card",
            margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.creditCardAndDebitScreen);
            }));
  }
}
