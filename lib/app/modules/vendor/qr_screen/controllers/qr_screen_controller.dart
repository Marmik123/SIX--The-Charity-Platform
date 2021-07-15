import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScreenController extends GetxController {
  //TODO: Implement QrScreenController
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late Barcode result;
  RxBool permissionGiven = false.obs;
  RxBool qrScanned = false.obs;
  RxBool cannotDetect = false.obs;
  RxBool redeemed = false.obs;
  late QRViewController qrCtrl;
  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    PermissionStatus status = await _getCameraPermission();
    if (status.isGranted) {
      permissionGiven.value = true;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
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
    print("##$status");
    if (!status.isGranted) {
      final result = await Permission.camera.request();
      return result;
    } else {
      print(status);
      return status;
    }
  }

  void onQRViewCreated(QRViewController controller) {
    this.qrCtrl = controller;
    // controller.scannedDataStream.timeout(Duration(seconds:10, )).lis
    controller.scannedDataStream
        .timeout(
      Duration(
        seconds: 10,
      ),
      onTimeout: onTimeout,
    )
        .listen((scanData) async {
      result = scanData;
      print('@@${scanData.code}');
      print('@@${scanData.format}');
      if (result.isBlank!) {
        print('cant detect');
      }
      controller.pauseCamera();
      if (scanData.code.isNotEmpty) {
        qrScanned.value = true;
        cannotDetect.value = false;
        await controller.pauseCamera();
      } else {
        print('cant detect');
      }
    });
  }

  void onTimeout(EventSink barcode) {
    qrScanned.value ? null : cannotDetect.value = true;
    qrCtrl.resumeCamera();
  }

  @override
  void onClose() {
    super.dispose();
  }

  void increment() => count.value++;
}
