import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/dash_cubit.dart';

// ignore: must_be_immutable
class DashSliderWidget extends StatelessWidget {
  DashSliderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 16.h),
        child: CarouselSlider.builder(
            options: CarouselOptions(
                height: 206.v,
                initialPage: 0,
                autoPlay: true,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  DashCubit.get(context).changeAnimatedSmoothIdex(index);
                }),
            itemCount: 4,
            itemBuilder: (context, index, realIndex) {
              return SizedBox(
                height: 206.v,
                width: mediaQueryData.size.width,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    CustomImageView(
                      imagePath: AppImageConstants.imgPromotionImage,
                      height: 206.v,
                      width: mediaQueryData.size.width,
                      radius: BorderRadius.circular(
                        5.h,
                      ),
                      alignment: Alignment.center,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 24.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 206.h,
                              child: Text(
                                AppStrings.superFlashSaleOff,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.headlineSmall!.copyWith(
                                  height: 1.5,
                                ),
                              ),
                            ),
                            SizedBox(height: 30.v),
                            Row(
                              children: [
                                Container(
                                  width: 42.h,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 9.h,
                                    vertical: 8.v,
                                  ),
                                  decoration: AppDecoration
                                      .fillOnPrimaryContainer
                                      .copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder5,
                                  ),
                                  child: Text(
                                    "08",
                                    style: theme.textTheme.titleMedium,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 4.h,
                                    top: 10.v,
                                    bottom: 9.v,
                                  ),
                                  child: Text(
                                    ":",
                                    style: CustomTextStyles
                                        .titleSmallOnPrimaryContainer,
                                  ),
                                ),
                                Container(
                                  width: 42.h,
                                  margin: EdgeInsets.only(left: 4.h),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 9.h,
                                    vertical: 8.v,
                                  ),
                                  decoration: AppDecoration
                                      .fillOnPrimaryContainer
                                      .copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder5,
                                  ),
                                  child: Text(
                                    "34",
                                    style: theme.textTheme.titleMedium,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 4.h,
                                    top: 10.v,
                                    bottom: 9.v,
                                  ),
                                  child: Text(
                                    ":",
                                    style: CustomTextStyles
                                        .titleSmallOnPrimaryContainer,
                                  ),
                                ),
                                Container(
                                  width: 42.h,
                                  margin: EdgeInsets.only(left: 4.h),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.h,
                                    vertical: 8.v,
                                  ),
                                  decoration: AppDecoration
                                      .fillOnPrimaryContainer
                                      .copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder5,
                                  ),
                                  child: Text(
                                    "52",
                                    style: theme.textTheme.titleMedium,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
