import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meals/core/styles/app_colors.dart';
import 'package:meals/core/styles/app_text_styles.dart';
import 'package:meals/features/home_screen/data/models/meal_model.dart';

class MealDetailsScreen extends StatelessWidget {
  final Meal meal;

  const MealDetailsScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.sp),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(16.r),
                      child: CachedNetworkImage(
                        imageUrl: meal.imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 327.h,
                      ),
                    ),
                    Positioned(
                      left: 12.w,
                      top: 12.h,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.white, width: 2.w),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {
                            GoRouter.of(context).pop();
                          },
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(meal.name, style: AppTextStyles.black16Medium),
                    SizedBox(height: 21.h),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(8.sp),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withValues(alpha: 0.04),
                        borderRadius: BorderRadius.circular(8.r),
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.schedule,
                                color: AppColors.primaryColor,
                                size: 18.sp,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                meal.time.toString(),
                                style: AppTextStyles.grey14Regular.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColors.primaryColor,
                                size: 18.sp,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                meal.rate.toString(),
                                style: AppTextStyles.grey14Regular.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 27.h),

                    const Divider(thickness: 2),

                    SizedBox(height: 24.h),

                    Text("Description", style: AppTextStyles.black16Medium),
                    SizedBox(height: 8.h),
                    Text(meal.description, style: AppTextStyles.grey14Regular),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
