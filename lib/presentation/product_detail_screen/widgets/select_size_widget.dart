import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/dash_cubit.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/states.dart';

class SelectSizeWidget extends StatelessWidget {
  const SelectSizeWidget({required this.dashCubit});
  final DashCubit dashCubit;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: Text("Select Size", style: theme.textTheme.titleSmall)),
      SizedBox(height: 13.v),
      BlocBuilder<DashCubit, DashState>(builder: (context, state) {
        return SizedBox(
            height: 48.v,
            child: ListView.separated(
                padding: EdgeInsets.only(left: 16.h),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(width: 16.h),
                itemCount: dashCubit.dataList?[dashCubit.selectedProductIndex]
                        .sizeList?.length ??
                    0,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      dashCubit.changeSelectedSizeItem(index);
                    },
                    child: Container(
                      width: 45.h,
                      alignment: Alignment.center,
                      decoration: AppDecoration.outlineBlue.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder24,
                          border: Border.all(
                              width: 2,
                              color: dashCubit.selectedSizeItem == index
                                  ? appTheme.lightBlue600
                                  : appTheme.gray400)),
                      child: Text(
                        '${dashCubit.dataList?[dashCubit.selectedProductIndex].sizeList?[index] ?? 0}',
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                  );
                }));
      })
    ]);
  }
}
