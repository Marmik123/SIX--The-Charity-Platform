import 'package:get/get.dart';

import '../controllers/qr_screen_controller.dart';

class QrScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QrScreenController>(
      () => QrScreenController(),
    );
  }
}
