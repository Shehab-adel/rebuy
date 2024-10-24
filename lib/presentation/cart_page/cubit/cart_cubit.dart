import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/presentation/cart_page/cubit/cart_state.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/dash_cubit.dart';
import 'package:rebuy/presentation/dashboard_page/models/data_model.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({required this.dashCubit}) : super(CartInitial());

  static CartCubit get(context) => BlocProvider.of(context);

  DashCubit dashCubit;
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

  void increaseItemToCart(DataModel dataModel) {
    dataModel.quantity = dataModel.quantity + 1;
    print("${dataModel.quantity} *********quantity");
    emit(SuccessfulIncreaseItemToCartState());
  }

  void decreaseItemFromCartList(DataModel dataModel) {
    if (dataModel.quantity > 1) {
      dataModel.quantity--;
      itemsPrice -= dataModel.price ?? 0.0 * dataModel.quantity;
      emit(DecreaseItemFromCartListState());
    }
  }

  void deleteItemFromCartList(DataModel dataModel) {
    itemsPrice = itemsPrice - (dataModel.price! * dataModel.quantity);
    dashCubit.cartDataModelMap.remove(dataModel);
    emit(DeleteItemFromCartListState());
  }

  double itemsPrice = 0;

  void sumOfItemsPriceByPlusIcon(DataModel dataModel) {
    itemsPrice += dataModel.price ?? 0.0 * dataModel.quantity;
    emit(SumOfItemsPriceByPlusIconState());
  }

  void deleteItemFromFavoriteList(int index) {
    favoriteList.removeAt(index);
    emit(DeleteItemFromFavoriteList());
  }
}
