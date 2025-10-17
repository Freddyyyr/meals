import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals/core/routing/router_generation_config.dart';
import 'package:meals/core/styles/app_colors.dart';
import 'package:meals/features/onBoarding/services/onboarding_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await OnboardingServices.initializeSharedPreferencesStorage();

  bool isFirstTime = OnboardingServices.isFirstTime();

  runApp(MyApp(isFirstTime: isFirstTime));
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;

  const MyApp({super.key, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Meals',
          routerConfig: RouterGenerationConfig(
            isFirstTime: isFirstTime,
          ).goRouter,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primaryColor,
              brightness: Brightness.dark,
            ),
          ),
        );
      },
    );
  }
}
