import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:six/app/data/config/app_colors.dart';

Widget buildLoader() {
  return Container(
    height: 0.10.sh,
    width: 0.10.sw,
    child: const Center(
      child: CircularProgressIndicator(
        strokeWidth: 3,
        color: AppColors.k14A1BE,
      ),
    ),
  );
}

Widget buildPaymentLoader() {
  return Container(
    height: 60.r,
    width: 60.r,
    child: const Center(
      child: CircularProgressIndicator(
        strokeWidth: 1,
        color: AppColors.kffffff,
      ),
    ),
  );
}
