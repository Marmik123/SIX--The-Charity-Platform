import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:six/app/data/config/app_colors.dart';

Widget monthPicker() {
  return Container(
    height: 80.h,
    width: 390.w,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Sept, ${DateTime.now().year}',
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 40.sp,
            fontStyle: FontStyle.normal,
            color: AppColors.k1FAF9E,
            fontWeight: FontWeight.w500,
          ),
        ),
        Icon(
          Icons.keyboard_arrow_down_sharp,
          color: AppColors.k033660,
          size: 20,
        )
      ],
    ),
    decoration: BoxDecoration(
        color: AppColors.kffffff,
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(
          color: AppColors.kE3FCFF,
          width: 5.sp,
        ),
        boxShadow: [
          BoxShadow(
              color: AppColors.k0A9988,
              blurRadius: 30.r,
              offset: Offset(0, 25.sp))
        ]),
  );
}
