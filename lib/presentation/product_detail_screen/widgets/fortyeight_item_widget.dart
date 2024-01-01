import 'package:flutter/material.dart';
import 'package:rebuy/core/app_export.dart';

// ignore: must_be_immutable
class FortyeightItemWidget extends StatelessWidget {
  const FortyeightItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return CustomImageView(
      imagePath: AppImageConstants.imgProductImage238x375,
      height: 238.v,
      width: 375.h,
    );
  }
}
