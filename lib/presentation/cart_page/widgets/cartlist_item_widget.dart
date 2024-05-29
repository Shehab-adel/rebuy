import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/presentation/cart_page/cubit/cart_cubit.dart';
import 'package:rebuy/presentation/cart_page/cubit/cart_state.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/dash_cubit.dart';

class CartlistItemWidget extends StatelessWidget {
  const CartlistItemWidget({required this.dashCubit, required this.cartCubit});
  final DashCubit dashCubit;
  final CartCubit cartCubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {},
        builder: (context, state) {
          return dashCubit.cartDataModelMap.isEmpty
              ? LottieBuilder.asset(AppImageConstants.lottieEmptyDataBox1)
              : SizedBox(
                  height: 340.h,
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                            padding: EdgeInsets.symmetric(vertical: 14.v),
                            decoration: AppDecoration.outlineBlue.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomImageView(
                                  imagePath: dashCubit.cartDataModelMap.entries
                                      .elementAt(index)
                                      .key
                                      .image,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 150.h,
                                          child: Text(
                                            "${dashCubit.cartDataModelMap.entries.elementAt(index).key.title}",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: theme.textTheme.labelLarge!
                                                .copyWith(
                                              height: 1.50.v,
                                            ),
                                          ),
                                        ),
                                        CustomImageView(
                                          imagePath:
                                              AppImageConstants.imgLoveIcon,
                                          height: 24.adaptSize,
                                          width: 24.adaptSize,
                                          color: cartCubit.favoriteList
                                                  .contains(dashCubit
                                                      .cartDataModelMap.entries
                                                      .elementAt(index)
                                                      .key)
                                              ? appTheme.pink300
                                              : appTheme.gray400,
                                          margin: EdgeInsets.only(
                                            left: 20.h,
                                            bottom: 10.v,
                                          ),
                                          onTap: () {
                                            cartCubit.addToFavoriteList(
                                                dashCubit
                                                    .cartDataModelMap.entries
                                                    .elementAt(index)
                                                    .key);
                                          },
                                        ),
                                        CustomImageView(
                                          imagePath:
                                              AppImageConstants.imgTrashIcon,
                                          height: 24.adaptSize,
                                          width: 24.adaptSize,
                                          color: appTheme.blueGray300,
                                          margin: EdgeInsets.only(
                                            left: 8.h,
                                            bottom: 10.v,
                                          ),
                                          onTap: () {
                                            cartCubit.deleteItemFromCartList(
                                              dashCubit.cartDataModelMap.entries
                                                  .elementAt(index)
                                                  .key,
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 17.v),
                                    SizedBox(
                                      width: 227.h,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${dashCubit.cartDataModelMap.entries.elementAt(index).key.price}",
                                            style: CustomTextStyles
                                                .labelLargePrimary,
                                          ),
                                          Spacer(),
                                          CustomImageView(
                                            imagePath:
                                                AppImageConstants.imgminus,
                                            height: 20.v,
                                            width: 33.h,
                                            color: appTheme.blueGray300,
                                            onTap: () {
                                              cartCubit
                                                  .decreaseItemFromCartList(
                                                      dashCubit.cartDataModelMap
                                                          .entries
                                                          .elementAt(index)
                                                          .key);
                                              // cartCubit
                                              //     .sumOfItemsPriceByDecreaseIcon(
                                              //         dashCubit.cartDataModelMap
                                              //             .entries
                                              //             .elementAt(index)
                                              //             .key);
                                            },
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
                                            child: Text(
                                                "${dashCubit.cartDataModelMap.entries.elementAt(index).key.quantity}",
                                                style: CustomTextStyles
                                                    .bodySmallOnPrimary_2),
                                          ),
                                          CustomImageView(
                                            imagePath:
                                                AppImageConstants.imgPlus,
                                            height: 20.v,
                                            width: 33.h,
                                            color: appTheme.blueGray300,
                                            onTap: () {
                                              cartCubit.increaseItemToCart(
                                                  dashCubit
                                                      .cartDataModelMap.entries
                                                      .elementAt(index)
                                                      .key);
                                              cartCubit
                                                  .sumOfItemsPriceByPlusIcon(
                                                      dashCubit.cartDataModelMap
                                                          .entries
                                                          .elementAt(index)
                                                          .key);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ));
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 16.v),
                      itemCount: dashCubit.cartDataModelMap.length),
                );
        });
  }
}
