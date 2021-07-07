import 'package:get/get.dart';

class VendorHomeController extends GetxController {
  //TODO: Implement VendorHomeController
  RxInt? currentIndex = 0.obs;
  RxInt? monthNum = 1.obs;
  RxString monthName = 'Sept'.obs;
  late DateTime? selectedDate = DateTime.now();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
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
  void onClose() {}
  void increment() => count.value++;
}
