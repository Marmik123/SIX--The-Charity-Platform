import 'package:get/get.dart';

import '../controllers/history_sw_controller.dart';

class HistorySwBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistorySwController>(
      () => HistorySwController(),
    );
  }
}
