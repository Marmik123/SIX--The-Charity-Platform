import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:six/app/data/config/app_colors.dart';

Widget roundedButton(String text, VoidCallback onTap) {
  return ElevatedButton(
    onPressed: onTap,
    style: ButtonStyle(
      enableFeedback: true,
      overlayColor: MaterialStateProperty.all(AppColors.kE5E5E5),
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.all(AppColors.kE5E5E5),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(900.r))),
    ),
    child: Ink(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(900.r),
          gradient: LinearGradient(
              begin: Alignment(-1, -2.8),
              end: Alignment(1, 2),
              colors: [AppColors.k1FAF9E, AppColors.k0087FF])),
      child: Container(
        width: 452.w,
        height: 150.h,
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Gilroy',
              fontSize: 50.sp,
              fontStyle: FontStyle.normal,
              color: AppColors.kffffff,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    ),
  );
}
