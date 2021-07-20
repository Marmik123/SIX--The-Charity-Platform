import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:six/app/data/config/app_colors.dart';

Widget profileMenuItem(String assetName, String text, VoidCallback onTap) {
  return ListTile(
    onTap: onTap,
    title: Row(
      children: [
        Image.asset(
          assetName,
          height: 55.h,
          width: 47.w,
        ),
        SizedBox(
          width: 51.w,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 45.sp,
            fontStyle: FontStyle.normal,
            color: AppColors.k033660,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    ),
    //minLeadingWidth: 47.w,
    //minVerticalPadding: 18.h,
    trailing: IconButton(
      onPressed: () {},
      icon: const Icon(Icons.arrow_forward_ios),
      color: AppColors.k033660,
      iconSize: 14,
    ),
    minVerticalPadding: 18.w,
    visualDensity: const VisualDensity(vertical: -3.5, horizontal: 0),
  );
}
