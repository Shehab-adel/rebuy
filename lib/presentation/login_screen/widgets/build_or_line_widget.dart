import 'package:flutter/material.dart';
import 'package:rebuy/core/constants/app_string.dart';
import 'package:rebuy/core/utils/size_utils.dart';
import 'package:rebuy/core/utils/theme/custom_text_style.dart';
import 'package:rebuy/core/utils/value_manager.dart';

class OrLineWidget extends StatelessWidget {
  const OrLineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding:
              EdgeInsets.only(top: AppPadding.p10.v, bottom: AppPadding.p9.v),
          child: SizedBox(width: AppSize.s134.h, child: Divider())),
      Text(AppStrings.or, style: CustomTextStyles.titleSmallBluegray300_1),
      Padding(
          padding:
              EdgeInsets.only(top: AppPadding.p10.v, bottom: AppPadding.p9.v),
          child: SizedBox(width: 137.h, child: Divider()))
    ]);
  }
}
