import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/dash_cubit.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/states.dart';
import 'package:rebuy/widgets/app_bar/appbar_leading_image.dart';
import 'package:rebuy/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:rebuy/widgets/app_bar/appbar_trailing_image.dart';
import 'package:rebuy/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class DashboardContainerScreen extends StatelessWidget {
  DashboardContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashCubit, DashSatates>(builder: (context, sate) {
      DashCubit dashCubit = DashCubit.get(context);
      return SafeArea(
          child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          elevation: 0,
          currentIndex: dashCubit.currentIndex,
          fixedColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          onTap: (index) {
            dashCubit.getCurrentScreenIndex(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: CustomImageView(
                imagePath: AppImageConstants.imgNavHome,
                height: 23.v,
                width: 24.h,
                color: appTheme.blueGray300,
              ),
              label: 'Home',
              activeIcon: CustomImageView(
                imagePath: AppImageConstants.imgNavHome,
                height: 23.v,
                width: 24.h,
                color: theme.colorScheme.primary.withOpacity(1),
              ),
            ),
            BottomNavigationBarItem(
              icon: CustomImageView(
                imagePath: AppImageConstants.imgNavExplore,
                height: 23.v,
                width: 24.h,
                color: appTheme.blueGray300,
              ),
              label: 'Explore',
              activeIcon: CustomImageView(
                imagePath: AppImageConstants.imgNavExplore,
                height: 23.v,
                width: 24.h,
                color: theme.colorScheme.primary.withOpacity(1),
              ),
            ),
            BottomNavigationBarItem(
              icon: CustomImageView(
                imagePath: AppImageConstants.imgNavCart,
                height: 23.v,
                width: 24.h,
                color: appTheme.blueGray300,
              ),
              label: 'Cart',
              activeIcon: CustomImageView(
                imagePath: AppImageConstants.imgNavCart,
                height: 23.v,
                width: 24.h,
                color: theme.colorScheme.primary.withOpacity(1),
              ),
            ),
            BottomNavigationBarItem(
              icon: CustomImageView(
                imagePath: AppImageConstants.imgNavOffer,
                height: 23.v,
                width: 24.h,
                color: appTheme.blueGray300,
              ),
              label: 'Offer',
              activeIcon: CustomImageView(
                imagePath: AppImageConstants.imgNavOffer,
                height: 23.v,
                width: 24.h,
                color: theme.colorScheme.primary.withOpacity(1),
              ),
            ),
            BottomNavigationBarItem(
              icon: CustomImageView(
                imagePath: AppImageConstants.imgNavAccount,
                height: 23.v,
                width: 24.h,
                color: appTheme.blueGray300,
              ),
              label: 'Account',
              activeIcon: CustomImageView(
                imagePath: AppImageConstants.imgNavAccount,
                height: 23.v,
                width: 24.h,
                color: theme.colorScheme.primary.withOpacity(1),
              ),
            ),
          ],
        ),
        body: dashCubit.screenList[dashCubit.currentIndex],
      ));
    });
  }
}

/// Section Widget
PreferredSizeWidget buildAppBar(BuildContext context) {
  return CustomAppBar(
      leadingWidth: 48.h,
      leading: AppbarLeadingImage(
          imagePath: AppImageConstants.imgSearch,
          margin: EdgeInsets.only(left: 32.h, top: 20.v, bottom: 20.v)),
      title: AppbarSubtitleOne(
          text: "Search Product",
          margin: EdgeInsets.only(left: 8.h),
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.searchScreen);
          }),
      actions: [
        AppbarTrailingImage(
            imagePath: AppImageConstants.imgDownload,
            margin: EdgeInsets.only(left: 16.h, top: 16.v, right: 16.h),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.favoriteProductScreen);
            }),
        Container(
            height: 24.adaptSize,
            width: 24.adaptSize,
            margin: EdgeInsets.only(left: 16.h, top: 16.v, right: 32.h),
            child: Stack(alignment: Alignment.topRight, children: [
              CustomImageView(
                  imagePath: AppImageConstants.imgNotificationIcon,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  alignment: Alignment.center,
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.notificationScreen);
                  }),
              CustomImageView(
                  imagePath: AppImageConstants.imgClosePink300,
                  height: 8.adaptSize,
                  width: 8.adaptSize,
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(left: 14.h, right: 2.h, bottom: 16.v))
            ]))
      ]);
}
