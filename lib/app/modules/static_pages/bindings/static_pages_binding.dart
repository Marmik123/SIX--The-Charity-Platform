import 'package:get/get.dart';

import '../controllers/static_pages_controller.dart';

class StaticPagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StaticPagesController>(
      () => StaticPagesController(),
    );
  }
}
