import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/presentation/dashboard_container_screen/dashboard_container_screen.dart';
import 'package:rebuy/presentation/explore_page/cubit/explore_cubit.dart';
import 'package:rebuy/presentation/explore_page/cubit/states.dart';
import 'package:rebuy/presentation/explore_page/widgets/man_fashion_widget.dart';
import 'package:rebuy/presentation/explore_page/widgets/women_fashion_widget.dart';

// ignore_for_file: must_be_immutable
class ExploreScreen extends StatelessWidget {
  ExploreScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExploreCubit, ExploreSate>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 25.v),
                child: Column(children: [
                  ManFashionWidget(),
                  SizedBox(height: 37.v),
                  WomenFashionWidget(),
                  SizedBox(height: 5.v)
                ])),
          );
        });
  }
}
