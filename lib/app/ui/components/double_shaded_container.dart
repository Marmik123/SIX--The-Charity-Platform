import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/ui/components/catched_image.dart';

Widget doubleShadedCont(String url) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        width: 520.r,
        height: 520.r,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.kC7E8EB,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: AppColors.kffffff,
              offset: Offset(4, 5),
            ),
            BoxShadow(
              color: AppColors.kD4FAFF,
              spreadRadius: 3,
              offset: Offset(0, 2),
              blurRadius: 12.0,
            ),
          ],
        ),
      ),
      Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.kffffff,
            width: 8.w,
          ),
          boxShadow: [
            BoxShadow(
                color: AppColors.kffffff,
                offset: Offset(-2, -1),
                blurRadius: 15),
            BoxShadow(
              color: AppColors.kCFE3E5,
              blurRadius: 5,
              offset: Offset(3, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(80),
          child: cacheImage(
            width: 400.r,
            height: 400.r,
            url: url,
          ),
        ),
      )
    ],
  );
}
