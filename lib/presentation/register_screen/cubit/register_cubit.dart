import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rebuy/core/constants/app_string.dart';
import 'package:rebuy/network/local/cache%20helper.dart';
import 'package:rebuy/presentation/dashboard_page/models/data_model.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialStats());

  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String message = '';
  FirebaseAuth auth = FirebaseAuth.instance;
  registerWithFirebaseAuth(BuildContext context) async {
    try {
      emit(LoadingFireAuthRegisterProcess());
      await auth
          .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      )
          .then((value) async {
        message = 'Check your email to verify fisrt';
        emit(SuccessfulFireAuthRegisterProcess());
        CacheHelper.sharedPreferences
            .setString(AppStrings.displayName, usernameController.text);
        await value.user?.updateDisplayName(CacheHelper.getDisplayName());
        await sendEmailVerification(context);
      }).onError((error, stackTrace) {
        message = 'Check your email to verify first';
        emit(FailFireAuthRegisterProcess());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use' &&
          isEmailVerified(context) == false) {
        message = 'Please Check your email to verify first';
        emit(FailFireAuthRegisterProcess());
      } else if (e.code == 'email-already-in-use' &&
          isEmailVerified(context) == true) {
        message = 'The email address is already exists.try sign in';
        emit(FailFireAuthRegisterProcess());
      }
    } catch (e) {
      message = "Somthing is wrong.Please Try again";
      emit(FailFireAuthRegisterProcess());
    }
  }

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future<void> createUsersFirestoreCollection() async {
    emit(LoadingFireStoreRegisterProcess());
    await firebaseFirestore.collection(AppStrings.users).add({
      AppStrings.fullName: usernameController.text,
      AppStrings.email: emailController.text,
      AppStrings.userCartList: <DataModel>[]
    }).then((value) {
      emit(SuccessfulFireStoreRegisterProcess());
    }).onError((error, stackTrace) {
      message = error.toString();
      emit(FailFireStoreRegisterProcess());
    });
  }

  Future<void> sendEmailVerification(BuildContext context) async {
    User? user = auth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  Future<bool> isEmailVerified(BuildContext context) async {
    User? user = auth.currentUser;
    await user?.reload();
    user = FirebaseAuth.instance.currentUser;
    if (user != null && user.emailVerified == true) {
      return true;
    } else {
      return false;
    }
  }

  String? validateEmail(String? value) {
    const pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

  String? confirmPassword(String? value) {
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    if (password == confirmPassword) {
      return null;
    } else {
      return 'Password does not match.';
    }
  }

  String? isValidUsername(String? value) {
    final pattern = r'^[a-zA-Z0-9_]{3,15}$';
    final regex = RegExp(pattern);
    if (!regex.hasMatch(value ?? '')) {
      return 'Username must be 3-15 characters and can only include alphanumeric characters and underscores';
    }
    return null;
  }
}
