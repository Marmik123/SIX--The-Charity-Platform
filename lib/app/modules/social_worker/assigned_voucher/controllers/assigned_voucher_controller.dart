import 'package:get/get.dart';
import 'package:six/app/modules/charity/purchase/controllers/purchase_controller.dart';

class AssignedVoucherController extends GetxController {
  //TODO: Implement AssignedVoucherController
  RxInt voucherCount = 1.obs;
  RxInt voucherFilterIndex = 0.obs;
  RxBool paid = false.obs;
  RxDouble totalAmount = 0.0.obs;
  RxBool purchasePressed = false.obs;
  RxBool filterLoading = false.obs;
  PurchaseController purCtrl = Get.put(PurchaseController());
  RxList<String> assignedVoucherFilter = <String>[
    'All',
    'Assigned',
    'Redeemed',
    'Expired',
  ].obs;
  @override
  void onInit() {
    super.onInit();
  }
}
