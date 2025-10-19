import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals/core/styles/app_colors.dart';
import 'package:meals/core/styles/app_text_styles.dart';

class CustomFoodItemWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double rate;
  final String time;
  final Function()? onTap;

  const CustomFoodItemWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.rate,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: onTap,
      child: SizedBox(
        child: Container(
          padding: EdgeInsets.all(8.sp),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                width: 160.w,
                height: 106.h,
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, color: AppColors.primaryColor),
              ),
              SizedBox(height: 8.h),
              SizedBox(
                width: 120.w,
                child: Text(
                  name,
                  maxLines: 1,
                  style: AppTextStyles.black16Medium,
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: AppColors.primaryColor,
                        size: 18.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        rate.toString(),
                        style: AppTextStyles.grey14Regular.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        color: AppColors.primaryColor,
                        size: 18.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        time.toString(),
                        style: AppTextStyles.grey14Regular.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
