import 'package:get/get.dart';

import '../controllers/available_vendors_controller.dart';

class AvailableVendorsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AvailableVendorsController>(
      () => AvailableVendorsController(),
    );
  }
}
