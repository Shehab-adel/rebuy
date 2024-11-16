import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentForm extends StatefulWidget {
  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.red,
        child: CreditCardForm(
          onCreditCardModelChange: (CreditCardModel data) {
            setState(() {
              cardNumber = data.cardNumber;
              expiryDate = data.expiryDate;
              cardHolderName = data.cardHolderName;
              cvvCode = data.cvvCode;
              isCvvFocused = data.isCvvFocused;
            });
          },
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          formKey: formKey,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
        ),
      ),
    );
  }
}
