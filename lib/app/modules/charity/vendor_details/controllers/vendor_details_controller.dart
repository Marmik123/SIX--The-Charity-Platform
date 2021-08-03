import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorDetailsController extends GetxController {
  TabController? tabController;
  RxInt tabIndex = 0.obs;
  RxBool isLoading = false.obs;
  ScrollController scrollController = ScrollController();
  List<String> text = [
    '',
    '',
  ];
  List<String> textNewLine = [
    'About Us',
    'Available Vouchers ',
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(
      length: 2,
      vsync: NavigatorState(),
    );
  }

  @override
  void onClose() {
    tabController!.dispose();
  }
}
