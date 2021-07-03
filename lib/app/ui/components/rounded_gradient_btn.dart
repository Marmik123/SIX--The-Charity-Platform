import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:six/app/data/config/app_colors.dart';

double elevation = 0;
Widget roundedButton(String text, VoidCallback onTap, double width) {
  return ElevatedButton(
    onPressed: onTap,
    style: ButtonStyle(
      enableFeedback: true,
      padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
      //overlayColor: MaterialStateProperty.all(AppColors.kE5E5E5),
      elevation: MaterialStateProperty.all(elevation),
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(75.r))),
    ),
    child: Ink(
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(75.r),
          gradient: LinearGradient(
              begin: Alignment(-1, -2.8),
              end: Alignment(1, 5),
              colors: [AppColors.k1FAF9E, AppColors.k0087FF])),
      child: Container(
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
