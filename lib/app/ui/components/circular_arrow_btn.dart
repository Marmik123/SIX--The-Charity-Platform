import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:six/app/data/config/app_colors.dart';

Widget circularArrowButton(VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 150.h,
      width: 150.w,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment(-1, -2),
            end: Alignment(1, 2),
            colors: [AppColors.k1FAF9E, AppColors.k0087FF],
          )),
      child: const Center(
        child: Icon(
          Icons.arrow_forward_ios_rounded,
          color: AppColors.kffffff,
          size: 18,
        ),
      ),
    ),
  );
}
