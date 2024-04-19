// import 'package:flutter/material.dart';
// import 'package:rebuy/core/utils/app_export.dart';
// import 'package:rebuy/presentation/profile_screen/cubit/profile_cubit.dart';
// import 'package:rebuy/widgets/custom_text_form_field.dart';

// class OldPasswordWidget extends StatelessWidget {
//   const OldPasswordWidget({super.key, required this.profileCubit});

//   final ProfileCubit profileCubit;

//   @override
//   Widget build(BuildContext context) {
//     return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//       Text("Old Password", style: theme.textTheme.titleSmall),
//       SizedBox(height: 12.v),
//       CustomTextFormField(
//           controller: profileCubit.oldPasswordController,
//           hintText: "•••••••••••••••••",
//           hintStyle: CustomTextStyles.labelLargeBluegray300,
//           textInputType: TextInputType.visiblePassword,
//           prefix: Container(
//               margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
//               child: CustomImageView(
//                   imagePath: AppImageConstants.imgLock,
//                   height: 24.adaptSize,
//                   width: 24.adaptSize)),
//           prefixConstraints: BoxConstraints(maxHeight: 48.v),
//           obscureText: true,
//           contentPadding: EdgeInsets.only(top: 15.v, right: 30.h, bottom: 15.v),
//           borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
//           filled: false)
//     ]);
//   }
// }
