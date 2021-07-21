import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialHomeController extends GetxController {
  //TODO: Implement SocialHomeController
  RxInt? currentIndex = 0.obs;
  RxInt? tabIndex = 0.obs;

  RxBool paid = false.obs;
  RxInt? monthNum = 1.obs;
  RxString monthName = 'Sept'.obs;
  DateTime selectedDate = DateTime.now();
  ScrollController scrollController = ScrollController();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
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

  void assignMonth(int month) {
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

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
