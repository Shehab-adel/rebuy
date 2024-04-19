import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/core/utils/functions.dart';
import 'package:rebuy/presentation/register_screen/cubit/register_cubit.dart';
import 'package:rebuy/presentation/register_screen/cubit/register_state.dart';
import 'package:rebuy/presentation/verify_email/verify_email_screen.dart';
import 'package:rebuy/widgets/custom_elevated_button.dart';
import 'package:rebuy/widgets/custom_page_header_widget.dart';
import 'package:rebuy/widgets/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RegisterCubit registerCubit = RegisterCubit.get(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
            key: registerCubit.formKey,
            child: Container(
                width: double.maxFinite.v,
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                  if (state is SuccessfulFireAuthRegisterProcess &&
                      state is SuccessfulFireStoreRegisterProcess) {
                    snackBar(registerCubit.message);
                  } else if (state is FailFireAuthRegisterProcess &&
                      state is FailFireStoreRegisterProcess) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(snackBar(registerCubit.message));
                  }
                }, builder: (context, state) {
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomPageHeaderWidget(
                            text1: AppStrings.letsGetStarted,
                            text2: AppStrings.createAnNewAccount),
                        SizedBox(height: 30.v),
                        CustomTextFormField(
                          controller: registerCubit.usernameController,
                          hintText: AppStrings.fullName,
                          imagePath: AppImageConstants.imgUser,
                          validator: (value) {
                            return registerCubit.isValidUsername(value);
                          },
                        ),
                        SizedBox(height: 8.v),
                        CustomTextFormField(
                          controller: registerCubit.emailController,
                          hintText: AppStrings.yourEmail,
                          imagePath: AppImageConstants.imgMail,
                          validator: (value) {
                            return registerCubit.validateEmail(value);
                          },
                        ),
                        SizedBox(height: 8.v),
                        CustomTextFormField(
                          controller: registerCubit.passwordController,
                          hintText: AppStrings.password,
                          imagePath: AppImageConstants.imgLock,
                          validator: (value) {
                            return validatePassword(value);
                          },
                        ),
                        SizedBox(height: 8.v),
                        CustomTextFormField(
                          controller: registerCubit.confirmPasswordController,
                          hintText: AppStrings.passwordAgain,
                          imagePath: AppImageConstants.imgLock,
                          validator: (value) {
                            return registerCubit.confirmPassword(value);
                          },
                        ),
                        SizedBox(height: 20.v),
                        state is LoadingFireAuthRegisterProcess ||
                                state is LoadingFireStoreRegisterProcess
                            ? Center(child: CircularProgressIndicator())
                            : CustomElevatedButton(
                                text: AppStrings.signUp,
                                onPressed: () {
                                  if (registerCubit.formKey.currentState!
                                          .validate() ==
                                      true) {
                                    registerCubit
                                        .registerWithFirebaseAuth(context);
                                  }
                                }),
                        SizedBox(height: 20.v),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      VerifyEmailScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Go to Check Email',
                              style: theme.textTheme.bodyMedium!.copyWith(
                                  color: appTheme.blueA200,
                                  decoration: TextDecoration.underline),
                            )),
                        SizedBox(height: 20.v),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(context,
                                AppRoutes.loginScreen, (route) => false);
                          },
                          child: RichText(
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
                        ),
                      ]);
                }))));
  }
}
