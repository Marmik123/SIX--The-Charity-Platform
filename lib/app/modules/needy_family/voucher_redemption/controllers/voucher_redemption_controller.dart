import 'package:get/get.dart';
import 'package:six/app/modules/needy_family/home/controllers/home_controller.dart';

class VoucherRedemptionController extends GetxController {
  HomeController ctrl = Get.find<HomeController>();
  RxBool codeEntered = false.obs;
  RxBool codeCopied = false.obs;
  RxString? voucherCode = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    codeCopied(false);
    if (Get.arguments != null) {
      voucherCode!(Get.arguments as String);
    }
  }
}
