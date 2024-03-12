import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/widgets/custom_rating_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductOverviewWidget extends StatelessWidget {
  const ProductOverviewWidget({Key? key}) : super(key: key);

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
              imagePath: AppImageConstants.imgProductImage238x375,
              height: 238.v,
              width: 375.h,
            );
          }),
      SizedBox(height: 16.v),
      Align(
          alignment: Alignment.center,
          child: SizedBox(
              height: 8.v,
              child: AnimatedSmoothIndicator(
                  activeIndex: 0,
                  count: 1,
                  axisDirection: Axis.horizontal,
                  effect: ScrollingDotsEffect(
                      spacing: 8,
                      activeDotColor: theme.colorScheme.primary.withOpacity(1),
                      dotColor: appTheme.blue50,
                      dotHeight: 8.v,
                      dotWidth: 8.h)))),
      SizedBox(height: 15.v),
      Align(
          alignment: Alignment.center,
          child: Padding(
              padding: EdgeInsets.only(left: 16.h, right: 25.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: SizedBox(
                            width: 275.h,
                            child: Text("Nike Air Zoom Pegasus 36 Miami",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.titleLargeOnPrimary
                                    .copyWith(height: 1.50)))),
                    CustomImageView(
                        imagePath: AppImageConstants.imgDownload,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                        margin:
                            EdgeInsets.only(left: 44.h, top: 2.v, bottom: 32.v))
                  ]))),
      SizedBox(height: 9.v),
      Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: CustomRatingBar(
            initialRating: 4,
            itemSize: 16,
            onRatingUpdate: (n) {},
          )),
      SizedBox(height: 16.v),
      Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: Text("299,43", style: theme.textTheme.titleLarge))
    ]);
  }
}
