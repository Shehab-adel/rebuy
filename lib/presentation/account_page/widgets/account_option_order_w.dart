import 'package:flutter/material.dart';
import 'package:rebuy/core/utils/app_export.dart';

class AccountOptionOrderWidget extends StatelessWidget {
  const AccountOptionOrderWidget(
      {required this.bagIconImage,
      required this.orderText,
      this.onTapAccountOptionOrder,
      Key? key})
      : super(key: key);
  final String bagIconImage;
  final String orderText;
  final Function? onTapAccountOptionOrder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTapAccountOptionOrder!.call();
        },
        child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(16.h),
            decoration: AppDecoration.fillOnPrimaryContainer,
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomImageView(
                  imagePath: bagIconImage,
                  height: 24.adaptSize,
                  width: 24.adaptSize),
              Padding(
                  padding: EdgeInsets.only(left: 16.h, top: 2.v, bottom: 3.v),
                  child: Text(orderText,
                      style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.onPrimary.withOpacity(1))))
            ])));
  }
}
