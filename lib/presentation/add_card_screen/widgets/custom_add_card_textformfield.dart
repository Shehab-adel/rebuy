import 'package:flutter/material.dart';
import 'package:rebuy/core/utils/size_utils.dart';
import 'package:rebuy/core/utils/theme/theme_helper.dart';
import 'package:rebuy/presentation/add_card_screen/cubit/add_card_cubit.dart';
import 'package:rebuy/widgets/custom_text_form_field.dart';

class CustomAddCardTextFormField extends StatelessWidget {
  const CustomAddCardTextFormField(
      {super.key,
      required this.addCardCubit,
      required this.title,
      required this.hintText,
      required this.textEditingController});
  final AddCardCubit addCardCubit;
  final String title;
  final String hintText;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: theme.textTheme.titleSmall),
      SizedBox(height: 12.v),
      CustomTextFormField(
          controller: textEditingController,
          hintText: hintText,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.number)
    ]);
  }
}
