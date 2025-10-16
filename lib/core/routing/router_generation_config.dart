import 'package:go_router/go_router.dart';
import 'package:meals/core/routing/app_routes.dart';
import 'package:meals/features/onBoarding/on_boarding_screen.dart';

class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.onBoardingScreen,
    routes: [
      GoRoute(
        path: AppRoutes.onBoardingScreen,
        name: AppRoutes.onBoardingScreen,
        builder: (context, state) => const OnBoardingScreen(),
      ),
    ],
  );
}
