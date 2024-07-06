import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/presentation/register_screen/cubit/register_cubit.dart';
import 'package:rebuy/presentation/register_screen/cubit/register_state.dart';

class ListTitleBranch extends StatelessWidget {
  const ListTitleBranch({required this.registerCubit, super.key});
  final RegisterCubit registerCubit;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(builder: (context, state) {
      return ListTile(
        title: Row(
          children: [
            Icon(
              Icons.location_city,
              color: Colors.blue.shade200,
            ),
            SizedBox(width: 15.h),
            Text(
              "Branch",
              style: theme.textTheme.labelLarge!
                  .copyWith(color: theme.colorScheme.onPrimary.withOpacity(1)),
            ),
          ],
        ),
        trailing: DropdownButton(
          dropdownColor: Colors.white,
          value: registerCubit.dropdownValue,
          icon: CustomImageView(
              imagePath: AppImageConstants.imgRightIcon,
              height: 24.adaptSize,
              width: 24.adaptSize,
              margin: EdgeInsets.only(left: 16.h)),
          items: registerCubit.branchesList.map((String item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item, style: theme.textTheme.bodySmall),
            );
          }).toList(),
          onChanged: (String? value) {
            registerCubit.changeBrancheInDropdown(value);
          },
        ),
      );
    });
  }
}
