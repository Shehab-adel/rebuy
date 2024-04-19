import 'package:flutter/material.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/presentation/change_password_screen/cubit/change_password_cubit.dart';
import 'package:rebuy/presentation/change_password_screen/widgets/new_password_again.dart';
import 'package:rebuy/presentation/change_password_screen/widgets/new_password_widget.dart';
import 'package:rebuy/presentation/change_password_screen/widgets/old_password_widget.dart';
import 'package:rebuy/presentation/profile_screen/cubit/profile_cubit.dart';
import 'package:rebuy/widgets/app_bar/appbar_leading_image.dart';
import 'package:rebuy/widgets/app_bar/appbar_subtitle.dart';
import 'package:rebuy/widgets/app_bar/custom_app_bar.dart';
import 'package:rebuy/widgets/custom_elevated_button.dart';
import 'package:rebuy/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ChangePasswordCubit changePasswordCubit = ChangePasswordCubit.get(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
            leadingWidth: 40.h,
            leading: AppbarLeadingImage(
                imagePath: AppImageConstants.imgArrowLeftBlueGray300,
                margin: EdgeInsets.only(left: 16.h, top: 14.v, bottom: 17.v),
                onTap: () {
                  onTapArrowLeft(context);
                }),
            title: AppbarSubtitle(
                text: "Change Password", margin: EdgeInsets.only(left: 12.h))),
        body: Form(
            key: _formKey,
            child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 26.v),
                child: Column(children: [
                  OldPasswordWidget(changePasswordCubit: changePasswordCubit),
                  SizedBox(height: 23.v),
                  NewPasswordWidget(changePasswordCubit: changePasswordCubit),
                  SizedBox(height: 24.v),
                  NewPasswordAgainWidget(
                      changePasswordCubit: changePasswordCubit),
                  SizedBox(height: 5.v)
                ]))),
        bottomNavigationBar: _buildSave(context));
  }

  /// Section Widget
  Widget _buildSave(BuildContext context) {
    return CustomElevatedButton(
        text: "Save",
        onPressed: () {},
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
