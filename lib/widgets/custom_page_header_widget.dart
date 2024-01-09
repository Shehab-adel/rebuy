import 'package:flutter/material.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/widgets/custom_icon_button.dart';

class CustomPageHeaderWidget extends StatelessWidget {
  const CustomPageHeaderWidget(
      {required this.text1, required this.text2, Key? key})
      : super(key: key);
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomIconButton(
          height: 72.adaptSize,
          width: 72.adaptSize,
          padding: EdgeInsets.all(20.h),
          decoration: IconButtonStyleHelper.fillPrimary,
          child: CustomImageView(imagePath: AppImageConstants.imgClose)),
      SizedBox(height: 16.v),
      Text(text1, style: theme.textTheme.titleMedium),
      SizedBox(height: 10.v),
      Text(text2, style: theme.textTheme.bodySmall)
    ]);
  }
}
