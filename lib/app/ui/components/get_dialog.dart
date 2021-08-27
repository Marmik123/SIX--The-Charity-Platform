import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/modules/vendor/vendor_redeem/controllers/vendor_redeem_controller.dart';
import 'package:six/app/ui/components/action_dialog.dart';
import 'package:six/app/ui/components/common_voucher_card.dart';
import 'package:six/app/ui/components/rounded_gradient_btn.dart';
import 'package:six/app/utils/get_month_name.dart';
import 'package:six/r.g.dart';

Future<void> dialog({
  required bool? success,
  bool? redeemDialog = false,
  String? purchasedCategory,
  Map<String, dynamic>? redeemVoucherData,
  String? message,
  Future<void>? onTapRedeemNow,
}) {
  return redeemDialog!
      ? Get.dialog(
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20.r, sigmaY: 20.r),
            child: Container(
              height: 1.sh,
              width: 1.sw,
              decoration: BoxDecoration(
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.k000000.withOpacity(0.25),
                    offset: const Offset(0, 4),
                    blurRadius: 4.r,
                  ),
                ],
              ),
              child: Center(
                child: Material(
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 778.h,
                      ),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        clipBehavior: Clip.none,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: voucherCard(
                              title:
                                  '${redeemVoucherData?['voucher']['user']['user_metadata']['entity_name'] ?? '-'}',
                              imgUrl:
                                  '${redeemVoucherData?['voucher']['icon_url'] ?? '-'}',
                              amount: double.tryParse(
                                  '${redeemVoucherData?['amount'] ?? '0'}')!,
                              whichScreen: 'redeemedVoucher',
                              closeDialog: redeemDialog,
                              voucherCode:
                                  '${redeemVoucherData?['redeem_code'] ?? '-'}',
                              date: getDate(
                                      '${redeemVoucherData?['user_end_date'] ?? '-'}') ??
                                  '-',
                              onTap: () {},
                              btnText: 'Active Voucher',
                              voucherState: VoucherState.active,
                              isQRScreen: true,
                              terms:
                                  '${redeemVoucherData?['voucher']['terms'] ?? '-'}',
                            ),
                          ),
                          Positioned(
                            bottom: -6,
                            right: 25,
                            child: roundedButton(
                              text: 'Redeem Now',
                              isLoading: success,
                              onTap: () {
                                var vendorRedeemCtrl =
                                    Get.find<VendorRedeemController>();
                                if (redeemVoucherData?['redeem_code'] != null) {
                                  vendorRedeemCtrl.redeemVoucherByRedeemCode(
                                      '${redeemVoucherData?['redeem_code'] ?? '-'}');
                                }
                              },
                              width: 905.w,
                              height: 150.h,
                              fontSize: 50.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 484.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          /* controller.qrScanned.value = false;
                            controller.qrCtrl.resumeCamera();
                            controller.cannotDetect.value = false;
                          */
                          Get.back<void>();
                        },
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
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          useSafeArea: false,
        )
      : Get.dialog<void>(
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

String? getDate(String dateString) {
  var formattedDate = DateTime.parse(dateString);
  var date = formattedDate.day;
  var year = formattedDate.year;
  var month = assignMonth(formattedDate.month);
  var finalDate = '$date,$month $year';
  return finalDate;
}
