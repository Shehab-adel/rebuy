import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/presentation/cart_page/cubit/cart_state.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/dash_cubit.dart';
import 'package:rebuy/presentation/dashboard_page/models/data_model.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  static CartCubit get(context) => BlocProvider.of(context);

  List<DataModel> favoriteList = [];

  void addToFavoriteList(DataModel dataModel) {
    if (favoriteList.isNotEmpty) {
      if (favoriteList.contains(dataModel)) {
        favoriteList.remove(dataModel);
        emit(RemovefromFavoriteListState());
      } else {
        favoriteList.add(dataModel);
        emit(AddToFavoriteListState());
      }
    } else {
      favoriteList.add(dataModel);
    }
    emit(AddToFavoriteListState());

    print("${favoriteList} *********favorite list");
  }

  bool isFavorite = false;
  void changeIsFavorite() {
    isFavorite = !isFavorite;
    emit(ChangeIsFavoredState());
  }

  int currentIndex = 0;
  changeSelectedFavoriteIndex(int index) {
    currentIndex = index;
    emit(ChangeSelectedFavoriteIndexState());
  }

  void deleteItemFromFavoriteList(DataModel dataModel) {
    favoriteList.remove(dataModel);
    emit(DeleteItemFromFavoriteListState());
    print("${favoriteList} *********favorite list");
  }
}
