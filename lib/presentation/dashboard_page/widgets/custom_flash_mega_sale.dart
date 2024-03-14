import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/states.dart';
import 'package:rebuy/presentation/dashboard_page/models/data_model.dart';
import '../cubit/dash_cubit.dart';

class CustomFlashAndMegaSale extends StatelessWidget {
  const CustomFlashAndMegaSale(
      {required this.categoryText,
      required this.dashCubit,
      required this.list,
      required this.image});
  final String categoryText;
  final DashCubit dashCubit;
  final List<DataModel>? list;
  final String image;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashCubit()
        ..fetchFlashSaleCollection()
        ..fetchMegaSaleCollection(),
      child: BlocBuilder<DashCubit, DashState>(builder: (context, sate) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
                padding: EdgeInsets.only(right: 16.h),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(categoryText,
                          style: theme.textTheme.titleSmall!.copyWith(
                              color:
                                  theme.colorScheme.onPrimary.withOpacity(1))),
                      Text(AppStrings.seeMore,
                          style: CustomTextStyles.titleSmallPrimary.copyWith(
                              color: theme.colorScheme.primary.withOpacity(1)))
                    ])),
            SizedBox(height: 16.v),
            SizedBox(
                height: 270.v,
                child: list!.isEmpty
                    ? Lottie.asset(image, height: 100.h)
                    : ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 16.h),
                        itemCount: list?.length ?? 0,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(15.h),
                            decoration: AppDecoration.outlineBlue50.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomImageView(
                                  imagePath: list?[index].image,
                                  height: 133.v,
                                  width: 133.h,
                                  radius: BorderRadius.circular(5),
                                ),
                                SizedBox(height: 10.v),
                                SizedBox(
                                  width: 107.h,
                                  child: Text(
                                    list?[index].title ?? '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.labelLarge!.copyWith(
                                      height: 1.50,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.v),
                                Text(
                                  "${list?[index].price ?? 0.0}",
                                  style: CustomTextStyles.labelLargePrimary,
                                ),
                                SizedBox(height: 10.v),
                                list?[index].price == list?[index].oldPrice
                                    ? Text(
                                        "No Disccount",
                                        style: CustomTextStyles.bodySmall10
                                            .copyWith(
                                                fontSize: 15.fSize,
                                                color: Colors.red),
                                      )
                                    : Row(
                                        children: [
                                          Text(
                                            "${list?[index].oldPrice ?? 0.0}",
                                            style: CustomTextStyles.bodySmall10
                                                .copyWith(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 8.h),
                                            child: Text(
                                              "${list?[index].disccountPrecentage ?? 0.0} %",
                                              style:
                                                  theme.textTheme.labelMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                              ],
                            ),
                          );
                        })),
          ],
        );
      }),
    );
  }
}
