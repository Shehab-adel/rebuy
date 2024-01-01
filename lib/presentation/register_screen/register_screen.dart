import 'package:flutter/material.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/core/utils/value_manager.dart';
import 'package:rebuy/widgets/custom_elevated_button.dart';
import 'package:rebuy/widgets/custom_page_header_widget.dart';
import 'package:rebuy/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  TextEditingController fullNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController passwordController1 = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite.v,
                    padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.h),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomPageHeaderWidget(
                              text1: AppStrings.letsGetStarted,
                              text2: AppStrings.createAnNewAccount),
                          SizedBox(height: AppSize.s30.v),
                          CustomTextFormField(
                            controller: fullNameController,
                            hintText: AppStrings.fullName,
                            imagePath: AppImageConstants.imgUser,
                          ),
                          SizedBox(height: AppSize.s8.v),
                          CustomTextFormField(
                            controller: emailController,
                            hintText: AppStrings.yourEmail,
                            textInputType: TextInputType.emailAddress,
                            imagePath: AppImageConstants.imgMail,
                          ),
                          SizedBox(height: AppSize.s8.v),
                          CustomTextFormField(
                            controller: passwordController,
                            hintText: AppStrings.password,
                            textInputType: TextInputType.visiblePassword,
                            imagePath: AppImageConstants.imgLock,
                          ),
                          SizedBox(height: AppSize.s8.v),
                          CustomTextFormField(
                            controller: passwordController1,
                            hintText: AppStrings.passwordAgain,
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.visiblePassword,
                            imagePath: AppImageConstants.imgLock,
                          ),
                          SizedBox(height: AppSize.s20.v),
                          _buildSignUp(context),
                          SizedBox(height: AppSize.s20.v),
                          RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: AppStrings.haveanAccount,
                                    style: theme.textTheme.bodySmall),
                                TextSpan(text: " "),
                                TextSpan(
                                    text: AppStrings.signIn,
                                    style: CustomTextStyles.labelLargePrimary_1)
                              ]),
                              textAlign: TextAlign.left),
                          SizedBox(height: AppSize.s5.v)
                        ])))));
  }

  /// Section Widget
  Widget _buildSignUp(BuildContext context) {
    return CustomElevatedButton(
        text: AppStrings.signUp,
        onPressed: () {
          onTapSignUp(context);
        });
  }

  /// Navigates to the dashboardContainerScreen when the action is triggered.
  onTapSignUp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.dashboardContainerScreen);
  }
}
