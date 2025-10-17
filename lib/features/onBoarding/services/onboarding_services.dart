import 'package:shared_preferences/shared_preferences.dart';

class OnboardingServices {
  static late SharedPreferences sharedPreferences;

  static Future initializeSharedPreferencesStorage() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static bool isFirstTime() {
    bool isFirstTime = sharedPreferences.getBool('isFirstTime') ?? true;
    return isFirstTime;
  }

  static Future<void> setFirstTimeWithFalse() async {
    await sharedPreferences.setBool('isFirstTime', false);
  }
}
