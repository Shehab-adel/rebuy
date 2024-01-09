import 'package:flutter/material.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/dash_cubit.dart';
import 'package:rebuy/widgets/custom_icon_button.dart';

class DashCategoryWidget extends StatelessWidget {
  const DashCategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DashCubit dashCubit = DashCubit.get(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(right: 16),
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(AppStrings.category,
              style: theme.textTheme.titleSmall!
                  .copyWith(color: theme.colorScheme.onPrimary.withOpacity(1))),
          Text(AppStrings.seeMore,
              style: CustomTextStyles.titleSmallPrimary
                  .copyWith(color: theme.colorScheme.primary.withOpacity(1)))
        ]),
        SizedBox(height: 10.v),
        SizedBox(
            height: 108.v,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(width: 12.h),
                itemCount: dashCubit.categoryMap.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 70.h,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 15.v),
                      child: Column(
                        children: [
                          CustomIconButton(
                            height: 70.adaptSize,
                            width: 70.adaptSize,
                            padding: EdgeInsets.all(23.h),
                            child: CustomImageView(
                              imagePath:
                                  dashCubit.categoryMap.values.elementAt(index),
                            ),
                          ),
                          SizedBox(height: 7.v),
                          Text(
                            dashCubit.categoryMap.keys.elementAt(index),
                            style: CustomTextStyles.bodySmall10,
                          ),
                        ],
                      ),
                    ),
                  );
                }))
      ]),
    );
  }
}
