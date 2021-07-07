import 'package:get/get.dart';

import '../controllers/vendor_details_controller.dart';

class VendorDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VendorDetailsController>(
      () => VendorDetailsController(),
    );
  }
}
