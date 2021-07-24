import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:six/app/data/config/app_colors.dart';

Widget buildLoader() {
  return Container(
    height: 0.10.sh,
    width: 0.10.sw,
    child: const Center(
      child: CircularProgressIndicator(
        color: AppColors.k14A1BE,
        strokeWidth: 3,
      ),
    ),
  );
}
