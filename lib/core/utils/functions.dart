import 'package:flutter/material.dart';

SnackBar snackBar(String snackbareMessage) => SnackBar(
      content: Text(snackbareMessage),
      backgroundColor: const Color.fromRGBO(33, 150, 243, 1),
      duration: Duration(seconds: 4),
      action: SnackBarAction(
        label: 'Action',
        onPressed: () {
          // Some code to do something
        },
      ),
    );

String? validatePassword(String? value) {
  // Define a regular expression pattern for strong passwords
  final pattern =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
  final regex = RegExp(pattern);

  if (!regex.hasMatch(value ?? '')) {
    return 'Password must contain at least one lowercase letter, one uppercase letter, one digit, and one special character.';
  }
  return null;
}
