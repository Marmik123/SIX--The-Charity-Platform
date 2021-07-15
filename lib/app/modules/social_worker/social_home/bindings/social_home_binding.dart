import 'package:get/get.dart';

import '../controllers/social_home_controller.dart';

class SocialHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SocialHomeController>(
      () => SocialHomeController(),
    );
  }
}
