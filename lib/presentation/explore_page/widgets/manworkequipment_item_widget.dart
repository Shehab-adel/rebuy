import 'package:flutter/material.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class ManworkequipmentItemWidget extends StatelessWidget {
  const ManworkequipmentItemWidget(
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
        SizedBox(height: 8.v),
        Text(
          text,
          style: CustomTextStyles.labelMediumBluegray300,
        ),
      ],
    );
  }
}
