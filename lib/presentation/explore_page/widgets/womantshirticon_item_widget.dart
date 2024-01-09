import 'package:flutter/material.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class WomantshirticonItemWidget extends StatelessWidget {
  const WomantshirticonItemWidget(
      {Key? key, required this.imagePath, required this.text})
      : super(
          key: key,
        );
  final String imagePath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomIconButton(
          height: 70.adaptSize,
          width: 70.adaptSize,
          padding: EdgeInsets.all(23.h),
          child: CustomImageView(
            imagePath: imagePath,
          ),
        ),
        SizedBox(height: 7.v),
        Text(
          text,
          style: CustomTextStyles.labelMediumBluegray300,
        ),
      ],
    );
  }
}
