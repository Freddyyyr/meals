import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals/core/app_assets/app_assets.dart';
import 'package:meals/core/styles/app_colors.dart';
import 'package:meals/core/styles/app_text_styles.dart';

class CustomTopHomeWidget extends StatefulWidget {
  const CustomTopHomeWidget({super.key});

  @override
  State<CustomTopHomeWidget> createState() => _CustomTopHomeWidgetState();
}

class _CustomTopHomeWidgetState extends State<CustomTopHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.homePageHeader,
          width: double.infinity,
          height: 223.h,
        ),
        Positioned(
          left: 40.w,
          top: 30.h,
          child: Container(
            width: 170.w,
            height: 176.h,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(48.r),
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.all(8.sp),
            child: Text(
              "Welcome Add a New Recipe",
              style: AppTextStyles.onBoardingTitleStyle,
            ),
          ),
        ),
      ],
    );
  }
}
