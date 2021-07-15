import 'package:get/get.dart';

import '../controllers/connected_organization_controller.dart';

class ConnectedOrganizationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectedOrganizationController>(
      () => ConnectedOrganizationController(),
    );
  }
}
