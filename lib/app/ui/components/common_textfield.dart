import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:six/app/data/config/app_colors.dart';

Widget textField(
  String initialValue,
  String prefixText,
  String hintText,
  Icon prefixIcon,
  VoidCallback onTap, {
  required BuildContext context,
  required double height,
  required double width,
  required TextInputType keyBoardType,
}) {
  return Container(
    height: height, //170.h,
    width: width, //1005.w,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.r),
        color: AppColors.kffffff,
        border: Border.all(
          color: AppColors.kE2E2E2,
          width: 1.w,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.k00474E.withOpacity(0.04),
            offset: Offset(0, 20),
            blurRadius: 50.r,
          ),
        ]),
    child: TextFormField(
      initialValue: initialValue,
      enabled: true,
      onEditingComplete: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        currentFocus.unfocus();
      },
      style: TextStyle(
        color: AppColors.k13A89E,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontFamily: 'Gilroy',
        fontSize: 65.sp,
      ),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        fillColor: AppColors.kffffff,
        contentPadding: const EdgeInsets.only(left: 120, top: 15),
        filled: true,
        hintText: hintText,
        prefixIcon: prefixIcon,
        hintStyle: TextStyle(
          color: AppColors.k6886A0,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          fontFamily: 'Gilroy',
          fontSize: 45.sp,
        ),
        prefixText: prefixText,
        prefixStyle: TextStyle(
          color: AppColors.k13A89E,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          fontFamily: 'Gilroy',
          fontSize: 65.sp,
        ),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        isDense: true,
      ),
    ),
  );
}
