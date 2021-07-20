import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/ui/components/action_dialog.dart';
import 'package:six/r.g.dart';

import '../controllers/voucher_redemption_controller.dart';

class VoucherRedemptionView extends GetView<VoucherRedemptionController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          children: [
            Scaffold(
                appBar: AppBar(
                  backgroundColor: AppColors.kE3FCFF,
                  elevation: 0,
                  toolbarHeight: 80,
                  leading: InkWell(
                    onTap: () {
                      Get.back<void>();
                    },
                    child: const Icon(
                      Icons.arrow_back_sharp,
                      color: AppColors.k033660,
                    ),
                  ),
                  title: Column(
                    children: [
                      SizedBox(
                        height: 50.h,
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
                        'Present this QR Code to the cashier',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 40.sp,
                          fontStyle: FontStyle.normal,
                          color: AppColors.k033660.withOpacity(0.6),
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                /*bottomNavigationBar:
                    bottomNavBar(fromVoucherScreen: true, vendorHome: false,whichScreen: 'Needy Family'),
               */
                backgroundColor: AppColors.kffffff,
                extendBodyBehindAppBar: true,
                body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const ClampingScrollPhysics(),
                  child: Container(
                    width: 1.sw,
                    height: 1.sh,
                    child: Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              width: 1125.w,
                              height: 999.h,
                              color: AppColors.kE3FCFF,
                            ),
                            Positioned(
                              top: 401.h,
                              child: Container(
                                height: 767.h,
                                width: 767.w,
                                decoration: BoxDecoration(
                                  color: AppColors.kffffff,
                                  borderRadius: BorderRadius.circular(50.r),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            AppColors.k000000.withOpacity(0.04),
                                        blurRadius: 50.r,
                                        offset: const Offset(0, 20)),
                                  ],
                                ),
                                child: Center(
                                  child: QrImage(
                                    data: 'This is demo qr',
                                    size: 610.r,
                                    version: QrVersions.auto,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 318.h,
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 700.w,
                              height: 2.h,
                              color: AppColors.kB4C3D0,
                            ),
                            Container(
                              height: 100.r,
                              width: 100.r,
                              decoration: BoxDecoration(
                                  color: AppColors.kB4C3D0,
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
                                      offset: const Offset(0, 20),
                                    ),
                                  ]),
                              child: Center(
                                child: Text(
                                  'OR',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    color: AppColors.kffffff,
                                    fontSize: 40.sp,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 149.h,
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
                          'Enter the voucher code below',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 40.sp,
                            fontStyle: FontStyle.normal,
                            color: AppColors.k033660.withOpacity(0.6),
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 120.h,
                        ),
                        Container(
                          height: 170.h,
                          width: 652.w,
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
                                  offset: const Offset(0, 20),
                                  blurRadius: 50.r,
                                ),
                              ]),
                          child: Center(
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    initialValue: '15015403',
                                    enabled: true,
                                    onEditingComplete: () {
                                      var currentFocus = FocusScope.of(context);
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
                                    decoration: const InputDecoration(
                                        fillColor: AppColors.kffffff,
                                        contentPadding:
                                            EdgeInsets.only(left: 15, top: 15),
                                        filled: true,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        isDense: true,
                                        suffixIcon: Icon(
                                          Icons.content_copy,
                                          color: AppColors.k14A1BE,
                                          size: 20,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
            controller.codeEntered.value
                ? BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20.r, sigmaY: 20.r),
                    child: Container(
                      height: 1.sh,
                      width: 1.sw,
                      decoration: BoxDecoration(
                        color: AppColors.k0087A1.withOpacity(0.5),
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
                          child: actionDialog(
                            whichScreen: 'Needy Family',
                            dialogTypeText: 'Success!',
                            text:
                                'Congrats! You have successfully\nredemeed your e-voucher',
                            assetName: R.image.asset.success_redem.assetName,
                            onTapCancel: () {
                              controller.codeEntered.value = false;
                            },
                          ),
                        ),
                      ),
                    ),
                  )
                : Container()
          ],
        ));
  }
}
