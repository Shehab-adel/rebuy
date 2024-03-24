import 'package:flutter/material.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/dash_cubit.dart';
import 'recomended_item_widget.dart';

class YouMightAlsoLike extends StatelessWidget {
  const YouMightAlsoLike({required this.dashCubit});
  final DashCubit dashCubit;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: Text("You Might Also Like",
              style: CustomTextStyles.titleSmall_1)),
      SizedBox(height: 11.v),
      Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
              height: 238.v,
              child: ListView.separated(
                  padding: EdgeInsets.only(left: 16.h),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 16.h);
                  },
                  itemCount: dashCubit.dataList?.length ?? 0,
                  itemBuilder: (context, index) {
                    return RecomendedItemWidget(
                        dashCubit: dashCubit, index: index);
                  })))
    ]);
  }
}
