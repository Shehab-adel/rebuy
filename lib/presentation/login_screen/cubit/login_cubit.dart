import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/presentation/login_screen/cubit/login_states.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialStats());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String bodyMessage = 'ensure your email or password again.';

  loginWithFirebaseAuth(BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        bodyMessage = 'You signed in successfully';
        emit(SuccessfulLoginProcess());
      }).onError((error, stackTrace) {
        emit(FailLoginProcess());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        bodyMessage = 'No user found for that email.';
      }
      emit(FailLoginProcess());
    } catch (e) {
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
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      bodyMessage = 'You signed in successfully with Google';
      emit(SuccessfulGoogleLoginProcess());
    }).onError((error, stackTrace) {
      bodyMessage = '${error.toString()}';
      emit(FailGoogleLoginProcess());
    });
  }
}
