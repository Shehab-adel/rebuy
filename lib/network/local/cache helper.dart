import 'package:rebuy/core/constants/app_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static Future init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static String? getDisplayName() =>
      sharedPreferences.getString(AppStrings.displayName);

  static String? selectedBranch() =>
      sharedPreferences.getString(AppStrings.branch);
}
