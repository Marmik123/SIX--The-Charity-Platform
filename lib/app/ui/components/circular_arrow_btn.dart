import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/modules/onboarding_screen/controllers/onboarding_screen_controller.dart';

Widget circularArrowButton(OnboardingScreenController ctrl) {
  return GestureDetector(
    onTap: () {
      ctrl.index == 2
          ? Get.toNamed<void>('/sign-pass-verification')
          : ctrl.pageController.nextPage(
              duration: Duration(milliseconds: 300), curve: Curves.ease);
    },
    child: Container(
      height: 150.h,
      width: 150.w,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment(-1, -2),
            end: Alignment(1, 2),
            colors: [AppColors.k1FAF9E, AppColors.k0087FF],
          )),
      child: Center(
        child: Icon(
          Icons.arrow_forward_ios_rounded,
          color: AppColors.kffffff,
          size: 18,
        ),
      ),
    ),
  );
}
