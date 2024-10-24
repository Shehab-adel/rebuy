import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/dash_cubit.dart';
import 'package:rebuy/presentation/profile_screen/cubit/profile_cubit.dart';
import '../../../widgets/custom_rating_bar.dart';
import '../../dashboard_page/cubit/states.dart';

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
          //People rating
          Row(children: [
            CustomRatingBar(
              initialRating: 0,
              ignoreGestures: true,
              itemSize: 16,
              onRatingUpdate: (n) {},
            ),
            Padding(
                padding: EdgeInsets.only(left: 8.h),
                child: Text(
                    "${dashCubit.dataList?[dashCubit.selectedProductIndex].rating}",
                    style: CustomTextStyles.labelMediumBluegray300)),
            Padding(
                padding: EdgeInsets.only(left: 3.h),
                child: Text("(5 Review)", style: CustomTextStyles.bodySmall10))
          ]),
          SizedBox(height: 16.v),
          //User rating
          Row(children: [
            CustomImageView(
                imagePath: AppImageConstants.imgProfilePicture,
                height: 48.v,
                width: 48.h,
                radius: BorderRadius.circular(24.h)),
            Padding(
                padding: EdgeInsets.only(left: 16.h, top: 2.v, bottom: 4.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(ProfileCubit.get(context).fullName,
                          style: theme.textTheme.titleSmall),
                      SizedBox(height: 4.v),
                      BlocBuilder<DashCubit, DashState>(
                          builder: (context, state) {
                        return CustomRatingBar(
                          initialRating: dashCubit
                              .dataList?[dashCubit.selectedProductIndex].rating,
                          ignoreGestures: true,
                          itemSize: 16,
                          onRatingUpdate: (n) {},
                        );
                      }),
                    ])),
          ]),
          SizedBox(height: 18.v),
          //User review
          // BlocBuilder<DashCubit, DashState>(builder: (context, state) {
          //   return RichText(
          //     maxLines: 11,
          //     overflow: TextOverflow.ellipsis,
          //     text: TextSpan(children: [
          //       TextSpan(
          //           text:
          //               '${dashCubit.dataList?[dashCubit.selectedProductIndex].review}',
          //           style: theme.textTheme.bodySmall!.copyWith(height: 1.80.v)),
          //       WidgetSpan(
          //           child: InkWell(
          //         onTap: () {
          //           Navigator.pushNamed(
          //               context, AppRoutes.writeReviewFillScreen);
          //         },
          //         child: Text('  edit',
          //             style: TextStyle(
          //                 fontStyle: FontStyle.italic,
          //                 color: Colors.purple,
          //                 height: 1.v)),
          //       ))
          //     ]),
          //   );
          // }),
          SizedBox(height: 16.v),
          //Similar List
          SizedBox(
              height: 72.v,
              child: ListView.separated(
                  padding: EdgeInsets.only(right: 112.h),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 12.h);
                  },
                  itemCount: dashCubit.dataList?.length ?? 0,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 72.h,
                      child: CustomImageView(
                        imagePath: dashCubit.dataList?[index].image,
                        height: 72.v,
                        width: 72.h,
                        radius: BorderRadius.circular(
                          8.h,
                        ),
                      ),
                    );
                  })),
        ]));
  }
}
