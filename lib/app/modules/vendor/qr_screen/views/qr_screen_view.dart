import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/ui/components/common_voucher_card.dart';
import 'package:six/app/ui/components/rounded_gradient_btn.dart';

import '../controllers/qr_screen_controller.dart';

class QrScreenView extends GetView<QrScreenController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          children: [
            Scaffold(
              extendBodyBehindAppBar: true,
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                toolbarHeight: 80,
                centerTitle: true,
                leading: InkWell(
                  onTap: () {
                    Get.back<void>();
                  },
                  child: Icon(
                    Icons.arrow_back_sharp,
                    color: AppColors.kffffff,
                  ),
                ),
                title: Text(
                  'Scan',
                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 50.sp,
                    fontStyle: FontStyle.normal,
                    color: AppColors.kffffff,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              body: controller.permissionGiven.value
                  ? _buildQrView(context)
                  : CircularProgressIndicator(),
            ),
            controller.qrScanned.value
                ? BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20.r, sigmaY: 20.r),
                    child: Container(
                      height: 1.sh,
                      width: 1.sw,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.k000000.withOpacity(0.25),
                            offset: Offset(0, 4),
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
                                children: [
                                  voucherCard(
                                    title: 'NTUC Fairprice',
                                    imgUrl:
                                        'https://picsum.photos/id/237/200/300',
                                    amount: 10,
                                    voucherCode: '15015403',
                                    date: '1, Nov 2021',
                                    onTap: () {},
                                    voucherState: VoucherState.active,
                                  ),
                                  Positioned(
                                      bottom: -1,
                                      child:
                                          roundedButton('Redeem Now', () {})),
                                ],
                              ),
                              /*Container(
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
                                      R.image.asset.success_redem.assetName,
                                      width: 300.r,
                                      height: 300.r,
                                    ),
                                    SizedBox(
                                      height: 45.h,
                                    ),
                                    Text(
                                      'Success!',
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
                                        borderRadius:
                                            BorderRadius.circular(100.r),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 55.h,
                                    ),
                                    Text(
                                      'Congrats! You have successfully\nredemeed your e-voucher',
                                      style: TextStyle(
                                        fontFamily: 'Gilroy',
                                        fontSize: 45.sp,
                                        fontStyle: FontStyle.normal,
                                        color: AppColors.k6886A0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              ),*/ //SUCCESS DIALOG
                              SizedBox(
                                height: 484.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.qrScanned.value = false;
                                  controller.qrCtrl.resumeCamera();
                                  controller.cannotDetect.value = false;
                                },
                                child: Container(
                                  height: 160.r,
                                  width: 160.r,
                                  decoration: BoxDecoration(
                                    color: AppColors.kffffff,
                                    borderRadius: BorderRadius.circular(70.r),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            AppColors.k00474E.withOpacity(0.04),
                                        blurRadius: 40.r,
                                        offset: Offset(0, 20),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.clear,
                                      color: AppColors.k1FAF9E,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
            controller.cannotDetect.value
                ? Positioned(
                    top: 300.h,
                    child: GestureDetector(
                      onTap: () {
                        controller.cannotDetect.value = false;
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 0,
                        child: Container(
                          height: 160.h,
                          width: 1.sw,
                          color: AppColors.kFF5555,
                          child: Center(
                            child: Text(
                              'Sorry! We can’t found data.Please scan corrected\nQR Code',
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 40.sp,
                                fontStyle: FontStyle.normal,
                                color: AppColors.kffffff,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ));
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (1.sw < 400.w || 1.sh < 400.h) ? 150.r : 800.r;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: controller.qrKey,
      onQRViewCreated: controller.onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: AppColors.kffffff,
        borderRadius: 50.r,
        borderLength: 270.r,
        borderWidth: 30.w,
        cutOutSize: scanArea,
      ),
    );
  }
}
