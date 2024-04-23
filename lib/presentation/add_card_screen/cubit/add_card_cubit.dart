import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/presentation/add_card_screen/cubit/add_card_state.dart';

class AddCardCubit extends Cubit<AddCardState> {
  AddCardCubit() : super(AddCardInitial());

  static AddCardCubit get(context) => BlocProvider.of(context);

  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expirationDateController = TextEditingController();
  TextEditingController securityCodeController = TextEditingController();
  TextEditingController cardHolderController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
