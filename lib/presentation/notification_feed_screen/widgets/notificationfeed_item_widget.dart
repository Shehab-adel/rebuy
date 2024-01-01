import 'package:flutter/material.dart';
import 'package:rebuy/core/app_export.dart';

// ignore: must_be_immutable
class NotificationfeedItemWidget extends StatelessWidget {
  const NotificationfeedItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(16.h),
      decoration: AppDecoration.fillOnPrimaryContainer,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: AppImageConstants.imgProductImage,
            height: 48.adaptSize,
            width: 48.adaptSize,
            radius: BorderRadius.circular(
              5.h,
            ),
            margin: EdgeInsets.only(bottom: 40.v),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "New Product",
                    style: theme.textTheme.titleSmall,
                  ),
                  SizedBox(height: 6.v),
                  SizedBox(
                    width: 269.h,
                    child: Text(
                      "Nike Air Zoom Pegasus 36 Miami - Special For your Activity",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall!.copyWith(
                        height: 1.80,
                      ),
                    ),
                  ),
                  SizedBox(height: 4.v),
                  Text(
                    "June 3, 2015 5:06 PM",
                    style: CustomTextStyles.bodySmallOnPrimary10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
