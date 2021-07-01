import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:six/r.g.dart';

class OnboardingScreenController extends GetxController {
  //TODO: Implement OnboardingScreenController
  PageController pageController = PageController();
  List<String?> title = [
    'Make a request for help',
    'Receive e-voucher from\nSocial Worker',
    'Redeem via QR Code or\nVoucher Code',
  ];

  List<String?> subTitle = [
    'In an emergency situation, you can also request\nfor e-vouchers for a specific category',
    'Social Worker will provide you with e-vouchers\nfor various categories based on your\nrequirements',
    'You can redeem the e-voucher at the participating\nvendor store using a QR code or entering\nthe voucher code',
  ];

  List<String> imageAssetName = [
    R.image.asset.onboarding_5.assetName,
    R.image.asset.onboarding_6.assetName,
    R.image.asset.onboarding_7.assetName,
  ];

  List<String?> vendorTitle = [
    'Dashboard to track\nvoucher activities ',
    'Accept e-vouchers via\nQR code or Voucher Code',
  ];

  List<String?> vendorSubTitle = [
    'Get a holistic view of your e-vouchers being\nredeemed by SIX platform users',
    'Accept the e-vouchers presented by users via\nQR code or entering the voucher code',
  ];

  List<String> vendorImageAssetName = [
    R.image.asset.onboarding_5.assetName,
    R.image.asset.onboarding_6.assetName,
  ];

  final count = 0.obs;
  late RxInt? index = 0.obs;
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
