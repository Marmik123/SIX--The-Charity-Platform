import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BeneficiaryDetailsController extends GetxController {
  //TODO: Implement BeneficiaryDetailsController
  RxInt tabIndex = 0.obs;
  RxBool snap = true.obs;
  RxString beneficiaryId = ''.obs;
  RxBool tabBarVisibility = true.obs;
  RxBool titleVisible = true.obs;
  RxDouble top = 0.0.obs;
  RxDouble opacity = 0.0.obs;
  final count = 0.obs;
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
      beneficiaryId(Get.arguments as String);
    }
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
