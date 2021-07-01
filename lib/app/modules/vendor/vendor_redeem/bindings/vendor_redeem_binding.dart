import 'package:get/get.dart';

import '../controllers/vendor_redeem_controller.dart';

class VendorRedeemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VendorRedeemController>(
      () => VendorRedeemController(),
    );
  }
}
