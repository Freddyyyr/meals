import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals/core/app_assets/app_assets.dart';
import 'package:meals/core/styles/app_colors.dart';
import 'package:meals/core/styles/app_text_styles.dart';
import 'package:meals/features/home_screen/widgets/custom_food_item_widget.dart';
import 'package:meals/features/home_screen/widgets/custom_top_home_widget.dart';

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
                      child: GridView.builder(
                        itemCount: 10,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.8,
                          mainAxisSpacing: 20.h,
                          crossAxisSpacing: 20.w,
                        ),
                        itemBuilder: (context, index) {
                          return CustomFoodItemWidget(
                            imageUrl: AppAssets.cheeseBurger,
                            name: "Cheese Burger",
                            rate: 4.5,
                            time: "10 - 15",
                            onTap: () {},
                          );
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
          onPressed: () {},
          shape: const CircleBorder(),
          backgroundColor: AppColors.primaryColor,

          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
