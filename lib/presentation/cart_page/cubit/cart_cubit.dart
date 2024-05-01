import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/presentation/cart_page/cubit/cart_state.dart';
import 'package:rebuy/presentation/dashboard_page/models/data_model.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  static CartCubit get(context) => BlocProvider.of(context);

  List<DataModel> favoriteList = [];

  void addToFavoriteList(DataModel dataModel) {
    if (favoriteList.isNotEmpty) {
      if (favoriteList.contains(dataModel)) {
        favoriteList.remove(dataModel);
      } else {
        favoriteList.add(dataModel);
      }
    } else {
      favoriteList.add(dataModel);
    }

    print("${favoriteList} *********favorite list");
  }

  bool isFavorite = false;
  void changeIsFavorite() {
    isFavorite = !isFavorite;
    emit(ChangeIsFavoredState());
  }
}
