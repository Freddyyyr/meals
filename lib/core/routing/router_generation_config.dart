import 'package:go_router/go_router.dart';
import 'package:meals/features/add_meal_screen/add_meal_screen.dart';
import 'package:meals/features/home_screen/data/models/meal_model.dart';
import 'package:meals/features/home_screen/home_screen.dart';
import 'package:meals/features/meal_details_screen/meal_details_screen.dart';
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
      GoRoute(
        name: AppRoutes.addMealScreen,
        path: AppRoutes.addMealScreen,
        builder: (context, state) => const AddMealScreen(),
      ),
      GoRoute(
        name: AppRoutes.mealDetailsScreen,
        path: AppRoutes.mealDetailsScreen,
        builder: (context, state) {
          Meal meal = state.extra as Meal;

          return MealDetailsScreen(meal: meal);
        },
      ),
    ],
  );
}
