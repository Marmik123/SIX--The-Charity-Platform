import 'package:get/get.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/modules/social_worker/beneficiary_details/controllers/beneficiary_details_controller.dart';

class EditNoteController extends GetxController {
  RxInt noteIndex = 0.obs;
  BeneficiaryDetailsController beneCtrl =
      Get.find<BeneficiaryDetailsController>();
  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      noteIndex(Get.arguments as int);
    }
    logW(noteIndex);
  }
}
