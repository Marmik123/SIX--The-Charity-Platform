import 'package:get/get.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/modules/needy_family/home/controllers/home_controller.dart';

class VoucherRedemptionController extends GetxController {
  HomeController ctrl = Get.find<HomeController>();
  RxBool codeEntered = false.obs;
  RxBool codeCopied = false.obs;
  RxString? voucherCode =
      ''.obs; // Code entered for retrieving through voucher code.
  RxString? qrCode = ''.obs; //Code That will be retrived on scanning QR
  RxList<String> qrCodeData = <String>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    codeCopied(false);
    if (Get.arguments != null) {
      logI(Get.arguments);
      qrCode!(Get.arguments as String);
      logW(qrCode);
      // qrCodeData!(Get.arguments as List<AvailableVouchers>);
    }
    /*if (qrCodeData != null) {
      logWTF(jsonDecode(qrCodeData![0].toString()));
    }*/
  }
}
