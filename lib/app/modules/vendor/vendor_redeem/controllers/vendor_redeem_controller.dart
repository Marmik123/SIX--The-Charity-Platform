import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pedantic/pedantic.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/remote/provider/vendor_provider.dart';
import 'package:six/app/ui/components/get_dialog.dart';

class VendorRedeemController extends GetxController {
  RxBool codeEntered = false.obs;
  RxBool redeemLoading = false.obs;
  RxBool scanLoading = false.obs;
  RxBool redeemThroughNum = false.obs;
  RxBool redeemNow = false.obs;
  TextEditingController redeemCode = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    redeemCode.clear();
  }

  Future<void> redeemVoucherThroughScan(String voucherId) async {
    scanLoading(true);
    var success = await VendorProvider.redeemVoucher(userVoucherId: voucherId);
    scanLoading(false);
    logI(success);
  }

  Future<void> redeemVoucherByRedeemCode(String redeemCode) async {
    redeemLoading(true);
    var success =
        await VendorProvider.redeemVoucherByRedeemCode(redeemCode: redeemCode);
    redeemLoading(false);
    logI(success);
    if (success) {
      unawaited(dialog(
          success: true, message: 'Voucher has been successfully redeemed.'));
    }
  }
}
