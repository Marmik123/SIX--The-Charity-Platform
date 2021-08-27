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
  TextEditingController redeemCodeCtrl = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    redeemCodeCtrl.clear();
  }

  Future<Map<String, dynamic>> getVoucherDataThroughScan(
      String redeemCode) async {
    scanLoading(true);
    var voucherData =
        await VendorProvider.getVoucherDataOnScan(redeemCode: redeemCode);
    Get.back<void>();
    unawaited(dialog(
      success: redeemLoading(),
      redeemDialog: true,
      redeemVoucherData: voucherData,
      //onTapRedeemNow: redeemVoucherByRedeemCode(redeemCode),
    ));
    scanLoading(false);

    logI(voucherData);
    return voucherData;
  }

  Future<void> redeemVoucherByRedeemCode(String redeemCode) async {
    redeemLoading(true);
    var success =
        await VendorProvider.redeemVoucherByRedeemCode(redeemCode: redeemCode);
    redeemLoading(false);
    logI(success);
    Get.back<void>();
    if (success) {
      redeemCodeCtrl.clear();
      unawaited(dialog(
        success: true,
        message: 'Voucher has been successfully redeemed.',
      ));
    } else {
      unawaited(dialog(
        success: false,
      ));
    }
  }
}
