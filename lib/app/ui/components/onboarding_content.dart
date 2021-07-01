import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:six/app/data/config/app_colors.dart';

Widget onBoarding(String? title, String? subTitle, int? index,
    PageController page, String assetName, double padding) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(170),
              bottomRight: Radius.circular(170),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.kC4C4C4.withOpacity(0.21),
                spreadRadius: 2,
                offset: Offset.fromDirection(-720, 8),
                blurRadius: 0,
              )
            ]),
        width: 1.sw,
        height: 1534.h,
        child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(165),
              bottomRight: Radius.circular(165),
            ),
            child: Image.asset(
              assetName,
              fit: BoxFit.fitWidth,
            )),
      ),
      SizedBox(
        height: 150.h,
      ),
      Text(
        title!,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 80.sp,
            fontStyle: FontStyle.normal,
            color: AppColors.k033660,
            fontWeight: FontWeight.w500,
            /*foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 1
                ..color = AppColors.k000000,*/
            shadows: [
              Shadow(
                color: AppColors.k000000.withOpacity(0.25),
                blurRadius: 4,
                offset: Offset(0, 4),
              )
            ]),
      ),
      SizedBox(
        height: 45.h,
      ),
      Text(
        subTitle!,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Gilroy',
          fontSize: 40.sp,
          fontStyle: FontStyle.normal,
          color: AppColors.k585858,
          fontWeight: FontWeight.w500,
        ),
      ),
      SizedBox(
        height: padding,
      ),
    ],
  );
}
