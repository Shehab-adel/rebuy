import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/presentation/login_screen/cubit/login_cubit.dart';
import 'package:rebuy/presentation/login_screen/cubit/login_states.dart';
import 'package:rebuy/presentation/login_screen/widgets/build_or_line_widget.dart';
import 'package:rebuy/presentation/login_screen/widgets/social_auth_widget.dart';
import 'package:rebuy/widgets/custom_elevated_button.dart';
import 'package:rebuy/widgets/custom_page_header_widget.dart';
import 'package:rebuy/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = LoginCubit.get(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
            key: loginCubit.formKey,
            child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(left: 16.h, top: 68.v, right: 16.h),
                child: BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is SuccessfulLoginProcess) {
                      Navigator.pushReplacementNamed(
                          context, AppRoutes.dashboardContainerScreen);
                      loginCubit.loginshowDialog(context, 'Sign in successful!',
                          loginCubit.bodyMessage);
                    }
                    if (state is FailLoginProcess) {
                      loginCubit.loginshowDialog(
                          context, 'Sign in fail!', loginCubit.bodyMessage);
                    }
                    if (state is SuccessfulGoogleLoginProcess) {
                      Navigator.pushReplacementNamed(
                          context, AppRoutes.dashboardContainerScreen);
                      loginCubit.loginshowDialog(context, 'Sign in successful!',
                          loginCubit.bodyMessage);
                    }
                    if (state is FailGoogleLoginProcess) {
                      loginCubit.loginshowDialog(
                          context, 'Sign in fail!', loginCubit.bodyMessage);
                    }
                  },
                  builder: (context, state) {
                    return Column(children: [
                      CustomPageHeaderWidget(
                          text1: AppStrings.welcomeToEcom,
                          text2: AppStrings.signInToContinue),
                      SizedBox(height: 28.v),
                      CustomTextFormField(
                        controller: loginCubit.emailController,
                        hintText: AppStrings.yourEmail,
                        imagePath: AppImageConstants.imgMail,
                      ),
                      SizedBox(height: 10.v),
                      CustomTextFormField(
                        controller: loginCubit.passwordController,
                        hintText: AppStrings.password,
                        imagePath: AppImageConstants.imgLock,
                        obscureText: true,
                      ),
                      SizedBox(height: 16.v),
                      CustomElevatedButton(
                          text: AppStrings.signIn,
                          onPressed: () {
                            loginCubit.loginWithFirebaseAuth(context);
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
                            Navigator.pushNamedAndRemoveUntil(context,
                                AppRoutes.registerScreen, (route) => false);
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
                    ]);
                  },
                ))));
  }
}
