import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six/r.g.dart';

class SocialOnboardingController extends GetxController {
  //TODO: Implement SocialOnboardingController
  late RxInt? index = 0.obs;

  PageController pageController = PageController();
  List<String?> title = [
    'Track the e-voucher\nactivities of your\nbeneficiaries',
    'Single Beneficiary View for\naccessing details of all\nbeneficiaries ',
    'Purchase e-vouchers for\nbeneficiaries',
  ];

  List<String?> subTitle = [
    'You will be able to view the status of the e-vouchers\nyou assign to the beneficiaries and track if they\nredeem the vouchers before expiry',
    'Get a holistic view of all your beneficiaries related\ndetails like vouchers assigned, connected\norganizations, personal details',
    'You can purchase e-vouchers using the credits\nassigned to you by your organization, based on\nthe requirements of the beneficiaries',
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
