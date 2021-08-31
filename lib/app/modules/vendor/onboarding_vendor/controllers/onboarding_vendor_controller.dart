import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six/r.g.dart';

class OnboardingVendorController extends GetxController {
  //TODO: Implement OnboardingVendorController
  PageController pageController = PageController();

  List<String?> title = [
    'Dashboard to track voucher activities ',
    'Accept e-vouchers via QR code or Voucher Code',
  ];

  List<String?> subtitle = [
    'Get a holistic view of your e-vouchers being redeemed by SIX platform users',
    'Accept the e-vouchers presented by users via QR code or entering the voucher code',
  ];

  List<String> imageAssetName = [
    R.image.asset.vendor_onb1.assetName,
    R.image.asset.vendor_onb2.assetName,
  ];
  late RxInt? index = 0.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
