import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/presentation/cart_page/cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  static CartCubit get(context) => BlocProvider.of(context);

  List<int> favoriteList = [];

  void addToFavoriteList(int index) {
    if (favoriteList.isNotEmpty) {
      if (favoriteList.contains(index)) {
        favoriteList.remove(index);
      } else {
        favoriteList.add(index);
      }
    } else {
      favoriteList.add(index);
    }

    print("${favoriteList} *********favorite list");
  }
}
