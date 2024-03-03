import 'package:flutter/material.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class AppbarTitleEdittextOne extends StatelessWidget {
  AppbarTitleEdittextOne({
    Key? key,
    this.hintText,
    this.controller,
    this.margin,
  }) : super(
    key: key,
  );

  String? hintText;

  TextEditingController? controller;

  EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: CustomTextFormField(
        width: 291.h,
        controller: controller,
        hintText: "Nike Air Max",
        prefix: Container(
          margin: EdgeInsets.fromLTRB(16.h, 12.v, 8.h, 14.v),
          child: CustomImageView(
            imagePath: AppImageConstants.imgSearch,
            height: 16.adaptSize,
            width: 16.adaptSize,
          ),
        ),
        prefixConstraints: BoxConstraints(
          maxHeight: 44.v,
        ),
        borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
        filled: false,
      ),
    );
  }
}
