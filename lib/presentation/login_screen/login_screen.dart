import 'package:flutter/material.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/presentation/login_screen/widgets/build_or_line_widget.dart';
import 'package:rebuy/presentation/login_screen/widgets/social_auth_widget.dart';
import 'package:rebuy/widgets/custom_elevated_button.dart';
import 'package:rebuy/widgets/custom_page_header_widget.dart';
import 'package:rebuy/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

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
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.only(left: 16.h, top: 68.v, right: 16.h),
                    child: Column(children: [
                      CustomPageHeaderWidget(
                          text1: AppStrings.welcomeToEcom,
                          text2: AppStrings.signInToContinue),
                      SizedBox(height: 28.v),
                      CustomTextFormField(
                        controller: emailController,
                        hintText: AppStrings.yourEmail,
                        textInputType: TextInputType.emailAddress,
                        imagePath: AppImageConstants.imgMail,
                      ),
                      SizedBox(height: 10.v),
                      CustomTextFormField(
                        controller: passwordController,
                        hintText: AppStrings.password,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.visiblePassword,
                        imagePath: AppImageConstants.imgLock,
                        obscureText: true,
                      ),
                      SizedBox(height: 16.v),
                      CustomElevatedButton(
                          text: AppStrings.signIn,
                          onPressed: () {
                            onTapSignIn(context);
                          }),
                      SizedBox(height: 18.v),
                      OrLineWidget(),
                      SizedBox(height: 16.v),
                      SocialAuthWidget(),
                      SizedBox(height: 17.v),
                      Text(AppStrings.forgotPassword,
                          style: CustomTextStyles.labelLargePrimary),
                      SizedBox(height: 7.v),
                      GestureDetector(
                          onTap: () {
                            onTapTxtDonthaveanaccount(context);
                          },
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: AppStrings.dontHaveAnAccount,
                                    style: theme.textTheme.bodySmall),
                                TextSpan(text: " "),
                                TextSpan(
                                    text: AppStrings.register,
                                    style: CustomTextStyles.labelLargePrimary_1)
                              ]),
                              textAlign: TextAlign.left)),
                      SizedBox(height: 5.v)
                    ])))));
  }

  /// Navigates to the dashboardContainerScreen when the action is triggered.
  onTapSignIn(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.dashboardContainerScreen);
  }

  /// Navigates to the registerScreen when the action is triggered.
  onTapTxtDonthaveanaccount(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.registerScreen);
  }
}
