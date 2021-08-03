import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:six/app/data/config/app_colors.dart';

Widget monthPicker({
  required Color color,
  required Color borderColor,
  required Widget textContent,
  required double width,
  required double height,
  required VoidCallback onTapArrow,
  required Color shadowColor,
  //required String whichScreen,
}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(
          color: borderColor,
          width: 5.sp,
        ),
        boxShadow: [
          BoxShadow(
              color: shadowColor, blurRadius: 30.r, offset: Offset(0, 25.sp))
        ]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        textContent, //Text widget
        GestureDetector(
          onTap: onTapArrow,
          child: const Icon(
            Icons.keyboard_arrow_down_sharp,
            color: AppColors.k033660,
            size: 20,
          ),
        )
      ],
    ),
  );
}
