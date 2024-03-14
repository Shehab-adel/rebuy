import 'package:flutter/material.dart';
import 'package:rebuy/core/utils/app_export.dart';

import 'cartlist_item_widget.dart';

class CardListWidget extends StatelessWidget {
  const CardListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 16.v);
        },
        itemCount: 2,
        itemBuilder: (context, index) {
          return CartlistItemWidget();
        });
  }
}
