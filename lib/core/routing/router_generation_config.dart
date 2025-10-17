import 'package:go_router/go_router.dart';
import 'package:meals/features/home_screen/home_screen.dart';
import 'package:meals/features/onBoarding/onboarding_screen.dart';
import 'package:meals/core/routing/app_routes.dart';

class RouterGenerationConfig {
  final bool isFirstTime;

  RouterGenerationConfig({required this.isFirstTime});

  get goRouter => GoRouter(
    initialLocation: isFirstTime
        ? AppRoutes.onBoardingScreen
        : AppRoutes.homeScreen,
    routes: [
      GoRoute(
        name: AppRoutes.onBoardingScreen,
        path: AppRoutes.onBoardingScreen,
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        name: AppRoutes.homeScreen,
        path: AppRoutes.homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
