import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/presentation/change_password_screen/cubit/change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(InitialChangePasswordState());

  static ChangePasswordCubit get(BuildContext context) =>
      BlocProvider.of(context);

  TextEditingController passwordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();
  TextEditingController newpasswordAgainController = TextEditingController();
}
