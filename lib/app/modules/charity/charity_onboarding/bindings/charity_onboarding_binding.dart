import 'package:get/get.dart';

import '../controllers/charity_onboarding_controller.dart';

class CharityOnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CharityOnboardingController>(
      () => CharityOnboardingController(),
    );
  }
}
