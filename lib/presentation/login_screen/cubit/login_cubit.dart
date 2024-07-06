import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/network/local/cache%20helper.dart';
import 'package:rebuy/presentation/login_screen/cubit/login_states.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialStats());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String bodyMessage = 'ensure your email or password again.';

  TextEditingController forgetPasswordEmailController = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  //Firebase Auth
  FirebaseAuth auth = FirebaseAuth.instance;
  loginWithFirebaseAuth(BuildContext context) async {
    try {
      await auth
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) async {
        bodyMessage = 'You signed in successfully';
        emit(SuccessfulLoginProcess());
      }).onError((error, stackTrace) {
        bodyMessage = error.toString();
        emit(FailLoginProcess());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        bodyMessage = 'No user found for that email.';
      }
      emit(FailLoginProcess());
    } catch (e) {
      bodyMessage = e.toString();
      emit(FailLoginProcess());
    }
  }

  void loginshowDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title, style: theme.textTheme.titleMedium),
          content: Text(content, style: theme.textTheme.bodySmall),
          actions: <Widget>[
            TextButton(
                child:
                    Text('Close', style: CustomTextStyles.bodySmallOnPrimary),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ],
        );
      },
    );
  }

  Future<void> signInWithGoogle() async {
    // final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // final GoogleSignInAuthentication? googleAuth =
    //     await googleUser?.authentication;
    // final credential = GoogleAuthProvider.credential(
    //     accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    // await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
    //   bodyMessage = 'You signed in successfully with Google';
    //   emit(SuccessfulGoogleLoginProcess());
    // }).onError((error, stackTrace) {
    //   bodyMessage = '${error.toString()}';
    //   emit(FailGoogleLoginProcess());
    // });
  }

  String? returnMessage;
  Future<void> resetPassword(BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: forgetPasswordEmailController.text)
          .then((value) {
        returnMessage = 'Check your email to reset password then go resign in.';
        emit(SuccessfulForgetProcess());
      }).onError((error, stackTrace) {
        returnMessage = '${error.toString()}';
        emit(FailForgetProcess());
      });
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        returnMessage =
            'No user found for that ${forgetPasswordEmailController.text}...create your account by signing up..';
        emit(FailForgetProcess());
      } else {
        returnMessage = error.message.toString();
        emit(FailForgetProcess());
      }
    } catch (error) {
      returnMessage = '${error.toString()}';
      emit(FailForgetProcess());
    }
  }
}
