import 'package:flutter/material.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/core/constants/app_constants.dart';
import 'package:rebuy/core/constants/font_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigationTo() {
    Future.delayed(Duration(seconds: AppConstants.splashDelay), () {
      Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
    });
  }

  @override
  void initState() {
    navigationTo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary.withOpacity(1),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: AppImageConstants.imgLogo,
                height: FSMan.s72.adaptSize,
                width: FSMan.s72.adaptSize,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
