import 'package:flutter/material.dart';
import 'package:rebuy/core/app_export.dart';

class SelectSizeWidget extends StatelessWidget {
  const SelectSizeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: Text("Select Size", style: theme.textTheme.titleSmall)),
      SizedBox(height: 13.v),
      SizedBox(
          height: 48.v,
          child: ListView.separated(
              padding: EdgeInsets.only(left: 16.h),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: 16.h);
              },
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  width: 52.adaptSize,
                  padding: EdgeInsets.symmetric(
                    horizontal: 19.h,
                    vertical: 13.v,
                  ),
                  decoration: AppDecoration.outlineBlue.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder24,
                  ),
                  child: Text(
                    "6",
                    style: theme.textTheme.titleSmall,
                  ),
                );
              }))
    ]);
  }
}
