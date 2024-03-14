import 'package:flutter/material.dart';
import 'package:rebuy/core/utils/app_export.dart';

import '../../../core/utils/theme/custom_button_style.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class CouponCodeRowWidget extends StatelessWidget {
  CouponCodeRowWidget({Key? key}) : super(key: key);
  TextEditingController cuponCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
          child: CustomTextFormField(
              controller: cuponCodeController,
              hintText: AppStrings.enterCuponCode,
              textInputAction: TextInputAction.done,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12.h, vertical: 19.v))),
      CustomElevatedButton(
          width: 87.h,
          text: AppStrings.apply,
          onPressed: () {},
          style: CustomButtonStyles.fillPrimary,
          buttonStyle: CustomTextStyles.labelLargeOnPrimaryContainer)
    ]);
  }
}
