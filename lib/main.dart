import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/core/utils/theme/theme_helper.dart';
import 'package:rebuy/network/local/cache%20helper.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/dash_cubit.dart';
import 'package:rebuy/presentation/explore_page/cubit/explore_cubit.dart';
import 'package:rebuy/presentation/login_screen/cubit/login_cubit.dart';
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
  print(await CacheHelper.init());
  print(CacheHelper.getDisplayName());
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
      ],
      child: MaterialApp(
        theme: theme,
        title: AppStrings.rebuy,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.registerScreen,
        routes: AppRoutes.routes,
      ),
    );
  }
}
