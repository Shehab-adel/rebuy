import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/presentation/dashboard_container_screen/dashboard_container_screen.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/dash_cubit.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/states.dart';
import 'package:rebuy/presentation/dashboard_page/widgets/category_widget.dart';
import 'package:rebuy/presentation/dashboard_page/widgets/dash_slider_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'widgets/custom_flash_mega_sale.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({required this.dashCubit});
  final DashCubit dashCubit;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashCubit, DashState>(builder: (context, state) {
      return Scaffold(
        appBar: buildAppBar(context),
        body: Padding(
            padding: EdgeInsets.only(left: 16.h, bottom: 5.v),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DashSliderWidget(dashCubit: dashCubit),
                    SizedBox(height: 25.v),
                    //Three animated smooth
                    Container(
                        height: 8.v,
                        margin: EdgeInsets.only(left: 135.h),
                        child: AnimatedSmoothIndicator(
                            activeIndex: dashCubit.sliderIndex,
                            count: 6,
                            axisDirection: Axis.horizontal,
                            effect: ScrollingDotsEffect(
                                spacing: 10,
                                activeDotColor:
                                    theme.colorScheme.primary.withOpacity(1),
                                dotColor: appTheme.blue50,
                                dotHeight: 8.v,
                                dotWidth: 8.h))),
                    SizedBox(height: 25.v),
                    //Categories
                    DashCategoryWidget(dashCubit: dashCubit),
                    SizedBox(height: 16.v),
                    //Flash Sale
                    CustomFlashAndMegaSale(
                      categoryText: AppStrings.flashSale,
                      dashCubit: dashCubit,
                      list: dashCubit.flashSaleList ?? [],
                      image: AppImageConstants.lottieEmptyDataBox1,
                    ),
                    SizedBox(height: 23.v),
                    CustomFlashAndMegaSale(
                      categoryText: AppStrings.megaSale,
                      dashCubit: dashCubit,
                      list: dashCubit.megaSaleList ?? [],
                      image: AppImageConstants.lottieEmptyDataBox2,
                    ),
                    SizedBox(height: 36.v),
                  ]),
            )),
      );
    });
  }
}
