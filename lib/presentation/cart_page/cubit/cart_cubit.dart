import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/presentation/cart_page/cubit/cart_state.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/dash_cubit.dart';
import 'package:rebuy/presentation/dashboard_page/models/data_model.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  static CartCubit get(context) => BlocProvider.of(context);

  DashCubit? dashCubit;
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

  void deleteItemFromCartList(DataModel dataModel) {
    if (dashCubit!.cartDataModelMap.isNotEmpty) {
      dashCubit!.cartDataModelMap.removeWhere((key, value) => key == dataModel);
      emit(DeleteItemFromCartListState());
    } else {
      emit(ItemDoesNotExistState());
    }

    print("${dashCubit!.cartDataModelMap} *********cart list");
  }

  /*
  [
    
  ]
  */

  var productMap = {};

  void addProductToCart(DataModel dataModel) {
    if (productMap.containsKey(dataModel)) {
      productMap[dataModel] += 1;
    } else {
      productMap[dataModel] = 1;
    }
  }
}
