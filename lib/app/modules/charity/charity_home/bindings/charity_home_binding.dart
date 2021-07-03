import 'package:get/get.dart';

import '../controllers/charity_home_controller.dart';

class CharityHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CharityHomeController>(
      () => CharityHomeController(),
    );
  }
}
