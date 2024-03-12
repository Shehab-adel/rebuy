import 'package:flutter/material.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/core/utils/theme/theme_helper.dart';

class SpecificationsWidget extends StatelessWidget {
  const SpecificationsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Specification", style: theme.textTheme.titleSmall),
          SizedBox(height: 19.v),
          Container(
              width: 320.h,
              margin: EdgeInsets.only(right: 31.h),
              child: Text(
                  "The Nike Air Max 270 React ENG combines a full-length React foam midsole with a 270 Max Air unit for unrivaled comfort and a striking visual experience.",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall!.copyWith(height: 1.80)))
        ]));
  }
}
