import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/presentation/change_password_screen/widgets/new_password_again.dart';
import 'package:rebuy/presentation/change_password_screen/widgets/new_password_widget.dart';
import 'package:rebuy/presentation/profile_screen/cubit/profile_cubit.dart';
import 'package:rebuy/presentation/profile_screen/cubit/profile_state.dart';
import 'package:rebuy/widgets/app_bar/appbar_leading_image.dart';
import 'package:rebuy/widgets/app_bar/appbar_subtitle.dart';
import 'package:rebuy/widgets/app_bar/custom_app_bar.dart';
import 'package:rebuy/widgets/custom_elevated_button.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileCubit profileCubit = ProfileCubit.get(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
            leadingWidth: 40.h,
            leading: AppbarLeadingImage(
                imagePath: AppImageConstants.imgArrowLeftBlueGray300,
                margin: EdgeInsets.only(left: 16.h, top: 14.v, bottom: 17.v),
                onTap: () {
                  Navigator.pop(context);
                }),
            title: AppbarSubtitle(
                text: "Change Password", margin: EdgeInsets.only(left: 12.h))),
        body: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is LoadingChangePassword) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Center(
                        child: Lottie.asset(AppImageConstants.lottieLoading,
                            backgroundLoading: true));
                  });
            } else if (state is SuccessfulChangePassword) {
              Navigator.pop(context);
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Center(
                        child:
                            Lottie.asset(AppImageConstants.lottieSuccessful));
                  });
              Future.delayed(Duration(seconds: 3), () {
                Navigator.pop(context);
              });
            } else if (state is FailChangePassword) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Center(
                        child: Lottie.asset(AppImageConstants.lottieFail));
                  });
              Future.delayed(Duration(seconds: 3), () {
                Navigator.pop(context);
              });
            }
          },
          builder: (context, state) {
            return Form(
                key: profileCubit.formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.h, vertical: 26.v),
                    child: Column(children: [
                      // OldPasswordWidget(changePasswordCubit: changePasswordCubit),
                      // SizedBox(height: 23.v),
                      NewPasswordWidget(changePasswordCubit: profileCubit),
                      SizedBox(height: 24.v),
                      NewPasswordAgainWidget(profileCubit: profileCubit),
                    ])));
          },
        ),
        bottomNavigationBar: CustomElevatedButton(
            text: "Save",
            onPressed: () {
              if (profileCubit.formKey.currentState!.validate()) {
                profileCubit.changePassword();
              }
            },
            margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v)));
  }
}
