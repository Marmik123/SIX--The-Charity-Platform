import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/modules/social_worker/distribute_voucher/controllers/distribute_voucher_controller.dart';

var distributeCtrl = Get.put(DistributeVoucherController());
Widget actionDialog({
  required String text,
  required String dialogTypeText,
  required String assetName,
  required VoidCallback onTapCancel,
}) {
  return Column(
    children: [
      SizedBox(
        height: 778.h,
      ),
      Container(
        height: 881.h,
        width: 1005.w,
        decoration: BoxDecoration(
          color: AppColors.kffffff,
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 115.h,
            ),
            Image.asset(
              assetName,
              width: 300.r,
              height: 300.r,
            ),
            SizedBox(
              height: 45.h,
            ),
            Text(
              dialogTypeText,
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 55.sp,
                fontStyle: FontStyle.normal,
                color: AppColors.k033660,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 55.h,
            ),
            Container(
              width: 100.w,
              height: 6.h,
              decoration: BoxDecoration(
                color: AppColors.kB4C3D0,
                borderRadius: BorderRadius.circular(100.r),
              ),
            ),
            SizedBox(
              height: 55.h,
            ),
            Text(
              text,
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 45.sp,
                fontStyle: FontStyle.normal,
                color: AppColors.k6886A0,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            /*UserProvider.currentUser?.role == 'social_worker'
                ? Column(
                    children: [
                      h(45.h),
                      roundedButton(
                        text: 'Done',
                        onTap: () {
                          Get.back<void>();
                        },
                        width: 452.w,
                        height: 150.h,
                        fontSize: 50.sp,
                      ),
                    ],
                  )
                : const SizedBox.shrink()*/
          ],
        ),
      ),
      SizedBox(
        height: 450.h,
      ),
      /*UserProvider.currentUser?.role == 'social_worker'
          ? const SizedBox.shrink()
          :*/
      GestureDetector(
        onTap: onTapCancel,
        child: Container(
          height: 160.r,
          width: 160.r,
          decoration: BoxDecoration(
            color: AppColors.kffffff,
            borderRadius: BorderRadius.circular(70.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.k00474E.withOpacity(0.04),
                blurRadius: 40.r,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          child: const Center(
            child: Icon(
              Icons.clear,
              color: AppColors.k1FAF9E,
              size: 20,
            ),
          ),
        ),
      )
    ],
  );
}
