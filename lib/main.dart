import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/dash_cubit.dart';
import 'package:rebuy/presentation/explore_page/cubit/explore_cubit.dart';
import 'package:rebuy/presentation/login_screen/cubit/login_cubit.dart';
import 'firebase_options.dart';
import 'presentation/register_screen/cubit/register_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) {
          final dashCubit = DashCubit();
          dashCubit.fetchDataFromFirestore();
          return dashCubit;
        }),
        BlocProvider(create: (context) => ExploreCubit())
      ],
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
