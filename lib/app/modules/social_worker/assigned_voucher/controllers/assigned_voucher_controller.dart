import 'package:get/get.dart';

class AssignedVoucherController extends GetxController {
  //TODO: Implement AssignedVoucherController
  RxInt voucherCount = 0.obs;
  RxBool paid = false.obs;
  RxDouble totalAmount = 0.0.obs;
  RxBool purchasePressed = false.obs;

  @override
  void onInit() {
    super.onInit();
  }
}
