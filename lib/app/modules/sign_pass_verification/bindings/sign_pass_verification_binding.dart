import 'package:get/get.dart';

import '../controllers/sign_pass_verification_controller.dart';

class SignPassVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignPassVerificationController>(
      () => SignPassVerificationController(),
    );
  }
}
