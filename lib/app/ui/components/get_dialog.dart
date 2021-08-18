import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/data/local/user_provider.dart';
import 'package:six/app/modules/charity/vendor_details/controllers/vendor_details_controller.dart';
import 'package:six/app/ui/components/action_dialog.dart';
import 'package:six/r.g.dart';

Future<void> dialog({
  required bool? success,
  String? purchasedCategory,
  String? message,
}) {
  var vendorCtrl = Get.find<VendorDetailsController>();
  if (success == true && UserProvider.role == 'social_worker') {
    vendorCtrl.assignAvailVouchers();
  }
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
                    child: actionDialog(
                      onTapCancel: () {
                        //paid(false);
                        Get.back<void>();
                      },
                      dialogTypeText: success! ? 'Success!' : 'Oops!',
                      assetName: success
                          ? R.image.asset.success_redem.assetName
                          : R.image.asset.error_dialog.assetName,
                      text: message ??
                          (success
                              ? 'Congrats! You have successfully\npurchased the voucher.'
                              : 'Something went wrong. Please\ntry again'),
                    )),
              ),
            ),
          ),
        ],
      ),
    ),
    useSafeArea: false,
  );
}
