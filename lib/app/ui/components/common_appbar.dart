import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';

PreferredSizeWidget appBar(
    {required String title,
    required double height,
    required bool disableBackIcon}) {
  return AppBar(
    elevation: 0,
    toolbarHeight: height,
    backgroundColor: AppColors.kF2FEFF,
    title: Text(
      title,
      style: TextStyle(
        fontFamily: 'Gilroy',
        fontSize: 50.sp,
        fontStyle: FontStyle.normal,
        color: AppColors.k033660,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    ),
    centerTitle: true,
    leading: disableBackIcon
        ? const SizedBox.shrink()
        : IconButton(
            icon: const Icon(Icons.arrow_back),
            color: AppColors.k033660,
            onPressed: () {
              Get.back<void>();
            },
          ),
  );
}
