import 'package:get/get.dart';

import '../controllers/social_onboarding_controller.dart';

class SocialOnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SocialOnboardingController>(
      () => SocialOnboardingController(),
    );
  }
}
