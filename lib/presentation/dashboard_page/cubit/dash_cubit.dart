import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/presentation/account_page/account_page.dart';
import 'package:rebuy/presentation/cart_page/cart_page.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/states.dart';
import 'package:rebuy/presentation/dashboard_page/dashboard_page.dart';
import 'package:rebuy/presentation/explore_page/explore_page.dart';
import 'package:rebuy/presentation/offer_screen_page/offer_screen_page.dart';

import '../models/data_model.dart';

class DashCubit extends Cubit<DashState> {
  DashCubit() : super(DashInitState());

  static DashCubit get(context) => BlocProvider.of(context);

  int sliderIndex = 0;

  changeAnimatedSmoothIndex(int index) {
    sliderIndex = index;
    emit(ChangeAnimatedSmoothIndex());
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
    DashboardScreen(
      dashCubit: DashCubit.get(context),
    ),
    ExploreScreen(),
    CartScreen(),
    OfferScreen(),
    AccountScreen()
  ];

  List<String> categoryList = [
    AppStrings.menShirt,
    AppStrings.officeBage,
    AppStrings.dress,
    AppStrings.womenBag,
    AppStrings.pants,
    AppStrings.skirt,
    AppStrings.bag,
    AppStrings.heels,
    AppStrings.bikini,
    AppStrings.flashSale,
    AppStrings.megaSale
  ];

  int currentIndex = 0;

  void getCurrentScreenIndex(int index) {
    currentIndex = index;
    emit(GetCurrentScreenIndex());
  }

  String? message;
  List<DataModel>? dataList;
  Future<void> fetchDataFromFirestore() async {
    try {
      emit(LoadingFetchCollection());
      final querySnapshot = await FirebaseFirestore.instance
          .collection(AppStrings.menShirt)
          .get();

      dataList = await Future.wait(querySnapshot.docs.map((doc) async {
        final data = doc.data();
        final file = data['image'];
        final ref = FirebaseStorage.instance.ref().child(file);
        final url = await ref.getDownloadURL();
        return DataModel(
          image: url.toString(),
          title: data['title'],
          description: data['description'],
          price: data['price'],
          oldPrice: data['old_price'],
        );
      }).toList());
      emit(SuccessfulFetchCollection());
      print('Sucessful ---------------******');
    } on FirebaseException catch (error) {
      message = error.toString();
      print('${message}  Fail ---------------******');
      emit(FailFetchCollection());
    } catch (error) {
      message = error.toString();
      print('${message}  Fail ---------------******');
      emit(FailFetchCollection());
    }
  }
}
