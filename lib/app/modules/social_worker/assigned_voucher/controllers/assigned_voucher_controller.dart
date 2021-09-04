import 'package:get/get.dart';
import 'package:six/app/modules/charity/purchase/controllers/purchase_controller.dart';
import 'package:six/app/utils/get_month_name.dart';

class AssignedVoucherController extends GetxController {
  RxInt voucherCount = 1.obs;
  RxInt voucherFilterIndex = 0.obs;
  RxBool paid = false.obs;
  RxString title = '-'.obs;
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

  String? getDate({required String datePassed}) {
    var formattedDate = DateTime.parse(datePassed);
    var date = formattedDate.day;
    var year = formattedDate.year;
    var month = assignMonth(formattedDate.month);
    var finalDate = '$date,$month $year';
    return finalDate;
  }
}
