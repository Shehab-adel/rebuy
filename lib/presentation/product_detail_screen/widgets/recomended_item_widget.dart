import 'package:flutter/material.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/dash_cubit.dart';

// ignore: must_be_immutable
class RecomendedItemWidget extends StatelessWidget {
  const RecomendedItemWidget({required this.dashCubit, required this.index});
  final DashCubit dashCubit;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 141.h,
      alignment: Alignment.centerRight,
      padding: EdgeInsets.all(15.h),
      decoration: AppDecoration.outlineBlue.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: dashCubit.dataList?[index].image,
            height: 109.v,
            width: 109.h,
            radius: BorderRadius.circular(
              5.h,
            ),
          ),
          SizedBox(height: 7.v),
          SizedBox(
            width: 105.h,
            child: Text(
              '${dashCubit.dataList?[index].title}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.labelLarge!.copyWith(
                height: 1.50,
              ),
            ),
          ),
          SizedBox(height: 11.v),
          Text(
            "${dashCubit.dataList?[index].price}",
            style: CustomTextStyles.labelLargePrimary,
          ),
          SizedBox(height: 9.v),
          Row(
            children: [
              Text(
                "${dashCubit.dataList?[index].oldPrice}",
                style: CustomTextStyles.bodySmall10.copyWith(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.h),
                child: Text(
                  "${dashCubit.dataList?[index].disccountPrecentage}",
                  style: theme.textTheme.labelMedium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
