import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/core/utils/functions.dart';
import 'package:rebuy/presentation/cart_page/cubit/cart_cubit.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/dash_cubit.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/states.dart';
import 'package:rebuy/presentation/dashboard_page/models/data_model.dart';
import 'package:rebuy/presentation/product_detail_screen/widgets/product_overview_widget.dart';
import 'package:rebuy/presentation/product_detail_screen/widgets/review_widget.dart';
import 'package:rebuy/presentation/product_detail_screen/widgets/select_size_widget.dart';
import 'package:rebuy/presentation/product_detail_screen/widgets/specifications_widget.dart';
import 'package:rebuy/presentation/product_detail_screen/widgets/you_might_also_like_widget.dart';
import 'package:rebuy/widgets/app_bar/appbar_trailing_image.dart';
import 'package:rebuy/widgets/custom_elevated_button.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({required this.dashCubit});
  final DashCubit dashCubit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leadingWidth: 25.h,
            title: Text(
              dashCubit.dataList?[dashCubit.selectedProductIndex].title ?? '',
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
            ),
            actions: [
              AppbarTrailingImage(
                  imagePath: AppImageConstants.imgNavExplore,
                  margin: EdgeInsets.only(left: 16.h, top: 16.v, right: 15.h),
                  onTap: () {}),
              AppbarTrailingImage(
                  imagePath: AppImageConstants.imgMoreIcon,
                  margin: EdgeInsets.only(left: 16.h, top: 16.v, right: 31.h))
            ]),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 12.v),
            ProductOverviewWidget(dashCubit: dashCubit),
            SizedBox(height: 42.v),
            SelectSizeWidget(dashCubit: dashCubit),
            SizedBox(height: 53.v),
            SpecificationsWidget(dashCubit: dashCubit),
            SizedBox(height: 53.v),
            ReviewWidget(dashCubit: dashCubit),
            SizedBox(height: 53.v),
            YouMightAlsoLike(dashCubit: dashCubit),
            SizedBox(height: 30.v)
          ]),
        ),
        bottomNavigationBar: BlocConsumer<DashCubit, DashState>(
          listener: (context, state) {
            if (state is AddItemToCartState) {
              snackBar(AppStrings.ItemAddedToCart);
            }
          },
          builder: (context, state) {
            return CustomElevatedButton(
                text: "Add To Cart",
                onPressed: () {
                  dashCubit.addItemToCart(
                      dashCubit.dataList?[dashCubit.selectedProductIndex] ??
                          DataModel());
                  CartCubit.get(context).sumOfItemsPrice(dashCubit
                          .dataList?[dashCubit.selectedProductIndex].price ??
                      0);
                },
                margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v));
          },
        ));
  }
}
