import 'package:flutter/material.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/presentation/search_result_screen/widgets/appbar_title_edittext_one.dart';
import 'package:rebuy/widgets/app_bar/appbar_trailing_image.dart';
import 'package:rebuy/widgets/app_bar/custom_app_bar.dart';
import '../search_result_screen/widgets/searchresult_item_widget.dart';

// ignore_for_file: must_be_immutable
class SearchResultScreen extends StatelessWidget {
  SearchResultScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 11.v),
                child: Column(children: [
                  Divider(),
                  SizedBox(height: 15.v),
                  _buildResultCounter(context),
                  SizedBox(height: 16.v),
                  _buildSearchResult(context)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        title: AppbarTitleEdittextOne(
            margin: EdgeInsets.only(left: 16.h),
            hintText: "Nike Air Max",
            controller: searchController),
        actions: [
          AppbarTrailingImage(
              imagePath: AppImageConstants.imgSort,
              margin: EdgeInsets.only(left: 16.h, top: 16.v, right: 16.h),
              onTap: () {
                onTapSort(context);
              }),
          AppbarTrailingImage(
              imagePath: AppImageConstants.imgFilter,
              margin: EdgeInsets.only(left: 16.h, top: 16.v, right: 32.h),
              onTap: () {
                onTapFilter(context);
              })
        ]);
  }

  /// Section Widget
  Widget _buildResultCounter(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Opacity(
                  opacity: 0.5,
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 4.v),
                      child: Text("145 Result",
                          style: CustomTextStyles.labelLargeOnPrimary))),
              Spacer(),
              Padding(
                  padding: EdgeInsets.only(top: 2.v, bottom: 3.v),
                  child: Text("Man Shoes", style: theme.textTheme.labelLarge)),
              CustomImageView(
                  imagePath: AppImageConstants.imgDownIcon,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(left: 8.h))
            ]));
  }

  /// Section Widget
  Widget _buildSearchResult(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 283.v,
                    crossAxisCount: 2,
                    mainAxisSpacing: 13.h,
                    crossAxisSpacing: 13.h),
                physics: BouncingScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return SearchresultItemWidget();
                })));
  }

  /// Navigates to the sortByScreen when the action is triggered.
  onTapSort(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.sortByScreen);
  }

  /// Navigates to the filterScreen when the action is triggered.
  onTapFilter(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.filterScreen);
  }
}
