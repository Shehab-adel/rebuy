import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/dash_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashCubit(),
      child: MaterialApp(
        theme: theme,
        title: AppStrings.rebuy,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.dashboardContainerScreen,
        routes: AppRoutes.routes,
      ),
    );
  }
}
