import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six/app/modules/social_worker/social_home/controllers/social_home_controller.dart';
import 'package:six/app/utils/get_month_name.dart';
import 'package:url_launcher/url_launcher.dart';

class HistorySwController extends GetxController
    with SingleGetTickerProviderMixin {
  TabController? tabController;
  ScrollController scrollViewController = ScrollController();
  RxBool titleVisible = true.obs;
  RxInt tabIndex = 0.obs;
  RxString startDateValue = ''.obs;
  RxString name = ''.obs;
  RxString lastDateValue = ''.obs;
  SocialHomeController socialCtrl = Get.find<SocialHomeController>();
  List<String> text = [
    '',
    '',
    '',
  ];
  List<String> textNewLine = [
    'All',
    'Assigned',
    'Redeemed',
  ];
  //Type for Specifying in API call.
  List<String> type = [
    'all',
    'assigned',
    'redeemed',
  ];
  RxString monthName = ''.obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    initialDateValues();
    titleVisible(false);
    scrollViewController.addListener(dataScrollController);
  }

  void initialDateValues() {
    var initialDate = DateTime.now();
    monthName(assignMonth(initialDate.month));
    var startDate = DateTime(initialDate.year, initialDate.month, 0);
    var endDate = DateTime(initialDate.year, initialDate.month + 1, 0);
    startDateValue(startDate.toString());
    lastDateValue(endDate.toString());
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
  void onClose() {
    tabController!.dispose();
    scrollViewController.removeListener(dataScrollController);
  }
}
