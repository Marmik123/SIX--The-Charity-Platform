import 'package:get/get.dart';

class VendorHomeController extends GetxController {
  //TODO: Implement VendorHomeController
  RxInt? currentIndex = 0.obs;

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
