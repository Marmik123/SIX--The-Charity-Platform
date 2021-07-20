import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HistorySwController extends GetxController
    with SingleGetTickerProviderMixin {
  //TODO: Implement HistorySwController
  TabController? tabController;
  ScrollController scrollViewController = ScrollController();
  RxBool titleVisible = true.obs;
  RxInt tabIndex = 0.obs;
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
  RxString monthName = 'Sept'.obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    titleVisible(false);
    scrollViewController.addListener(dataScrollController);
  }

  Future<void> launchURL() async {
    final params = Uri(
      scheme: 'mailto',
      path: 'raymondwong@gmail.com',
    );
    var url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  void assignMonth({int month = 1}) {
    switch (month) {
      case 1:
        monthName('Jan');
        break;
      case 2:
        monthName('Feb');
        break;
      case 3:
        monthName('March');
        break;
      case 4:
        monthName('April');
        break;
      case 5:
        monthName('May');
        break;
      case 6:
        monthName('June');
        break;
      case 7:
        monthName('July');
        break;
      case 8:
        monthName('Aug');
        break;
      case 9:
        monthName('Sept');
        break;
      case 10:
        monthName('Oct');
        break;
      case 11:
        monthName('Nov');
        break;
      case 12:
        monthName('Dec');
        break;
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
    tabController!.dispose();
    scrollViewController.removeListener(dataScrollController);
  }

  void increment() => count.value++;
}
