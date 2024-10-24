import 'package:flutter/material.dart';
import 'package:rebuy/presentation/add_address_screen/add_address_screen.dart';
import 'package:rebuy/presentation/add_card_screen/add_card_screen.dart';
import 'package:rebuy/presentation/add_payment_screen/add_payment_screen.dart';
import 'package:rebuy/presentation/address_screen/address_screen.dart';
import 'package:rebuy/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:rebuy/presentation/cart_page/cart_page.dart';
import 'package:rebuy/presentation/cart_page/cubit/cart_cubit.dart';
import 'package:rebuy/presentation/change_password_screen/change_password_screen.dart';
import 'package:rebuy/presentation/choose_credit_or_debit_card_screen/choose_credit_or_debit_card_screen.dart';
import 'package:rebuy/presentation/choose_credit_or_debit_card_screen/cubit/choosecreditcubit.dart';
import 'package:rebuy/presentation/credit_card_and_debit_screen/credit_card_and_debit_screen.dart';
import 'package:rebuy/presentation/dashboard_container_screen/dashboard_container_screen.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/dash_cubit.dart';
import 'package:rebuy/presentation/dashboard_page/dashboard_page.dart';
import 'package:rebuy/presentation/favorite_product_screen/favorite_product_screen.dart';
import 'package:rebuy/presentation/filter_screen/filter_screen.dart';
import 'package:rebuy/presentation/forget_password/forget_pasword_screen.dart';
import 'package:rebuy/presentation/details_card_screen/details_card_screen.dart';
import 'package:rebuy/presentation/list_category_screen/list_category_screen.dart';
import 'package:rebuy/presentation/login_screen/login_screen.dart';
import 'package:rebuy/presentation/notification_activity_screen/notification_activity_screen.dart';
import 'package:rebuy/presentation/notification_feed_screen/notification_feed_screen.dart';
import 'package:rebuy/presentation/notification_offer_screen/notification_offer_screen.dart';
import 'package:rebuy/presentation/notification_screen/notification_screen.dart';
import 'package:rebuy/presentation/order_screen/order_screen.dart';
import 'package:rebuy/presentation/payment_method_screen/payment_method_screen.dart';
import 'package:rebuy/presentation/product_detail_screen/product_detail_screen.dart';
import 'package:rebuy/presentation/profile_screen/cubit/profile_cubit.dart';
import 'package:rebuy/presentation/profile_screen/profile_screen.dart';
import 'package:rebuy/presentation/register_screen/register_screen.dart';
import 'package:rebuy/presentation/review_product_screen/review_product_screen.dart';
import 'package:rebuy/presentation/search_result_no_data_found_screen/search_result_no_data_found_screen.dart';
import 'package:rebuy/presentation/search_result_screen/search_result_screen.dart';
import 'package:rebuy/presentation/search_screen/search_screen.dart';
import 'package:rebuy/presentation/ship_to_screen/cubit/shipping_cubit.dart';
import 'package:rebuy/presentation/ship_to_screen/ship_to_screen.dart';
import 'package:rebuy/presentation/show_category_products/show_category_products_screen.dart';
import 'package:rebuy/presentation/sort_by_screen/sort_by_screen.dart';
import 'package:rebuy/presentation/splash_screen/splash_screen.dart';
import 'package:rebuy/presentation/success_screen/success_screen.dart';
import 'package:rebuy/presentation/super_flash_sale_screen/super_flash_sale_screen.dart';
import 'package:rebuy/presentation/write_review_fill_screen/write_review_fill_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String loginScreen = '/login_screen';

  static const String registerScreen = '/register_screen';

  static const String dashboardPage = '/dashboard_page';

  static const String dashboardContainerScreen = '/dashboard_container_screen';

  static const String superFlashSaleScreen = '/super_flash_sale_screen';

  static const String favoriteProductScreen = '/favorite_product_screen';

  static const String productDetailScreen = '/product_detail_screen';

  static const String reviewProductScreen = '/review_product_screen';

  static const String writeReviewFillScreen = '/write_review_fill_screen';

  static const String notificationScreen = '/notification_screen';

  static const String notificationOfferScreen = '/notification_offer_screen';

  static const String notificationFeedScreen = '/notification_feed_screen';

  static const String notificationActivityScreen =
      '/notification_activity_screen';

  static const String explorePage = '/explore_page';

  static const String searchScreen = '/search_screen';

  static const String searchResultScreen = '/search_result_screen';

  static const String searchResultNoDataFoundScreen =
      '/search_result_no_data_found_screen';

  static const String listCategoryScreen = '/list_category_screen';

  static const String sortByScreen = '/sort_by_screen';

  static const String filterScreen = '/filter_screen';

  static const String cartPage = '/cart_page';

  static const String shipToScreen = '/ship_to_screen';

  static const String paymentMethodScreen = '/payment_method_screen';

  static const String chooseCreditOrDebitCardScreen =
      '/choose_credit_or_debit_card_screen';

  static const String successScreen = '/success_screen';

  static const String offerScreenPage = '/offer_screen_page';

  static const String accountPage = '/account_page';

  static const String profileScreen = '/profile_screen';

  static const String changePasswordScreen = '/change_password_screen';

  static const String forgetPasswordScreen = '/forget_password_screen';

  static const String orderScreen = '/order_screen';

  static const String orderDetailsScreen = '/order_details_screen';

  static const String addAddressScreen = '/add_address_screen';

  static const String addressScreen = '/address_screen';

  static const String addPaymentScreen = '/add_payment_screen';

  static const String creditCardAndDebitScreen =
      '/credit_card_and_debit_screen';

  static const String addCardScreen = '/add_card_screen';

  static const String detailsCardScreen = '/details_card_screen';

  static const String appNavigationScreen = '/app_navigation_screen';
  static const String showCategoryProductsScreen = '/show_category_p';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => SplashScreen(),
    loginScreen: (context) => LoginScreen(),
    registerScreen: (context) => RegisterScreen(),
    dashboardContainerScreen: (context) => DashboardContainerScreen(),
    dashboardPage: (context) => DashboardScreen(
          dashCubit: DashCubit.get(context),
        ),
    superFlashSaleScreen: (context) => SuperFlashSaleScreen(),
    favoriteProductScreen: (context) => FavoriteProductScreen(
          cartCubit: CartCubit.get(context),
        ),
    productDetailScreen: (context) => ProductDetailScreen(
          dashCubit: DashCubit.get(context),
          cartCubit: CartCubit.get(context),
        ),
    reviewProductScreen: (context) => ReviewProductScreen(),
    writeReviewFillScreen: (context) => WriteReviewFillScreen(
          dashCubit: DashCubit.get(context),
        ),
    notificationScreen: (context) => NotificationScreen(),
    notificationOfferScreen: (context) => NotificationOfferScreen(),
    notificationFeedScreen: (context) => NotificationFeedScreen(),
    notificationActivityScreen: (context) => NotificationActivityScreen(),
    searchScreen: (context) => SearchScreen(),
    searchResultScreen: (context) => SearchResultScreen(),
    searchResultNoDataFoundScreen: (context) => SearchResultNoDataFoundScreen(),
    listCategoryScreen: (context) => ListCategoryScreen(),
    sortByScreen: (context) => SortByScreen(),
    filterScreen: (context) => FilterScreen(),
    shipToScreen: (context) => ShipToScreen(
          shippingToCubit: ShippingToCubit.get(context),
        ),
    paymentMethodScreen: (context) => PaymentMethodScreen(),
    chooseCreditOrDebitCardScreen: (context) =>
        ChooseCreditOrDebitCardScreen(ChooseCreditCubit.get(context)),
    successScreen: (context) => SuccessScreen(),
    profileScreen: (context) =>
        ProfileScreen(profileCubit: ProfileCubit.get(context)),
    changePasswordScreen: (context) => ChangePasswordScreen(),
    forgetPasswordScreen: (context) => ForgetPasswordScreen(),
    showCategoryProductsScreen: (context) =>
        ShowCategoryProductsScreen(dashCubit: DashCubit.get(context)),
    orderScreen: (context) => OrderScreen(),
    orderDetailsScreen: (context) => OrderScreen(),
    addAddressScreen: (context) => AddAddressScreen(),
    addressScreen: (context) => AddressScreen(),
    addPaymentScreen: (context) => AddPaymentScreen(),
    creditCardAndDebitScreen: (context) => CreditCardAndDebitScreen(),
    addCardScreen: (context) => AddCardScreen(),
    detailsCardScreen: (context) => DetailsCardScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    cartPage: (context) => CartScreen(),
  };
}
