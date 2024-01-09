import 'package:flutter/widgets.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/presentation/explore_page/cubit/explore_cubit.dart';

import 'manworkequipment_item_widget.dart';

class ManFashionWidget extends StatelessWidget {
  const ManFashionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ExploreCubit exploreCubit = ExploreCubit.get(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(AppStrings.manFashion, style: theme.textTheme.titleSmall),
      SizedBox(height: 13.v),
      GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 94.v,
              crossAxisCount: 4,
              mainAxisSpacing: 21.h,
              crossAxisSpacing: 21.h),
          physics: NeverScrollableScrollPhysics(),
          itemCount: exploreCubit.manFashionMap.length,
          itemBuilder: (context, index) {
            return ManworkequipmentItemWidget(
              imagePath: exploreCubit.manFashionMap.values.elementAt(index),
              text: exploreCubit.manFashionMap.keys.elementAt(index),
            );
          })
    ]);
  }
}
