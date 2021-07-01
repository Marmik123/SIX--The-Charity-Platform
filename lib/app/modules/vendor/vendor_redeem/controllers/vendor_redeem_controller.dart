import 'package:get/get.dart';

class VendorRedeemController extends GetxController {
  //TODO: Implement VendorRedeemController
  RxBool codeEntered = false.obs;

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
