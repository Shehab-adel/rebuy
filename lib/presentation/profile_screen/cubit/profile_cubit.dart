import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/core/constants/app_string.dart';
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
}
