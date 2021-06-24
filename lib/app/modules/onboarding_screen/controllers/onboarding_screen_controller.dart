import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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
