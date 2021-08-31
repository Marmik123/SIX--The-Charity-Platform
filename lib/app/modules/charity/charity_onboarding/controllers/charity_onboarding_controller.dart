import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six/r.g.dart';

class CharityOnboardingController extends GetxController {
  //TODO: Implement CharityOnboardingController
  PageController pageController = PageController();
  List<String?> title = [
    'Dashboard to track activities',
    'Purchase credits for different categories',
    'View Vendor Details',
  ];

  List<String?> subTitle = [
    'Get a holistic view of your donations received and spendings on the SIX platform ',
    'You can buy credits for various categories and assign to your social workers',
    'You can browse through the details of the available vendors for each category',
  ];

  List<String> imageAssetName = [
    R.image.asset.onb_1.assetName,
    R.image.asset.onb_2.assetName,
    R.image.asset.onb_3.assetName,
  ];
  RxInt? index = 0.obs;

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
