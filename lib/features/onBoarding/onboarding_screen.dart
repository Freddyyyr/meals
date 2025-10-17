import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meals/core/app_assets/app_assets.dart';
import 'package:meals/core/routing/app_routes.dart';
import 'package:meals/core/styles/app_colors.dart';
import 'package:meals/core/styles/app_text_styles.dart';
import 'package:meals/features/onBoarding/services/onboarding_services.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<String> titles = [
    'Save Your Meals Ingredient',
    'Use Our App The Best Choice',
    ' Our App Your Ultimate Choice',
  ];

  List<String> descriptions = [
    'Add Your Meals and its Ingredients and we will save it for you',
    'The best choice for your kitchen do not hesitate',
    'All the best restaurants and their top menus are ready for you',
  ];

  int currentIndex = 0;

  CarouselSliderController carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.onBoardingBackground),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: 16.h,
            right: 32.w,
            left: 32.w,
            child: Container(
              width: 311.w,
              height: 430.h,
              padding: EdgeInsets.all(32.sp),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(48.r),
              ),
              child: Column(
                children: [
                  CarouselSlider(
                    carouselController: carouselController,
                    options: CarouselOptions(
                      height: 240.h,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                    items: List.generate(titles.length, (index) {
                      return Builder(
                        builder: (BuildContext context) {
                          return SizedBox(
                            width: 252.w,
                            child: Column(
                              children: [
                                Text(
                                  titles[index],
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.onBoardingTitleStyle,
                                ),
                                SizedBox(height: 16.h),
                                Text(
                                  descriptions[index],
                                  textAlign: TextAlign.center,
                                  style:
                                      AppTextStyles.onBoardingDescriptionStyle,
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }),
                  ),
                  SizedBox(height: 5.h),
                  DotsIndicator(
                    dotsCount: 3,
                    position: currentIndex.toDouble(),
                    decorator: DotsDecorator(
                      size: const Size(24.0, 6.0),
                      color: const Color(0xffC2C2C2),
                      activeColor: AppColors.white,
                      activeSize: const Size(24.0, 6.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onTap: (index) {
                      carouselController.animateToPage(index);
                      currentIndex = index;
                      setState(() {});
                    },
                  ),
                  const Spacer(),
                  currentIndex >= 2
                      ? InkWell(
                          onTap: () async {
                            await OnboardingServices.setFirstTimeWithFalse();
                            GoRouter.of(
                              context,
                            ).pushReplacementNamed(AppRoutes.homeScreen);
                          },
                          child: Container(
                            width: 62.w,
                            height: 62.h,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.primaryColor,
                              size: 20.sp,
                            ),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () async {
                                await OnboardingServices.setFirstTimeWithFalse();
                                GoRouter.of(
                                  context,
                                ).pushReplacementNamed(AppRoutes.homeScreen);
                              },
                              child: Text(
                                "Skip",
                                style: AppTextStyles.white14SemiBold,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (currentIndex < 2) {
                                  currentIndex++;
                                  carouselController.animateToPage(
                                    currentIndex,
                                  );
                                  setState(() {});
                                }
                              },
                              child: Text(
                                "Next",
                                style: AppTextStyles.white14SemiBold,
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
