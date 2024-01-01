import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rebuy/core/utils/theme/theme_helper.dart';
import 'package:rebuy/routes/app_routes.dart';

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
    return MaterialApp(
      theme: theme,
      title: 'rebuy',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.registerScreen,
      routes: AppRoutes.routes,
    );
  }
}
