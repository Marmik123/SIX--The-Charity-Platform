import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/modules/vendor/vendor_redeem/controllers/vendor_redeem_controller.dart';

class QrScreenController extends GetxController {
  //TODO: Implement QrScreenController
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late Barcode result;
  RxBool permissionGiven = false.obs;
  RxBool qrScanned = false.obs;
  RxBool voucherDataLoading = false.obs;
  RxBool cannotDetect = false.obs;
  RxBool redeemed = false.obs;
  Map<String, dynamic>? voucherData;
  late QRViewController qrCtrl;
  final count = 0.obs;
  VendorRedeemController vendorRedeemCtrl = Get.find<VendorRedeemController>();
  @override
  Future<void> onInit() async {
    super.onInit();
    var status = await _getCameraPermission();
    if (status.isGranted) {
      permissionGiven.value = true;
    }
  }

  void reassemble() {
    //super.reassemble();
    if (Platform.isAndroid) {
      qrCtrl.pauseCamera();
    } else if (Platform.isIOS) {
      qrCtrl.resumeCamera();
    }
  }

  Future<PermissionStatus> _getCameraPermission() async {
    var status = await Permission.camera.status;
    print('##$status');
    if (!status.isGranted) {
      final result = await Permission.camera.request();
      return result;
    } else {
      print(status);
      return status;
    }
  }

  void onQRViewCreated(QRViewController controller) {
    qrCtrl = controller;
    // controller.scannedDataStream.timeout(Duration(seconds:10, )).lis
    qrCtrl.scannedDataStream
        .timeout(
      const Duration(
        seconds: 15,
      ),
      onTimeout: onTimeout,
    )
        .listen((scanData) async {
      result = scanData;
      print('@@${scanData.code}');
      print('@@${scanData.format}');
      logI(scanData);
      if (result.isBlank!) {
        print('cant detect');
      }
      // await controller.pauseCamera();
      if (scanData.code.isNotEmpty) {
        cannotDetect(false);
        /*var removedBrackets =
            scanData.code.substring(1, scanData.code.length - 1);
        voucherData(removedBrackets.split(','));
        */
        qrScanned(true);
        await controller.pauseCamera();
        voucherDataLoading(true);
        voucherData =
            await vendorRedeemCtrl.getVoucherDataThroughScan(scanData.code);
        logWTF(voucherData);
        if (voucherData != null) {
          voucherDataLoading(false);
          qrScanned(true);
        }
        /* await Get.defaultDialog<void>(
          content: voucherCard(
            title: voucherData[0],
            imgUrl: 'https://picsum.photos/id/237/200/300',
            amount: double.tryParse(voucherData[1])!,
            whichScreen: 'QRScreen',
            voucherCode: voucherData[3],
            date: '1, Nov 2021',
            onTap: () {},
            btnText: 'Active Voucher',
            voucherState: VoucherState.active,
            isQRScreen: true,
          ),
        );*/
        //await controller.stopCamera();
        //await controller.stopCamera();
        //await controller.pauseCamera();
      } else {
        //await controller.resumeCamera();
        print('cant detect');
      }
    });
  }

  void onTimeout(EventSink barcode) {
    cannotDetect(true);
    if (qrScanned()) {
      cannotDetect(false);
    } else {
      //qrCtrl.resumeCamera();
    }
  }

  @override
  void onClose() {
    qrCtrl.dispose();
    super.onClose();
  }
}
