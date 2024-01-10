import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/presentation/account_page/account_page.dart';
import 'package:rebuy/presentation/cart_page/cart_page.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/states.dart';
import 'package:rebuy/presentation/dashboard_page/dashboard_page.dart';
import 'package:rebuy/presentation/explore_page/explore_page.dart';
import 'package:rebuy/presentation/offer_screen_page/offer_screen_page.dart';

class DashCubit extends Cubit<DashSatates> {
  DashCubit() : super(DashInitState());

  static DashCubit get(context) => BlocProvider.of(context);

  int sliderIndex = 0;

  changeAnimatedSmoothIdex(int index) {
    sliderIndex = index;
    emit(ChangeAnimatedSmoothIdex());
  }

  Map<String, String> categoryMap = {
    'Man Shirt': AppImageConstants.imgManTShirtIcon,
    'Office Bag': AppImageConstants.imgBagIcon,
    'Dress': AppImageConstants.imgDressIcon,
    'Woman Bag': AppImageConstants.imgWomanBagIcon,
    'Pants': AppImageConstants.imgWomanPantsIcon,
    'Skirt': AppImageConstants.imgSkirtIcon,
    'Bag': AppImageConstants.imgWomanBagIcon,
    'Heels': AppImageConstants.imgHighHeelsIcon,
    'Bikini': AppImageConstants.imgBikiniIcon,
  };

  List<Widget> screenList = [
    DashboardScreen(),
    ExploreScreen(),
    CartScreen(),
    OfferScreen(),
    AccountScreen()
  ];

  int currentIndex = 0;

  void getCurrentScreenIndex(int index) {
    currentIndex = index;
    emit(GetCurrentScreenIndex());
  }
}
