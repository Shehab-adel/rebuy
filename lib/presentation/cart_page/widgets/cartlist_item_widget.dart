import 'package:flutter/material.dart';
import 'package:rebuy/core/app_export.dart';

// ignore: must_be_immutable
class CartlistItemWidget extends StatelessWidget {
  const CartlistItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.v),
      decoration: AppDecoration.outlineBlue.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomImageView(
            imagePath: AppImageConstants.imgImageProduct,
            height: 72.adaptSize,
            width: 72.adaptSize,
            radius: BorderRadius.circular(
              5.h,
            ),
            margin: EdgeInsets.symmetric(vertical: 1.v),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150.h,
                    child: Text(
                      "Nike Air Zoom Pegasus 36 Miami",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelLarge!.copyWith(
                        height: 1.50.v,
                      ),
                    ),
                  ),
                  CustomImageView(
                    imagePath: AppImageConstants.imgLoveIcon,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    color: appTheme.pink300,
                    margin: EdgeInsets.only(
                      left: 20.h,
                      bottom: 10.v,
                    ),
                  ),
                  CustomImageView(
                    imagePath: AppImageConstants.imgTrashIcon,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    color: appTheme.blueGray300,
                    margin: EdgeInsets.only(
                      left: 8.h,
                      bottom: 10.v,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 17.v),
              SizedBox(
                width: 227.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "299,43",
                      style: CustomTextStyles.labelLargePrimary,
                    ),
                    Spacer(),
                    CustomImageView(
                      imagePath: AppImageConstants.imgminus,
                      height: 20.v,
                      width: 33.h,
                      color: appTheme.blueGray300,
                    ),
                    Container(
                      height: 20.v,
                      width: 36.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: appTheme.blue50,
                        border: Border.all(
                          color: appTheme.blue50,
                          width: 1.h,
                          strokeAlign: strokeAlignCenter,
                        ),
                      ),
                      child: Text('1',
                          style: CustomTextStyles.bodySmallOnPrimary_2),
                    ),
                    CustomImageView(
                      imagePath: AppImageConstants.imgPlus,
                      height: 20.v,
                      width: 33.h,
                      color: appTheme.blueGray300,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
