import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/core/constants/app_string.dart';
import 'package:rebuy/core/utils/creditcarditem.dart';
import 'package:rebuy/core/utils/theme/theme_helper.dart';
import 'package:rebuy/presentation/choose_credit_or_debit_card_screen/cubit/states.dart';

class ChooseCreditCubit extends Cubit<ChooseCreditState> {
  ChooseCreditCubit() : super(InitialChooseCredit());

  List<CreditCardITem> creditcardItemList = [];
  final TextEditingController cardNumController = TextEditingController();
  final TextEditingController cardNameController = TextEditingController();
  final TextEditingController cardSaveController = TextEditingController();
  static ChooseCreditCubit get(context) => BlocProvider.of(context);

  void showEditDialog(BuildContext context, {int? index}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: appTheme.blue50,
          title: Text(AppStrings.editUserInformation),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextFormField(
                  controller: cardNumController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: AppStrings.cardNum),
                ),
                TextFormField(
                  controller: cardNameController,
                  decoration: InputDecoration(hintText: AppStrings.cardName),
                ),
                TextFormField(
                  controller: cardSaveController,
                  decoration: InputDecoration(hintText: AppStrings.cardSave),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(AppStrings.cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(AppStrings.save),
              onPressed: () {
                addCreditCardItemToList();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void addCreditCardItemToList() {
    CreditCardITem cardITem = CreditCardITem(cardNumController.text,
        cardNameController.text, cardSaveController.text);
    creditcardItemList.add(cardITem);
    emit(AddCreditCardItemToListState());
    print('${cardITem} ------ ${creditcardItemList.length}');
  }
}
