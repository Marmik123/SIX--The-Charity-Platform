import 'package:get/get.dart';

import '../controllers/voucher_controller.dart';

class VoucherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VoucherController>(
      () => VoucherController(),
    );
  }
}
