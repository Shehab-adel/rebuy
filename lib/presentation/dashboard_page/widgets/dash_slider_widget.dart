import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/dash_cubit.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/states.dart';

class DashSliderWidget extends StatelessWidget {
  DashSliderWidget({required this.dashCubit});
  final DashCubit dashCubit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.h),
      child: BlocConsumer<DashCubit, DashState>(
        listener: (context, state) {},
        builder: (context, state) {
          return CarouselSlider.builder(
              options: CarouselOptions(
                  height: 206.v,
                  initialPage: dashCubit.sliderIndex,
                  autoPlay: true,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: false,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    dashCubit.changeAnimatedSmoothIndex(index);
                  }),
              itemCount: dashCubit.dataList?.length ?? 0,
              itemBuilder: (context, index, realIndex) {
                return SizedBox(
                  height: 206.v,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      CustomImageView(
                        imagePath: dashCubit.dataList?[index].image,
                        height: 206.v,
                        fit: BoxFit.fill,
                        radius: BorderRadius.circular(
                          5.h,
                        ),
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
