import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/modules/social_worker/social_home/controllers/social_home_controller.dart';

class BeneficiaryDetailsController extends GetxController {
  //TODO: Implement BeneficiaryDetailsController
  RxInt tabIndex = 0.obs;
  RxBool snap = true.obs;
  RxInt beneficiaryIndex = 0.obs;
  RxBool tabBarVisibility = true.obs;
  RxBool titleVisible = true.obs;
  RxDouble top = 0.0.obs;
  RxDouble opacity = 0.0.obs;
  final count = 0.obs;
  SocialHomeController socialHome = Get.find<SocialHomeController>();
  ScrollController scrollViewController = ScrollController();

  List<String> text = [
    'Note',
    'Connected',
    'Assigned',
  ];
  List<String> textNewLine = [
    'Details',
    'Organization',
    'Vouchers',
  ];
  @override
  void onInit() {
    super.onInit();
    titleVisible(false);
    scrollViewController.addListener(dataScrollController);
    if (Get.arguments != null) {
      beneficiaryIndex(Get.arguments as int);
    }
    logWTF(beneficiaryIndex);
  }

  void dataScrollController() {
    if (scrollViewController.offset > 150) {
      if (titleVisible.isFalse) {
        titleVisible(true);
      }
    } else {
      if (titleVisible.isTrue) {
        titleVisible(false);
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    scrollViewController.removeListener(dataScrollController);
  }

  void increment() => count.value++;
}
