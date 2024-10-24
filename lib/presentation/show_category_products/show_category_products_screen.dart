import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:rebuy/core/utils/app_export.dart';
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
          dashCubit.categoryName,
          style: theme.textTheme.titleSmall!
              .copyWith(color: theme.colorScheme.onPrimary.withOpacity(1)),
        ),
        centerTitle: true,
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
      ),
      body: BlocBuilder<DashCubit, DashState>(builder: (context, state) {
        if (state is LoadingFetchCollection || state is FailFetchCollection) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        }
        return Container(
          constraints: BoxConstraints.expand(),
          child: dashCubit.dataList!.isEmpty
              ? Lottie.asset(AppImageConstants.lottieEmptyDataBox1,
                  height: 100.h)
              : ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 12.v),
                  itemCount: dashCubit.dataList?.length ?? 0,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        dashCubit.changeSelectedProductIndex(index);
                        Navigator.pushNamed(
                            context, AppRoutes.productDetailScreen);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomImageView(
                            imagePath: dashCubit.dataList![index].image ?? '',
                            height: 280.v,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(height: 25.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.h),
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
                                      height: 1.50,
                                      color: Colors.grey.shade400),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                                SizedBox(height: 25.v),
                                Text(
                                  "${dashCubit.dataList?[index].price ?? ''}",
                                  style: CustomTextStyles.labelLargePrimary
                                      .copyWith(
                                    fontSize: 16.fSize,
                                  ),
                                ),
                                SizedBox(height: 20.v),
                                dashCubit.dataList?[index].price ==
                                        dashCubit.dataList?[index].oldPrice
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
                                            "${dashCubit.dataList?[index].oldPrice}",
                                            style: CustomTextStyles.bodySmall10
                                                .copyWith(
                                              fontSize: 15.fSize,
                                              decoration:
                                                  TextDecoration.lineThrough,
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
