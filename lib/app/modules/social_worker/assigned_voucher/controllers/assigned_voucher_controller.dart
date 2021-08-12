import 'package:get/get.dart';
import 'package:six/app/modules/charity/purchase/controllers/purchase_controller.dart';

class AssignedVoucherController extends GetxController {
  //TODO: Implement AssignedVoucherController
  RxInt voucherCount = 1.obs;
  RxBool paid = false.obs;
  RxDouble totalAmount = 0.0.obs;
  RxBool purchasePressed = false.obs;
  PurchaseController purCtrl = Get.put(PurchaseController());
  @override
  void onInit() {
    super.onInit();
  }
}
