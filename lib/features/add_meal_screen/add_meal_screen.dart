import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meals/core/routing/app_routes.dart';
import 'package:meals/core/styles/app_colors.dart';
import 'package:meals/core/styles/app_text_styles.dart';
import 'package:meals/core/widgets/custom_text_field.dart';
import 'package:meals/core/widgets/primary_button_widget.dart';
import 'package:meals/features/home_screen/data/db_helper/db_helper.dart';
import 'package:meals/features/home_screen/data/models/meal_model.dart';

class AddMealScreen extends StatefulWidget {
  const AddMealScreen({super.key});

  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController mealNameController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  DatabaseHelper dbHelper = DatabaseHelper.instance;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Meal', style: AppTextStyles.black16Medium),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: _formKey,
            child: isLoading
                ? SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: SizedBox(
                        height: 40.sp,
                        width: 40.sp,
                        child: const CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // MARK: Meal Name
                      Text("Meal Name", style: AppTextStyles.black16Medium),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        controller: mealNameController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please enter Meal Name';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 16.h),
                      //MARK: Image URL
                      Text("Image URL", style: AppTextStyles.black16Medium),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        controller: imageUrlController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please enter Image URL';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 8.h),
                      //MARK: Rate
                      Text("Rate", style: AppTextStyles.black16Medium),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        controller: rateController,
                        keyboardType: TextInputType.number,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please enter Rate';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 8.h),
                      //MARK: Time
                      Text("Time", style: AppTextStyles.black16Medium),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        controller: timeController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please enter Time';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 8.h),
                      //MARK: Description
                      Text("Description", style: AppTextStyles.black16Medium),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        controller: descriptionController,
                        maxLines: 4,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please enter Description';
                          } else if (val.length < 5) {
                            return 'Description must be at least 5 characters';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 100.h),

                      //MARK: Save Button
                    ],
                  ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: isLoading
          ? SizedBox.shrink()
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: SizedBox(
                width: double.infinity,
                height: 55.h,
                child: PrimaryButtonWidget(
                  onPress: () {
                    if (_formKey.currentState!.validate()) {
                      log(mealNameController.text);
                      log(imageUrlController.text);
                      log(rateController.text);
                      log(descriptionController.text);
                      log(timeController.text);

                      isLoading = true;
                      setState(() {});
                      Meal meal = Meal(
                        name: mealNameController.text,
                        imageUrl: imageUrlController.text,
                        rate: double.parse(rateController.text),
                        description: descriptionController.text,
                        time: timeController.text,
                      );
                      dbHelper.insertMeal(meal).then((value) {
                        GoRouter.of(
                          context,
                        ).pushReplacementNamed(AppRoutes.homeScreen);
                      });
                    } else {}
                  },
                  buttonText: "Add Meal",
                ),
              ),
            ),
    );
  }
}
