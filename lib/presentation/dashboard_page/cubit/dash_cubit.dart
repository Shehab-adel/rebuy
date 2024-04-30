import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/core/utils/app_export.dart';
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

  List<String> categoryImageList = [
    AppImageConstants.imgManTShirtIcon,
    AppImageConstants.imgBagIcon,
    AppImageConstants.imgDressIcon,
    AppImageConstants.imgWomanBagIcon,
    AppImageConstants.imgWomanPantsIcon,
    AppImageConstants.imgSkirtIcon,
    AppImageConstants.imgBagIcon,
    AppImageConstants.imgHighHeelsIcon,
    AppImageConstants.imgBikiniIcon,
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
    AppStrings.bikini
  ];

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  List<Widget> screenList(context) => [
        DashboardScreen(
          dashCubit: DashCubit.get(context),
        ),
        ExploreScreen(),
        CartScreen(),
        OfferScreen(),
        AccountScreen()
      ];

  int currentScreenIndex = 0;

  void getCurrentScreenIndex(int index) {
    currentScreenIndex = index;
    emit(GetCurrentScreenIndex());
  }

  String? message;
  List<DataModel>? dataList;
  List<DataModel>? flashSaleList;
  List<DataModel>? megaSaleList;
  Future<void> fetchDataFromFirestore() async {
    try {
      emit(LoadingFetchCollection());
      final querySnapshot =
          await firebaseFirestore.collection(categoryName).get();

      dataList = await Future.wait(querySnapshot.docs.map((doc) async {
        final data = doc.data();
        final file = data['image'];
        final ref = FirebaseStorage.instance.ref().child(file);
        final url = await ref.getDownloadURL();
        return DataModel(
            image: url,
            title: data['title'],
            description: data['description'],
            price: data['price'],
            oldPrice: data['old_price'],
            disccountPrecentage: data['disccountPrecentage'],
            sizeList: data['size_list'],
            docId: doc.id,
            rating: data['rating'],
            review: data['review']);
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

  Future<void> fetchFlashSaleCollection() async {
    try {
      emit(LoadingFetchCollection());
      final querySnapshot =
          await firebaseFirestore.collection(AppStrings.flashSale).get();

      flashSaleList = await Future.wait(querySnapshot.docs.map((doc) async {
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
            disccountPrecentage: data['disccountPrecentage'],
            sizeList: data['size_list'],
            docId: doc.id);
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

  Future<void> fetchMegaSaleCollection() async {
    try {
      emit(LoadingFetchCollection());
      final querySnapshot = await FirebaseFirestore.instance
          .collection(AppStrings.megaSale)
          .get();

      megaSaleList = await Future.wait(querySnapshot.docs.map((doc) async {
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
            disccountPrecentage: data['disccountPrecentage'],
            sizeList: data['size_list'],
            docId: doc.id,
            rating: data['rating'],
            review: data['review']);
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

  String categoryName = AppStrings.menShirt;
  changeCategoryName(String categoryName) {
    this.categoryName = categoryName;
    emit(ChangeCategoryIndex());
  }

  void loginshowDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title,
              style: theme.textTheme.titleSmall!
                  .copyWith(color: theme.colorScheme.onPrimary.withOpacity(1))),
          content: Text(content, style: CustomTextStyles.textStyle16),
          actions: <Widget>[
            TextButton(
                child: Text('Close',
                    style: CustomTextStyles.titleSmallPrimary.copyWith(
                        color: theme.colorScheme.primary.withOpacity(1))),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ],
        );
      },
    );
  }

  int selectedProductIndex = 0;
  changeSelectedProductIndex(int index) {
    selectedProductIndex = index;
    emit(ChangeCategoryIndex());
  }

  int selectedSizeItem = 0;
  changeSelectedSizeItem(int index) {
    selectedSizeItem = index;
    emit(changeSelectedSizeIndex());
  }

  //Write review
  TextEditingController writeReviewController = TextEditingController();
  String failCollectionMessage =
      'Failed to add the product review, please try later';
  Future<void> writeProductReviewToFirestore(String id) async {
    emit(LoadingProductReviewToCollection());

    await firebaseFirestore.collection(categoryName).doc(id).update({
      AppStrings.rating: this.reviewRating,
      AppStrings.review: writeReviewController.text
    }).then((value) {
      emit(SuccessfulProductReviewToCollection());
    }).onError((error, stackTrace) {
      failCollectionMessage = error.toString();
      emit(FailProductReviewToCollection());
    });
  }

  double reviewRating = 0.0;
  void changeReviewRating(double reviewRating) {
    this.reviewRating = reviewRating;
    emit(ChangeReviewRating());
  }

  Future<void> getReviewAndRatingAfterUserUpdate(String id) async {
    emit(LoadingReviewAndRatingAfterUserUpdate());
    await firebaseFirestore
        .collection(categoryName)
        .doc(id)
        .get()
        .then((value) {
      dataList?[selectedProductIndex].rating = value['rating'];
      dataList?[selectedProductIndex].review = value['review'];
      emit(SuccessfulReviewAndRatingAfterUserUpdate());
    }).catchError((error) {
      emit(FailReviewAndRatingAfterUserUpdate());
    });
  }

  List<int> selectedProductIndexList = [];
  void addCartItemIndexToList() {
    if (selectedProductIndexList.contains(selectedProductIndex)) {
      return;
    } else {
      selectedProductIndexList.add(selectedProductIndex);
    }
    print('${selectedProductIndexList} ***********');
  }
}
