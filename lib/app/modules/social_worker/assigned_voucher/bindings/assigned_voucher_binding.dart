import 'package:get/get.dart';

import '../controllers/assigned_voucher_controller.dart';

class AssignedVoucherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssignedVoucherController>(
      () => AssignedVoucherController(),
    );
  }
}
