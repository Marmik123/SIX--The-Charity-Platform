import 'package:get/get.dart';

import '../controllers/available_credits_controller.dart';

class AvailableCreditsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AvailableCreditsController>(
      () => AvailableCreditsController(),
    );
  }
}
