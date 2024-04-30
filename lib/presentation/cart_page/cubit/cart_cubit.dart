import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/presentation/cart_page/cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(super.initialState);

  static CartCubit get(context) => BlocProvider.of(context);
}
