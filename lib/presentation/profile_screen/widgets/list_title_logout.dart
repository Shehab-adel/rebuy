import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/presentation/profile_screen/cubit/profile_cubit.dart';
import 'package:rebuy/presentation/profile_screen/cubit/profile_state.dart';

class ListTitleLogout extends StatelessWidget {
  const ListTitleLogout({required this.profileCubit, super.key});
  final ProfileCubit profileCubit;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (BuildContext context, state) {
        return ListTile(
          title: Row(
            children: [
              Icon(
                Icons.logout,
                color: Colors.blue.shade200,
              ),
              SizedBox(width: 15.h),
              Text(
                AppStrings.logout,
                style: theme.textTheme.labelLarge!.copyWith(
                    color: theme.colorScheme.onPrimary.withOpacity(1)),
              ),
            ],
          ),
          trailing: CustomImageView(
              imagePath: AppImageConstants.imgRightIcon,
              height: 24.adaptSize,
              width: 24.adaptSize,
              margin: EdgeInsets.only(left: 16.h)),
          onTap: () {
            profileCubit.showLogoutConfirmationDialog(context);
          },
        );
      },
    );
  }
}
