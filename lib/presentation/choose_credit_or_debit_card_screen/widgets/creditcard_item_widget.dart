import 'package:flutter/material.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/presentation/choose_credit_or_debit_card_screen/cubit/choosecreditcubit.dart';

class CreditcardItemWidget extends StatelessWidget {
  const CreditcardItemWidget(
      {required this.chooseCreditCubit, required this.index});

  final ChooseCreditCubit chooseCreditCubit;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 21.h,
        vertical: 16.v,
      ),
      decoration: AppDecoration.fillPrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 7.v),
          CustomImageView(
            imagePath: AppImageConstants.imgVolume,
            height: 22.v,
            width: 36.h,
            margin: EdgeInsets.only(left: 3.h),
          ),
          SizedBox(height: 30.v),
          Text(
            "${chooseCreditCubit.creditcardItemList[index].cardNum}",
            style: theme.textTheme.headlineSmall,
          ),
          SizedBox(height: 17.v),
          Row(
            children: [
              Opacity(
                opacity: 0.5,
                child: Padding(
                  padding: EdgeInsets.only(top: 2.v),
                  child: Text(
                    "CARD HOLDER",
                    style: CustomTextStyles.bodySmallOnPrimaryContainer10,
                  ),
                ),
              ),
              Opacity(
                opacity: 0.5,
                child: Padding(
                  padding: EdgeInsets.only(left: 37.h),
                  child: Text(
                    "CARD SAVE",
                    style: CustomTextStyles.bodySmallOnPrimaryContainer10,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 9.v),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 2.v),
                child: Text(
                  "${chooseCreditCubit.creditcardItemList[index].cardName}",
                  style: CustomTextStyles.labelMediumOnPrimaryContainer,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 44.h,
                  top: 2.v,
                ),
                child: Text(
                  "${chooseCreditCubit.creditcardItemList[index].cardSave}",
                  style: CustomTextStyles.labelMediumOnPrimaryContainer,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
