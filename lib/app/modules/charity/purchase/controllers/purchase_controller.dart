import 'package:get/get.dart';

class PurchaseController extends GetxController {
  //TODO: Implement PurchaseController
  late RxInt? selectCategory = 0.obs;
  RxBool purchasePressed = false.obs;
  RxBool paid = false.obs;
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
