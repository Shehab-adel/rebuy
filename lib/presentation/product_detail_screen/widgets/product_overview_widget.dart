import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/widgets/custom_rating_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../dashboard_page/cubit/dash_cubit.dart';

class ProductOverviewWidget extends StatelessWidget {
  const ProductOverviewWidget({required this.dashCubit});
  final DashCubit dashCubit;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CarouselSlider.builder(
          options: CarouselOptions(
              height: 238.v,
              initialPage: 0,
              autoPlay: true,
              viewportFraction: 1.0,
              enableInfiniteScroll: false,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {}),
          itemCount: 1,
          itemBuilder: (context, index, realIndex) {
            return CustomImageView(
              imagePath:
                  dashCubit.dataList?[dashCubit.selectedProductIndex].image ??
                      '',
              height: 238.v,
              width: 375.h,
            );
          }),
      SizedBox(height: 16.v),
      Container(
          height: 8.v,
          alignment: Alignment.center,
          child: AnimatedSmoothIndicator(
              activeIndex: 0,
              count: 1,
              axisDirection: Axis.horizontal,
              effect: ScrollingDotsEffect(
                  spacing: 8,
                  activeDotColor: theme.colorScheme.primary.withOpacity(1),
                  dotColor: appTheme.blue50,
                  dotHeight: 8.v,
                  dotWidth: 8.h))),
      SizedBox(height: 15.v),
      //Row title
      Container(
          padding: EdgeInsets.only(left: 16.h, right: 25.h),
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
            initialRating: 4,
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
