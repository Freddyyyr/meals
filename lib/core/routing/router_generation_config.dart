import 'package:go_router/go_router.dart';
import 'package:meals/core/routing/app_routes.dart';
import 'package:meals/features/home_screen/home_screen.dart';
import 'package:meals/features/onBoarding/onboarding_screen.dart';

class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.onBoardingScreen,
    routes: [
      GoRoute(
        path: AppRoutes.onBoardingScreen,
        name: AppRoutes.onBoardingScreen,
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
