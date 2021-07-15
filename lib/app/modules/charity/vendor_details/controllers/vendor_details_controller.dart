import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorDetailsController extends GetxController
    with SingleGetTickerProviderMixin {
  //TODO: Implement VendorDetailsController
  TabController? tabController;
  List<String> text = [
    '',
    '',
  ];
  List<String> textNewLine = [
    'About Us',
    'Availalbe Vouchers ',
  ];
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController!.dispose();
  }

  void increment() => count.value++;
}
