import 'package:get/get.dart';

import '../controllers/purchase_social_controller.dart';

class PurchaseSocialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PurchaseSocialController>(
      () => PurchaseSocialController(),
    );
  }
}
