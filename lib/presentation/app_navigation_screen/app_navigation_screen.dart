import 'package:flutter/material.dart';
import 'package:rebuy/core/utils/app_export.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildAppNavigation(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          context,
                          screenTitle: "Splash Screen",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.splashScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Login",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.loginScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Register",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.registerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Dashboard - Container",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.dashboardContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Super Flash Sale",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.superFlashSaleScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Favorite Product",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.favoriteProductScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Product Detail",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.productDetailScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Review Product",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.reviewProductScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Write Review Fill",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.writeReviewFillScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Notification",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.notificationScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Notification Offer",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.notificationOfferScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Notification Feed",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.notificationFeedScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Notification Activity",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.notificationActivityScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Search",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.searchScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Search Result",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.searchResultScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Search Result No Data Found",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.searchResultNoDataFoundScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "List Category",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.listCategoryScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Sort By",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.sortByScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Filter",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.filterScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Ship To",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.shipToScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Payment Method",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.paymentMethodScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Choose Credit Or Debit Card",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.chooseCreditOrDebitCardScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Success Screen",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.successScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Profile",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.profileScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Change Password",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.changePasswordScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Order",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.orderScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Order Details",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.orderDetailsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Add Address",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.addAddressScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Address",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.addressScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Add Payment",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.addPaymentScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Credit Card And Debit",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.creditCardAndDebitScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Add Card",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.addCardScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Lailyfa Febrina Card",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.detailsCardScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(
    BuildContext context,
    String routeName,
  ) {
    Navigator.pushNamed(context, routeName);
  }
}
