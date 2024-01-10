import 'package:flutter/material.dart';
import 'package:rebuy/core/utils/size_utils.dart';

import '../../../core/utils/theme/app_decoration.dart';
import '../../../core/utils/theme/custom_text_style.dart';

class CuponPromotionWidget extends StatelessWidget {
  const CuponPromotionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 343.h,
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 17.v),
        decoration: AppDecoration.fillPrimary
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
        child: SizedBox(
            width: 201.h,
            child: Text("Use “MEGSL” Cupon For Get 90%off",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.titleMediumOnPrimaryContainer
                    .copyWith(height: 1.50))));
  }
}
