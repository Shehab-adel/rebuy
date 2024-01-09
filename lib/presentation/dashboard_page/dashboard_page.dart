import 'package:flutter/material.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/presentation/dashboard_page/widgets/bottom_common_category.dart';
import 'package:rebuy/presentation/dashboard_page/widgets/category_widget.dart';
import 'package:rebuy/presentation/dashboard_page/widgets/dash_slider_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'widgets/fsnikeairmax_item_widget.dart';
import 'widgets/msnikeairmax_item_widget.dart';

// ignore_for_file: must_be_immutable
class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);

  int sliderIndex = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mediaQueryData.size.width,
      child: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(left: 16.h, bottom: 5.v),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              DashSliderWidget(
                sliderIndex: sliderIndex,
              ),
              SizedBox(height: 16.v),
              //Three animated smooth
              Container(
                  height: 8.v,
                  margin: EdgeInsets.only(left: 135.h),
                  child: AnimatedSmoothIndicator(
                      activeIndex: sliderIndex,
                      count: 4,
                      axisDirection: Axis.horizontal,
                      effect: ScrollingDotsEffect(
                          spacing: 10,
                          activeDotColor:
                              theme.colorScheme.primary.withOpacity(1),
                          dotColor: appTheme.blue50,
                          dotHeight: 8.v,
                          dotWidth: 8.h))),
              SizedBox(height: 25.v),
              //Categories
              DashCategoryWidget(),
              SizedBox(height: 23.v),
              //Flash Sale
              Padding(
                  padding: EdgeInsets.only(right: 16.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppStrings.flashSale,
                            style: theme.textTheme.titleSmall!.copyWith(
                                color: theme.colorScheme.onPrimary
                                    .withOpacity(1))),
                        Text(AppStrings.seeMore,
                            style: CustomTextStyles.titleSmallPrimary.copyWith(
                                color:
                                    theme.colorScheme.primary.withOpacity(1)))
                      ])),
              SizedBox(height: 12.v),
              SizedBox(
                  height: 238.v,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 16.h),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return FsnikeairmaxItemWidget(onTapProductItem: () {
                          Navigator.pushNamed(
                              context, AppRoutes.productDetailScreen);
                        });
                      })),
              SizedBox(height: 23.v),
              Padding(
                  padding: EdgeInsets.only(right: 16.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppStrings.megaSale,
                            style: theme.textTheme.titleSmall!.copyWith(
                                color: theme.colorScheme.onPrimary
                                    .withOpacity(1))),
                        Text(AppStrings.seeMore,
                            style: CustomTextStyles.titleSmallPrimary.copyWith(
                                color:
                                    theme.colorScheme.primary.withOpacity(1)))
                      ])),
              SizedBox(height: 10.v),
              SizedBox(
                  height: 238.v,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 16.h);
                      },
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return MsnikeairmaxItemWidget();
                      })),
              SizedBox(height: 29.v),
              CustomImageView(
                  imagePath: AppImageConstants.imgRecomendedProduct,
                  height: 206.v,
                  width: 343.h,
                  radius: BorderRadius.circular(5.h)),
              SizedBox(height: 16.v),
              BottomCommonCategory()
            ])),
      ),
    );
  }
}
