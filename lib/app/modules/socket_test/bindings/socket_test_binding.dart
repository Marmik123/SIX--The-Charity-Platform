import 'package:get/get.dart';

import '../controllers/socket_test_controller.dart';

class SocketTestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SocketTestController>(
      () => SocketTestController(),
    );
  }
}
