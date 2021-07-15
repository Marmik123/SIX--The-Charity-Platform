import 'package:get/get.dart';

class AssignedVoucherController extends GetxController {
  //TODO: Implement AssignedVoucherController
  RxInt voucherCount = 0.obs;
  RxBool paid = false.obs;
  RxBool purchasePressed = false.obs;
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
