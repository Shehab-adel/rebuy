import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/dash_cubit.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/states.dart';
import 'package:rebuy/widgets/custom_icon_button.dart';

class DashCategoryWidget extends StatelessWidget {
  const DashCategoryWidget({required this.dashCubit});
  final DashCubit dashCubit;
  @override
  Widget build(BuildContext context) {
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
                itemCount: dashCubit.categoryList.length,
                itemBuilder: (context, index) {
                  return BlocConsumer<DashCubit, DashState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          dashCubit.changeCategoryName(
                              dashCubit.categoryList[index]);
                          Navigator.pushNamed(
                              context, AppRoutes.showCategoryProductsScreen);
                          dashCubit.fetchDataFromFirestore();
                        },
                        child: SizedBox(
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
                                        dashCubit.categoryImageList[index],
                                  ),
                                ),
                                SizedBox(height: 7.v),
                                Text(
                                  dashCubit.categoryList[index],
                                  style: CustomTextStyles.bodySmall10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }))
      ]),
    );
  }
}
