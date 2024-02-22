import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/presentation/login_screen/cubit/login_cubit.dart';
import 'package:rebuy/presentation/login_screen/cubit/login_states.dart';
import 'package:rebuy/widgets/custom_elevated_button.dart';
import 'package:rebuy/widgets/custom_text_form_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = LoginCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Forget password', style: theme.textTheme.titleLarge),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'If you want to recover your account, then please provide your email ID blew..',
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(
                  height: 50.v,
                ),
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is SuccessfulForgetProcess) {
                      loginCubit.loginshowDialog(context, 'Check your email',
                          loginCubit.returnMessage!);
                    }
                    if (state is FailForgetProcess) {
                      loginCubit.loginshowDialog(
                          context, 'Failing ', loginCubit.returnMessage!);
                    }
                  },
                  builder: (context, state) => CustomTextFormField(
                    controller: loginCubit.forgetPasswordEmailController,
                    hintText: AppStrings.yourEmail,
                    imagePath: AppImageConstants.imgMail,
                  ),
                ),
                SizedBox(
                  height: 50.v,
                ),
                CustomElevatedButton(
                    onPressed: () {
                      loginCubit.resetPassword(context);
                    },
                    text: 'Send')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
