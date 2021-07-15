import 'package:get/get.dart';

import '../controllers/beneficiary_details_controller.dart';

class BeneficiaryDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BeneficiaryDetailsController>(
      () => BeneficiaryDetailsController(),
    );
  }
}
