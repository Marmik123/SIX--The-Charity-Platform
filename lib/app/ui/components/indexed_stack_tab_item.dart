import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/ui/components/sizedbox.dart';

Widget indexedStackTabItem(String text, String textNewLine, int index,
    String whichScreen, int currentIndex) {
  return Column(
    children: [
      h(15.h),
      Text(
        text,
        style: TextStyle(
          fontFamily: 'Gilroy',
          fontSize: 30.sp,
          fontStyle: FontStyle.normal,
          color: currentIndex == index ? AppColors.k13A89E : AppColors.k033660,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
      Text(
        textNewLine,
        style: TextStyle(
          fontFamily: 'Gilroy',
          fontSize: 40.sp,
          fontStyle: FontStyle.normal,
          color: currentIndex == index ? AppColors.k13A89E : AppColors.k033660,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
      h(15.h),
      AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.elasticInOut,
        width: 300.w,
        height: 50.h,
        decoration: UnderlineTabIndicator(
          borderSide: BorderSide(
            color:
                currentIndex == index ? AppColors.k13A89E : Colors.transparent,
            width: 2,
          ),
        ),
      )
    ],
  );
}
