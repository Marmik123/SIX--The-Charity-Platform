import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/ui/components/action_dialog.dart';
import 'package:six/r.g.dart';

Future<void> dialog({required bool? success, String? purchasedCategory}) {
  return Get.dialog<void>(
    SizedBox(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20.r, sigmaY: 20.r),
            child: Container(
              height: 1.sh,
              width: 1.sw,
              decoration: BoxDecoration(
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.k0087A1.withOpacity(0.4),
                    offset: const Offset(0, 2),
                    blurRadius: 40.r,
                  ),
                ],
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20.r, sigmaY: 20.r),
            child: Container(
              height: 1.sh,
              width: 1.sw,
              decoration: BoxDecoration(
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.k0087A1.withOpacity(0.6),
                    offset: const Offset(0, 4),
                    blurRadius: 4.r,
                  ),
                ],
              ),
              child: Center(
                child: Material(
                  color: Colors.transparent,
                  child: success!
                      ? actionDialog(
                          onTapCancel: () {
                            //paid(false);
                            Get.back<void>();
                          },
                          dialogTypeText: 'Success!',
                          assetName: R.image.asset.success_redem.assetName,
                          text:
                              'Congrats! You have successfully\npurchased credits for $purchasedCategory\ncategory',
                        )
                      : actionDialog(
                          onTapCancel: () {
                            //paid(false);
                            Get.back<void>();
                          },
                          dialogTypeText: 'Oops!',
                          assetName: R.image.asset.error_dialog.assetName,
                          text: 'Something went wrong. Please\ntry again',
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    useSafeArea: false,
  );
}
