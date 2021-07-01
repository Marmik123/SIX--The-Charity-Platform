import 'package:get/get.dart';

import '../controllers/onboarding_vendor_controller.dart';

class OnboardingVendorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingVendorController>(
      () => OnboardingVendorController(),
    );
  }
}
