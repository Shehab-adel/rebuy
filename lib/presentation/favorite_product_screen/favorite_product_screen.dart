import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/presentation/cart_page/cubit/cart_cubit.dart';
import 'package:rebuy/presentation/cart_page/cubit/cart_state.dart';
import '../favorite_product_screen/widgets/favoriteproduct_item_widget.dart';

class FavoriteProductScreen extends StatelessWidget {
  const FavoriteProductScreen({Key? key, required this.cartCubit})
      : super(key: key);
  final CartCubit cartCubit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leadingWidth: 25.h,
            title: Text(
              AppStrings.favoriteProduct,
              style: theme.textTheme.titleSmall!
                  .copyWith(color: theme.colorScheme.onPrimary.withOpacity(1)),
            ),
            centerTitle: true,
            leading: Container(
              margin: EdgeInsets.only(left: 8.h),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: appTheme.blueGray300,
                  ),
                  iconSize: 20),
            )),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return Padding(
                padding: EdgeInsets.only(left: 16.h, top: 8.v, right: 16.h),
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 283.v,
                        crossAxisCount: 2,
                        mainAxisSpacing: 13.h,
                        crossAxisSpacing: 13.h),
                    physics: BouncingScrollPhysics(),
                    itemCount: cartCubit.favoriteList.length,
                    itemBuilder: (context, index) {
                      return FavoriteproductItemWidget(
                        onTapProductItem: () {
                          Navigator.pushNamed(
                              context, AppRoutes.productDetailScreen);
                        },
                        cartCubit: cartCubit,
                        index: index,
                      );
                    }));
          },
        ));
  }
}
