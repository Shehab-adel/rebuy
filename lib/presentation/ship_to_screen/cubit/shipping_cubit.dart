import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/core/utils/shipping_to_item.dart';
import 'package:rebuy/presentation/ship_to_screen/cubit/shipping_state.dart';

class ShippingToCubit extends Cubit<ShippingToState> {
  ShippingToCubit() : super(InitialShippingTo());

  static ShippingToCubit get(context) => BlocProvider.of(context);
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

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
                // TextFormField(
                //   controller: _usernameController,
                //   decoration: InputDecoration(hintText: AppStrings.username),
                // ),
                TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(hintText: AppStrings.address),
                ),
                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(hintText: AppStrings.phoneNumber),
                  keyboardType: TextInputType.phone,
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
                isAdd == true
                    ? addShippingToItemToList()
                    : editShippingToItemIntoList(index ?? 0);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  List<ShippingToItem> shippingToItemList = [];
  bool isAdd = true;
  void addShippingToItemToList() {
    ShippingToItem shippingToItem = ShippingToItem(
        address: addressController.text, phone: phoneController.text);
    shippingToItemList.add(shippingToItem);
    emit(AddShippingToItemToListState());
  }

  void editShippingToItemIntoList(int index) {
    shippingToItemList[index].address = addressController.text;
    shippingToItemList[index].phone = phoneController.text;
    emit(ChangeAdressPhoneSate());
  }

  void changeIsAdd(bool isAdd) {
    this.isAdd = isAdd;
    emit(ChangeIsAddState());
  }

  void deleteItemFromShippingToList(index) {
    shippingToItemList.removeAt(index);
    emit(DeleteItemFromShippingToListState());
  }
}
