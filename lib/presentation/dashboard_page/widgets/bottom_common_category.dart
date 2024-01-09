import 'package:flutter/material.dart';
import 'package:rebuy/core/app_export.dart';

import 'dashboard_item_widget.dart';

class BottomCommonCategory extends StatelessWidget {
  const BottomCommonCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 16.h),
        child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 283.v,
                crossAxisCount: 2,
                mainAxisSpacing: 13.h,
                crossAxisSpacing: 13.h),
            physics: NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              return DashboardItemWidget();
            }));
  }
}
