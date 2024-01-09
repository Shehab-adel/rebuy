import 'package:flutter/material.dart';
import 'package:rebuy/core/utils/size_utils.dart';
import 'package:rebuy/presentation/explore_page/cubit/explore_cubit.dart';

import '../../../core/constants/app_string.dart';
import '../../../core/utils/theme/theme_helper.dart';
import 'womantshirticon_item_widget.dart';

class WomenFashionWidget extends StatelessWidget {
  const WomenFashionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ExploreCubit exploreCubit = ExploreCubit.get(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(AppStrings.womenFashion, style: theme.textTheme.titleSmall),
      SizedBox(height: 13.v),
      GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 93.v,
              crossAxisCount: 4,
              mainAxisSpacing: 21.h,
              crossAxisSpacing: 21.h),
          physics: NeverScrollableScrollPhysics(),
          itemCount: exploreCubit.womenFashionMap.length,
          itemBuilder: (context, index) {
            return WomantshirticonItemWidget(
              imagePath: exploreCubit.womenFashionMap.values.elementAt(index),
              text: exploreCubit.womenFashionMap.keys.elementAt(index),
            );
          })
    ]);
  }
}
