import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/core/utils/theme/theme_helper.dart';
import 'package:rebuy/network/local/cache%20helper.dart';
import 'package:rebuy/presentation/add_card_screen/cubit/add_card_cubit.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/dash_cubit.dart';
import 'package:rebuy/presentation/explore_page/cubit/explore_cubit.dart';
import 'package:rebuy/presentation/login_screen/cubit/login_cubit.dart';
import 'package:rebuy/presentation/profile_screen/cubit/profile_cubit.dart';
import 'package:rebuy/routes/app_routes.dart';
import 'core/constants/app_string.dart';
import 'presentation/register_screen/cubit/register_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await CacheHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(
            create: (context) => DashCubit()
              ..fetchFlashSaleCollection()
              ..fetchMegaSaleCollection()),
        BlocProvider(create: (context) => ExploreCubit()),
        BlocProvider(
            create: (context) =>
                ProfileCubit()..getFirebaseAuthCurrentUserName()),
        BlocProvider(create: (context) => AddCardCubit()),
      ],
      child: MaterialApp(
        theme: theme,
        title: AppStrings.rebuy,
        debugShowCheckedModeBanner: false,
        initialRoute: FirebaseAuth.instance.currentUser == null
            ? AppRoutes.registerScreen
            : AppRoutes.dashboardContainerScreen,
        routes: AppRoutes.routes,
      ),
    );
  }
}

/*
        initialRoute: FirebaseAuth.instance.currentUser == null
            ? AppRoutes.registerScreen
            : AppRoutes.dashboardContainerScreen,

*/