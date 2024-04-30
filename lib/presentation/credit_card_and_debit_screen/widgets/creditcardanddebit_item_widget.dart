import 'package:flutter/material.dart';
import 'package:rebuy/core/utils/app_export.dart';

class CreditcardanddebitItemWidget extends StatelessWidget {
  CreditcardanddebitItemWidget() : super();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, AppRoutes.detailsCardScreen);
      },
      child: Expanded(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 14.v);
                  },
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 21.h,
                        vertical: 24.v,
                      ),
                      decoration: AppDecoration.fillPrimary.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                            imagePath: AppImageConstants.imgVolume,
                            height: 22.v,
                            width: 36.h,
                            margin: EdgeInsets.only(left: 3.h),
                          ),
                          SizedBox(height: 30.v),
                          Text(
                            "6326    9124    8124    9875",
                            style: theme.textTheme.headlineSmall,
                          ),
                          SizedBox(height: 17.v),
                          Row(
                            children: [
                              Opacity(
                                opacity: 0.5,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 2.v),
                                  child: Text(
                                    "CARD HOLDER",
                                    style: CustomTextStyles
                                        .bodySmallOnPrimaryContainer10,
                                  ),
                                ),
                              ),
                              Opacity(
                                opacity: 0.5,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 37.h),
                                  child: Text(
                                    "CARD SAVE",
                                    style: CustomTextStyles
                                        .bodySmallOnPrimaryContainer10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.v),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 1.v),
                                child: Text(
                                  "Dominic Ovo",
                                  style: CustomTextStyles
                                      .labelMediumOnPrimaryContainer,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 41.h),
                                child: Text(
                                  "06/24",
                                  style: CustomTextStyles
                                      .labelMediumOnPrimaryContainer,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }))),
    );
  }
}
