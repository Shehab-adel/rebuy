import 'package:flutter/material.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/widgets/app_bar/appbar_leading_image.dart';
import 'package:rebuy/widgets/app_bar/appbar_subtitle.dart';
import 'package:rebuy/widgets/app_bar/custom_app_bar.dart';

import '../favorite_product_screen/widgets/favoriteproduct_item_widget.dart';

class FavoriteProductScreen extends StatelessWidget {
  const FavoriteProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(context),
        body: Padding(
            padding: EdgeInsets.only(left: 16.h, top: 8.v, right: 16.h),
            child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 283.v,
                    crossAxisCount: 2,
                    mainAxisSpacing: 13.h,
                    crossAxisSpacing: 13.h),
                physics: BouncingScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return FavoriteproductItemWidget(onTapProductItem: () {
                    Navigator.pushNamed(context, AppRoutes.productDetailScreen);
                  });
                })));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: AppImageConstants.imgArrowLeftBlueGray300,
            margin: EdgeInsets.only(left: 16.h, top: 16.v, bottom: 15.v),
            onTap: () {
              Navigator.pop(context);
            }),
        title: AppbarSubtitle(
            text: AppStrings.favoriteProduct,
            margin: EdgeInsets.only(left: 12.h)));
  }

  /// Navigates back to the previous screen
}
