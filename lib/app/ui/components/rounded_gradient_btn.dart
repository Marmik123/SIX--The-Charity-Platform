import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/ui/components/circular_progress_indicator.dart';
import 'package:six/app/utils/material_prop_ext.dart';

double elevation = 0;
Widget roundedButton({
  required String text,
  required VoidCallback onTap,
  required double width,
  required double height,
  required double fontSize,
  bool? isLoading = false,
}) {
  return ElevatedButton(
    onPressed: onTap,
    style: ButtonStyle(
      enableFeedback: true,
      padding: EdgeInsets.zero.msp,
      //overlayColor: MaterialStateProperty.all(AppColors.kE5E5E5),
      elevation: elevation.msp,
      backgroundColor: Colors.transparent.msp,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(75.r)).msp,
    ),
    child: Ink(
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(75.r),
          gradient: const LinearGradient(
              begin: Alignment(-1, -2.8),
              end: Alignment(1, 5),
              colors: [AppColors.k1FAF9E, AppColors.k0087FF])),
      child: Container(
        height: height,
        child: Center(
          child: isLoading!
              ? buildPaymentLoader()
              : Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: fontSize,
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
