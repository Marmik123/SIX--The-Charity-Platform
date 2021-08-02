import 'package:get/get.dart';

import '../controllers/available_credits_sw_controller.dart';

class AvailableCreditsSwBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AvailableCreditsSwController>(
      () => AvailableCreditsSwController(),
    );
  }
}
