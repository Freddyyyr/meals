import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meals/core/routing/app_routes.dart';
import 'package:meals/core/styles/app_colors.dart';
import 'package:meals/core/styles/app_text_styles.dart';
import 'package:meals/features/home_screen/data/db_helper/db_helper.dart';
import 'package:meals/features/home_screen/data/models/meal_model.dart';
import 'package:meals/features/home_screen/widgets/custom_food_item_widget.dart';
import 'package:meals/features/home_screen/widgets/custom_top_home_widget.dart';

DatabaseHelper dbHelper = DatabaseHelper.instance;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTopHomeWidget(),
            SizedBox(height: 24.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8.sp),
                      child: Text(
                        "Your Food",
                        style: AppTextStyles.black16Medium,
                      ),
                    ),
                    SizedBox(height: 25.h),
                    Expanded(
                      child: FutureBuilder(
                        future: dbHelper.getMeals(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryColor,
                              ),
                            );
                          } else if (snapshot.hasData) {
                            if (snapshot.data!.isEmpty) {
                              return Center(child: Text("No meals found"));
                            }

                            return GridView.builder(
                              itemCount: snapshot.data!.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.8,
                                    mainAxisSpacing: 20.h,
                                    crossAxisSpacing: 20.w,
                                  ),
                              itemBuilder: (context, index) {
                                Meal meal = snapshot.data![index];
                                return CustomFoodItemWidget(
                                  imageUrl: meal.imageUrl,
                                  name: meal.name,
                                  rate: meal.rate,
                                  time: meal.time,
                                  onTap: () {},
                                );
                              },
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text("Error: ${snapshot.error}"),
                            );
                          } else {
                            return Center(child: Text("No data"));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            GoRouter.of(context).pushNamed(AppRoutes.addMealScreen);
          },
          shape: const CircleBorder(),
          backgroundColor: AppColors.primaryColor,

          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
