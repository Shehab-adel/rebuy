import 'package:flutter/material.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/presentation/change_password_screen/cubit/change_password_cubit.dart';
import 'package:rebuy/widgets/custom_text_form_field.dart';

class NewPasswordWidget extends StatelessWidget {
  const NewPasswordWidget({super.key, required this.changePasswordCubit});
  final ChangePasswordCubit changePasswordCubit;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("New Password", style: theme.textTheme.titleSmall),
      SizedBox(height: 12.v),
      CustomTextFormField(
          controller: changePasswordCubit.newpasswordController,
          hintText: "•••••••••••••••••",
          hintStyle: CustomTextStyles.labelLargeBluegray300,
          textInputType: TextInputType.visiblePassword,
          prefix: Container(
              margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
              child: CustomImageView(
                  imagePath: AppImageConstants.imgLock,
                  height: 24.adaptSize,
                  width: 24.adaptSize)),
          prefixConstraints: BoxConstraints(maxHeight: 48.v),
          obscureText: true,
          contentPadding: EdgeInsets.only(top: 15.v, right: 30.h, bottom: 15.v),
          borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
          filled: false)
    ]);
  }
}
