import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/modules/vendor/qr_screen/controllers/qr_screen_controller.dart';
import 'package:six/app/modules/vendor/vendor_redeem/controllers/vendor_redeem_controller.dart';
import 'package:six/app/routes/app_pages.dart';
import 'package:six/app/ui/components/action_dialog.dart';
import 'package:six/app/ui/components/rounded_gradient_btn.dart';
import 'package:six/r.g.dart';

class VendorRedeemView extends GetView<VendorRedeemController> {
  var qrCtrl = Get.put(QrScreenController());
  VendorRedeemController vendorRCtrl = Get.put(VendorRedeemController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          children: [
            Scaffold(
                backgroundColor: AppColors.kffffff,
                body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: ClampingScrollPhysics(),
                  child: Container(
                    width: 1.sw,
                    height: 1.sh,
                    child: Column(
                      children: [
                        Stack(
                          overflow: Overflow.visible,
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              width: 1125.w,
                              height: 1202.h,
                              color: AppColors.kE3FCFF,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 170.h,
                                  ),
                                  Text(
                                    'Redeem via QR Code',
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize: 80.sp,
                                      fontStyle: FontStyle.normal,
                                      color: AppColors.k033660,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 40.h,
                                  ),
                                  Text(
                                    'Scan the QR Code on user’s device',
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize: 40.sp,
                                      fontStyle: FontStyle.normal,
                                      color: AppColors.k033660.withOpacity(0.7),
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 80.h,
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        height: 397.r,
                                        width: 397.r,
                                        decoration: BoxDecoration(
                                          color: AppColors.kffffff,
                                          borderRadius:
                                              BorderRadius.circular(50.r),
                                          boxShadow: [
                                            BoxShadow(
                                                color: AppColors.k000000
                                                    .withOpacity(0.04),
                                                blurRadius: 50.r,
                                                offset: Offset(0, 20)),
                                          ],
                                        ),
                                        child: Center(
                                          child: QrImage(
                                            data: 'This is demo qr',
                                            size: 350.r,
                                            version: QrVersions.auto,
                                          ),
                                        ),
                                      ),
                                      Image.asset(
                                        R.image.asset.qr_border.assetName,
                                        width: 473.r,
                                        height: 473.r,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 79.h,
                                  ),
                                  roundedButton(
                                    text: 'Scan Now',
                                    onTap: () {
                                      Get.toNamed<void>(Routes.QR_SCREEN);
                                    },
                                    width: 500.w,
                                    height: 150.h,
                                    fontSize: 50.sp,
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              top: 1163.h,
                              child: Container(
                                height: 80.r,
                                width: 80.r,
                                decoration: BoxDecoration(
                                    color: AppColors.kffffff,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColors.kE2E2E2,
                                      width: 1.w,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            AppColors.kDFDFDF.withOpacity(0.25),
                                        blurRadius: 50.r,
                                        offset: Offset(0, 20),
                                      ),
                                    ]),
                                child: Center(
                                  child: Text(
                                    'OR',
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      color: AppColors.k033660,
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 94.h,
                        ),
                        Text(
                          'Redeem via\nVoucher Number',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 80.sp,
                            fontStyle: FontStyle.normal,
                            color: AppColors.k033660,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Text(
                          'Enter the voucher code display on user’s device',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 40.sp,
                            fontStyle: FontStyle.normal,
                            color: AppColors.k033660.withOpacity(0.7),
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 120.h,
                        ),
                        Container(
                          height: 170.h,
                          width: 1005.w,
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
                          child: Center(
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    enabled: true,
                                    onEditingComplete: () {
                                      FocusScopeNode currentFocus =
                                          FocusScope.of(context);
                                      currentFocus.unfocus();
                                      controller.codeEntered.value = true;
                                    },
                                    style: TextStyle(
                                      color: AppColors.k033660,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: 'Gilroy',
                                      fontSize: 45.sp,
                                    ),
                                    decoration: InputDecoration(
                                      fillColor: AppColors.kffffff,
                                      hintText: 'Enter Number Here...',
                                      hintStyle: TextStyle(
                                        color: AppColors.k6886A0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontFamily: 'Gilroy',
                                        fontSize: 50.sp,
                                      ),
                                      contentPadding: const EdgeInsets.only(
                                          left: 85, top: 0),
                                      filled: true,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      isDense: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 120.h,
                        ),
                        roundedButton(
                          text: 'Redeem Now',
                          onTap: () {
                            qrCtrl.qrScanned.value = true;
                            //controller.redeemThroughNum.value = true;
                          },
                          width: 500.w,
                          height: 150.h,
                          fontSize: 50.sp,
                        ),
                      ],
                    ),
                  ),
                )),
            vendorRCtrl.redeemThroughNum.value
                ? BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20.r, sigmaY: 20.r),
                    child: Container(
                      height: 1.sh,
                      width: 1.sw,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.k0087A1.withOpacity(0.6),
                            offset: Offset(0, 4),
                            blurRadius: 4.r,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Material(
                          color: Colors.transparent,
                          child: actionDialog(
                              dialogTypeText: 'Success!',
                              text: 'Voucher has been successfully\nredeemed.',
                              assetName: R.image.asset.success_redem.assetName,
                              onTapCancel: () {
                                vendorRCtrl.redeemThroughNum.value = false;
                              }),
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ));
  }
}
