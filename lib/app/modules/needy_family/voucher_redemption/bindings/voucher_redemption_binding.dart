import 'package:get/get.dart';

import '../controllers/voucher_redemption_controller.dart';

class VoucherRedemptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VoucherRedemptionController>(
      () => VoucherRedemptionController(),
    );
  }
}
