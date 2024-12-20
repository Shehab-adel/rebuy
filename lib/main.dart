import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:rebuy/core/constants/app_constants.dart';
import 'package:rebuy/core/utils/theme/theme_helper.dart';
import 'package:rebuy/network/local/cache%20helper.dart';
import 'package:rebuy/presentation/add_card_screen/cubit/add_card_cubit.dart';
import 'package:rebuy/presentation/cart_page/cubit/cart_cubit.dart';
import 'package:rebuy/presentation/choose_credit_or_debit_card_screen/cubit/choosecreditcubit.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/dash_cubit.dart';
import 'package:rebuy/presentation/explore_page/cubit/explore_cubit.dart';
import 'package:rebuy/presentation/login_screen/cubit/login_cubit.dart';
import 'package:rebuy/presentation/profile_screen/cubit/profile_cubit.dart';
import 'package:rebuy/presentation/ship_to_screen/cubit/shipping_cubit.dart';
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
  Stripe.publishableKey = AppConstants.stripepublishableKey;
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
        BlocProvider(create: (context) => ProfileCubit()),
        BlocProvider(create: (context) => AddCardCubit()),
        BlocProvider(
            create: (context) => CartCubit(dashCubit: DashCubit.get(context))),
        BlocProvider(create: (context) => ShippingToCubit()),
        BlocProvider(create: (context) => ChooseCreditCubit()),
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
