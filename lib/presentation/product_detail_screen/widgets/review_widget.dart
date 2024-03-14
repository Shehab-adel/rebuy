import 'package:flutter/material.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/network/local/cache%20helper.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/dash_cubit.dart';
import '../../../widgets/custom_rating_bar.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({required this.dashCubit});
  final DashCubit dashCubit;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(AppStrings.reviewProdcut,
                style: theme.textTheme.titleSmall!.copyWith(
                    color: theme.colorScheme.onPrimary.withOpacity(1))),
            Text(AppStrings.seeMore,
                style: CustomTextStyles.titleSmallPrimary
                    .copyWith(color: theme.colorScheme.primary.withOpacity(1)))
          ]),
          SizedBox(height: 8.v),
          Row(children: [
            CustomRatingBar(
              initialRating:
                  dashCubit.dataList?[dashCubit.selectedProductIndex].rating,
              ignoreGestures: true,
              itemSize: 16,
              onRatingUpdate: (n) {},
            ),
            Padding(
                padding: EdgeInsets.only(left: 8.h),
                child: Text("4.5",
                    style: CustomTextStyles.labelMediumBluegray300)),
            Padding(
                padding: EdgeInsets.only(left: 3.h),
                child: Text("(5 Review)", style: CustomTextStyles.bodySmall10))
          ]),
          SizedBox(height: 16.v),
          Row(children: [
            CustomImageView(
                imagePath: AppImageConstants.imgProfilePicture,
                height: 48.adaptSize,
                width: 48.adaptSize,
                radius: BorderRadius.circular(24.h)),
            Padding(
                padding: EdgeInsets.only(left: 16.h, top: 2.v, bottom: 4.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(CacheHelper.getDisplayName().toString(),
                          style: theme.textTheme.titleSmall),
                      SizedBox(height: 4.v),
                      CustomRatingBar(
                        initialRating: dashCubit
                            .dataList?[dashCubit.selectedProductIndex].rating,
                        ignoreGestures: true,
                        itemSize: 16,
                        onRatingUpdate: (n) {},
                      )
                    ]))
          ]),
          SizedBox(height: 18.v),
          SizedBox(
              width: 339.h,
              child: Text(
                  '${dashCubit.dataList?[dashCubit.selectedProductIndex].review}',
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall!.copyWith(height: 1.80))),
          SizedBox(height: 16.v),
          SizedBox(
              height: 72.v,
              child: ListView.separated(
                  padding: EdgeInsets.only(right: 112.h),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 12.h);
                  },
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 72.h,
                      child: CustomImageView(
                        imagePath: AppImageConstants.imgProductPicture02,
                        height: 72.adaptSize,
                        width: 72.adaptSize,
                        radius: BorderRadius.circular(
                          8.h,
                        ),
                      ),
                    );
                  })),
          SizedBox(height: 16.v),
          Text("December 10, 2016", style: CustomTextStyles.bodySmall10)
        ]));
  }
}
