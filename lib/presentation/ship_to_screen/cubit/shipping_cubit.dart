import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/presentation/ship_to_screen/cubit/shipping_state.dart';

class ShippingToCubit extends Cubit<ShippingToState> {
  ShippingToCubit() : super(InitialShippingTo());

  static ShippingToCubit get(context) => BlocProvider.of(context);
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  void showEditDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: appTheme.pink300,
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
                // Here you can add the logic to save the edited information
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
