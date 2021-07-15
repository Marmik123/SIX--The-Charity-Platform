import 'package:get/get.dart';

import '../controllers/distribute_voucher_controller.dart';

class DistributeVoucherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DistributeVoucherController>(
      () => DistributeVoucherController(),
    );
  }
}
