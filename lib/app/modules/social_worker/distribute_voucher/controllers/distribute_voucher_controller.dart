import 'package:get/get.dart';

class DistributeVoucherController extends GetxController {
  //TODO: Implement DistributeVoucherController
  RxInt selectedCategory = 0.obs;
  RxInt height = 280.obs;
  RxInt voucherCount = 0.obs;
  RxBool voucherAssigned = false.obs;
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
