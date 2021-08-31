import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six/r.g.dart';

class SocialOnboardingController extends GetxController {
  //TODO: Implement SocialOnboardingController
  late RxInt? index = 0.obs;

  PageController pageController = PageController();
  List<String?> title = [
    'Track the e-voucher activities of your beneficiaries',
    'Single Beneficiary View for accessing details of all beneficiaries ',
    'Purchase e-vouchers for beneficiaries',
  ];

  List<String?> subTitle = [
    'You will be able to view the status of the e-vouchers you assign to the beneficiaries and track if they redeem the vouchers before expiry',
    'Get a holistic view of all your beneficiaries related details like vouchers assigned, connected organizations, personal details',
    'You can purchase e-vouchers using the credits assigned to you by your organization, based on the requirements of the beneficiaries',
  ];

  List<String> imageAssetName = [
    R.image.asset.ons_1.assetName,
    R.image.asset.ons_2.assetName,
    R.image.asset.ons_3.assetName,
  ];
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
