import 'package:get/get.dart';
import 'package:six/app/modules/needy_family/home/controllers/home_controller.dart';

class VoucherRedemptionController extends GetxController {
  //TODO: Implement VoucherRedemptionController
  HomeController ctrl = Get.put(HomeController());
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
