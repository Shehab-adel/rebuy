import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/core/constants/app_string.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/core/utils/functions.dart';
import 'package:rebuy/presentation/profile_screen/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(InitialProfileState());

  static ProfileCubit get(BuildContext context) => BlocProvider.of(context);

  final _auth = FirebaseAuth.instance;
  String userEmail = '';
  Future<void> getFirebaseAuthCurrentUserEmail() async {
    final user = await _auth.currentUser;
    userEmail = user?.email ?? '';
  }

  String fullName = '';
  Future<void> getFirebaseAuthCurrentUserName() async {
    try {
      emit(LoadingGetFirebaseAuthCurrentUsername());
      await getFirebaseAuthCurrentUserEmail();
      final usersCollection =
          FirebaseFirestore.instance.collection(AppStrings.users);
      final querySnapshot = await usersCollection
          .where(AppStrings.email, isEqualTo: userEmail)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        final userData = querySnapshot.docs.first.data();
        fullName = userData[AppStrings.fullName];
      }
      emit(SuccessfulGetFirebaseAuthCurrentUsername());
    } catch (error) {
      // Handle any other errors
      emit(FailGetFirebaseAuthCurrentUsername());
    }
  }

  TextEditingController newpasswordController = TextEditingController();
  TextEditingController newpasswordAgainController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> changePassword() async {
    emit(LoadingChangePassword());
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      user.updatePassword(newpasswordController.text).then((value) {
        emit(SuccessfulChangePassword());
        print('Success -----------------');
      }).catchError((error) {
        emit(FailChangePassword());
        print('Fail ----------------- ${error.toString()}');
      });
    }
  }

  String? confirmPassword(String? value) {
    String password = newpasswordController.text;
    String confirmPassword = newpasswordAgainController.text;

    if (password == confirmPassword) {
      return null;
    } else {
      return 'Password does not match.';
    }
  }

  void signOutFromApp() async {
    emit(LoadingFirebaseLogout());

    await _auth.signOut().then((value) {
      snackBar('Logout is successfully');
      emit(SuccessfulFirebaseLogout());
    }).onError((error, stackTrace) {
      snackBar(error.toString());
      emit(FailureFirebaseLogout());
    });
  }

  void showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: appTheme.indigoA200,
          title: Text(AppStrings.confirmLogout),
          content: Text(AppStrings.Areyousureyouwanttologout),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                AppStrings.cancel,
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                signOutFromApp();
                Navigator.pushReplacementNamed(
                    context, AppRoutes.registerScreen);
              },
              child: Text(AppStrings.logout,
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}
