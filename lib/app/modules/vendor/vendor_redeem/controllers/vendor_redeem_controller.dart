import 'package:get/get.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/remote/provider/vendor_provider.dart';

class VendorRedeemController extends GetxController {
  RxBool codeEntered = false.obs;
  RxBool redeemThroughNum = false.obs;
  RxBool redeemNow = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> redeemVoucherThroughCode(String voucherId) async {
    var success = VendorProvider.redeemVoucher(userVoucherId: voucherId);
    logI(success);
  }
}
