import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/presentation/choose_credit_or_debit_card_screen/cubit/choosecreditcubit.dart';
import 'package:rebuy/presentation/choose_credit_or_debit_card_screen/cubit/states.dart';
import 'package:rebuy/widgets/app_bar/appbar_leading_image.dart';
import 'package:rebuy/widgets/app_bar/appbar_subtitle.dart';
import 'package:rebuy/widgets/app_bar/appbar_trailing_image.dart';
import 'package:rebuy/widgets/app_bar/custom_app_bar.dart';
import 'package:rebuy/widgets/custom_elevated_button.dart';
import '../choose_credit_or_debit_card_screen/widgets/creditcard_item_widget.dart';

class ChooseCreditOrDebitCardScreen extends StatelessWidget {
  const ChooseCreditOrDebitCardScreen(this.chooseCreditCubit);
  final ChooseCreditCubit chooseCreditCubit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            leadingWidth: 40.h,
            leading: AppbarLeadingImage(
                imagePath: AppImageConstants.imgArrowLeftBlueGray300,
                margin: EdgeInsets.only(left: 16.h, top: 15.v, bottom: 16.v),
                onTap: () {
                  Navigator.pop(context);
                }),
            title: AppbarSubtitle(
                text: "Choose Card", margin: EdgeInsets.only(left: 12.h)),
            actions: [
              AppbarTrailingImage(
                imagePath: AppImageConstants.imgPlusIcon,
                margin: EdgeInsets.fromLTRB(16.h, 15.v, 16.h, 16.v),
                onTap: () {
                  chooseCreditCubit.showEditDialog(context);
                },
              )
            ]),
        body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 27.v),
            child: BlocBuilder<ChooseCreditCubit, ChooseCreditState>(
              builder: (context, state) {
                return ListView.separated(
                    itemCount: chooseCreditCubit.creditcardItemList.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 20.v);
                    },
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          CreditcardItemWidget(
                            chooseCreditCubit: chooseCreditCubit,
                            index: index,
                          ),
                          IconButton(
                              onPressed: () {
                                chooseCreditCubit.deleteCardItemFromList(index);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: appTheme.blueGray300,
                              ))
                        ],
                      );
                    });
              },
            )),
        bottomNavigationBar: CustomElevatedButton(
            text: "Pay 766.86",
            margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.successScreen);
            }));
  }
}
