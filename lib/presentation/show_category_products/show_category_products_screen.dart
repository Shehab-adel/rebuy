import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/dash_cubit.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/states.dart';

class ShowCategoryProductsScreen extends StatelessWidget {
  const ShowCategoryProductsScreen({required this.dashCubit});
  final DashCubit dashCubit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          dashCubit.categoryMap.keys.elementAt(dashCubit.categoryIndex),
          style: theme.textTheme.titleSmall!
              .copyWith(color: theme.colorScheme.onPrimary.withOpacity(1)),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<DashCubit, DashState>(listener: (context, state) {
        if (state is SuccessfulFetchCollection && dashCubit.dataList!.isEmpty) {
          dashCubit.loginshowDialog(context, 'Empty!',
              'There is no produts here.Please try to add produts first');
        }
      }, builder: (context, state) {
        if (state is LoadingFetchCollection || state is FailFetchCollection) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        }
        return Container(
          constraints: BoxConstraints.expand(),
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 12.v),
            itemCount: dashCubit.dataList?.length ?? 0,
            itemBuilder: (context, index) {
              return Container(
                height: 500.v,
                padding: EdgeInsets.all(10),
                decoration: AppDecoration.outlineBlue.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 260.v,
                      width: 130.h,
                      child: Image.network(
                        dashCubit.dataList?[index].image ?? '',
                      ),
                    ),
                    SizedBox(height: 25.h),
                    Padding(
                      padding: EdgeInsets.only(left: 5.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            dashCubit.dataList?[index].title ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.labelLarge!.copyWith(
                              height: 1.50,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            dashCubit.dataList?[index].description ?? '0',
                            style: theme.textTheme.labelLarge!.copyWith(
                                height: 1.50, color: Colors.grey.shade400),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                          SizedBox(height: 25.v),
                          Text(
                            "${dashCubit.dataList?[index].price ?? ''}",
                            style: CustomTextStyles.labelLargePrimary.copyWith(
                              fontSize: 16.fSize,
                            ),
                          ),
                          SizedBox(height: 20.v),
                          dashCubit.dataList?[index].price ==
                                  dashCubit.dataList?[index].oldPrice
                              ? Text(
                                  "No Disccount",
                                  style: CustomTextStyles.bodySmall10.copyWith(
                                      fontSize: 15.fSize, color: Colors.red),
                                )
                              : Row(
                                  children: [
                                    Text(
                                      "${dashCubit.dataList?[index].oldPrice}",
                                      style:
                                          CustomTextStyles.bodySmall10.copyWith(
                                        fontSize: 15.fSize,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    SizedBox(width: 16.h),
                                    Text(
                                      "${dashCubit.dataList?[index].disccountPrecentage} %",
                                      style: theme.textTheme.labelMedium,
                                    ),
                                  ],
                                )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
