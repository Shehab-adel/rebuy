import 'package:flutter/material.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/widgets/custom_rating_bar.dart';
import '../../dashboard_page/cubit/dash_cubit.dart';

class ProductOverviewWidget extends StatelessWidget {
  const ProductOverviewWidget({required this.dashCubit});
  final DashCubit dashCubit;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      CustomImageView(
        imagePath:
            dashCubit.dataList?[dashCubit.selectedProductIndex].image ?? '',
        height: 280.v,
        fit: BoxFit.contain,
      ),
      SizedBox(height: 16.v),
      //Row title
      Container(
          padding: EdgeInsets.symmetric(horizontal: 14.h),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: SizedBox(
                        width: 275.h,
                        child: Text(
                            dashCubit.dataList?[dashCubit.selectedProductIndex]
                                    .title ??
                                '',
                            maxLines: 7,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles.titleLargeOnPrimary
                                .copyWith(height: 1.50)))),
                CustomImageView(
                    imagePath: AppImageConstants.imgDownload,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    margin: EdgeInsets.only(left: 44.h, top: 2.v, bottom: 32.v))
              ])),
      SizedBox(height: 9.v),
      //Rating
      Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: CustomRatingBar(
            initialRating:
                dashCubit.dataList?[dashCubit.selectedProductIndex].rating,
            ignoreGestures: true,
            itemSize: 16,
            onRatingUpdate: (n) {},
          )),
      SizedBox(height: 16.v),
      //Price and old price
      Padding(
        padding: EdgeInsets.only(left: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${dashCubit.dataList?[dashCubit.selectedProductIndex].price}',
                style: theme.textTheme.titleLarge),
            SizedBox(height: 10.v),
            dashCubit.dataList?[dashCubit.selectedProductIndex].price ==
                    dashCubit.dataList?[dashCubit.selectedProductIndex].oldPrice
                ? Text(
                    "No Disccount",
                    style: CustomTextStyles.bodySmall10
                        .copyWith(fontSize: 15.fSize, color: Colors.red),
                  )
                : Row(
                    children: [
                      Text(
                        "${dashCubit.dataList?[dashCubit.selectedProductIndex].oldPrice}",
                        style: CustomTextStyles.bodySmall10.copyWith(
                          fontSize: 15.fSize,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: 16.h),
                      Text(
                        "${dashCubit.dataList?[dashCubit.selectedProductIndex].disccountPrecentage} %",
                        style: theme.textTheme.labelMedium,
                      ),
                    ],
                  )
          ],
        ),
      ),
    ]);
  }
}
