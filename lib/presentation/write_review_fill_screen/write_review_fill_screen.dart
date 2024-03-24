import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/dash_cubit.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/states.dart';
import 'package:rebuy/widgets/custom_elevated_button.dart';
import 'package:rebuy/widgets/custom_rating_bar.dart';
import 'package:rebuy/widgets/custom_text_form_field.dart';

class WriteReviewFillScreen extends StatelessWidget {
  WriteReviewFillScreen({required this.dashCubit});

  final DashCubit dashCubit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            leadingWidth: 20.h,
            leading: Container(
              margin: EdgeInsets.only(left: 8.h),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: appTheme.blueGray300,
                  ),
                  iconSize: 20),
            ),
            title: Padding(
                padding: EdgeInsets.only(left: 12.h),
                child: Text(
                  AppStrings.writeReview,
                  style: theme.textTheme.titleMedium!.copyWith(
                    color: theme.colorScheme.onPrimary.withOpacity(1),
                  ),
                ),
            )),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 27.v),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
                width: 343.h,
                child: Text(AppStrings.plzWriteAllSatisfaction,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall!.copyWith(height: 1.50))),
            SizedBox(height: 13.v),
            BlocBuilder<DashCubit, DashState>(builder: (context, state) {
              return CustomRatingBar(
                initialRating: 5,
                itemSize: 32,
                onRatingUpdate: (n) {
                  dashCubit.changeReviewRating(n);
                },
              );
            }),
            SizedBox(height: 22.v),
            Text(AppStrings.writeYourReview, style: theme.textTheme.titleSmall),
            SizedBox(height: 13.v),
            CustomTextFormField(
                controller: dashCubit.writeReviewController,
                hintText: AppStrings.addReview,
                hintStyle: CustomTextStyles.labelLargeBluegray300,
                textInputAction: TextInputAction.done,
                maxLines: 8,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.h, vertical: 17.v)),
            SizedBox(height: 5.v)
          ]),
        ),
        bottomNavigationBar:
            BlocConsumer<DashCubit, DashState>(listener: (context, state) {
          if (state is LoadingProductReviewToCollection) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Center(
                      child: Lottie.asset(AppImageConstants.lottieLoading,
                          backgroundLoading: true));
                });
          } else if (state is SuccessfulProductReviewToCollection) {
            Navigator.pop(context);
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Center(
                      child: Lottie.asset(AppImageConstants.lottieSuccessful));
                });
            Future.delayed(Duration(seconds: 3), () {
              Navigator.pop(context);
            });
          } else if (state is FailProductReviewToCollection) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Center(
                      child: Lottie.asset(AppImageConstants.lottieFail));
                });
            Future.delayed(Duration(seconds: 3), () {
              Navigator.pop(context);
            });
          }
        }, builder: (context, state) {
          return CustomElevatedButton(
              text: AppStrings.writeReview,
              onPressed: () {
                dashCubit.writeProductReviewToFirestore(
                    dashCubit.dataList?[dashCubit.selectedProductIndex].docId ??
                        '');
                dashCubit.getReviewAndRatingAfterUserUpdate(dashCubit.dataList?[dashCubit.selectedProductIndex].docId ??
                    '');
              },
              margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 34.v));
        }));
  }
}
