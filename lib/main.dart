import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rebuy/core/app_export.dart';

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
      title: AppStrings.rebuy,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.registerScreen,
      routes: AppRoutes.routes,
    );
  }
}
