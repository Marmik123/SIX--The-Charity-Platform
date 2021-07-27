import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/models/voucher_category.dart';
import 'package:six/app/data/provider/voucher_category.dart';
import 'package:six/app/modules/charity/charity_home/controllers/charity_home_controller.dart';
import 'package:six/app/modules/needy_family/available_credits/controllers/available_credits_controller.dart';

class PurchaseController extends GetxController {
  late RxInt? selectCategory = 0.obs;
  RxBool purchasePressed = false.obs;
  RxList<VoucherCategory> voucherCategory = <VoucherCategory>[].obs;
  RxBool paid = false.obs;
  RxBool failed = false.obs;
  RxBool isLoading = false.obs;
  RxBool paymentInProgress = false.obs;
  RxInt? paymentStatusCode = 0.obs;
  RxInt skip = 0.obs;
  RxInt limit = 1000.obs;
  TextEditingController textEditingController =
      Get.put(TextEditingController());
  CharityHomeController charityHomeController =
      Get.put(CharityHomeController());
  AvailableCreditsController programListingCtrl =
      Get.put(AvailableCreditsController());
  @override
  void onInit() {
    super.onInit();
    assignVoucherCatList();
  }

  //Function for assigning voucher category list.
  Future<void> assignVoucherCatList() async {
    isLoading(true);
    voucherCategory(
      await VoucherCategoryProvider.getVoucherCategoryList(
        limit: limit().toString(),
        skip: skip().toString(),
        type: 'vendor',
      ),
    );
    isLoading(false);
  }

  //Function for purchasing voucher category.
  Future<void> purchaseVoucherCat({
    double? amount,
  }) async {
    paymentInProgress(true);
    logI('This is paystatusCode$paymentStatusCode');
    logI(voucherCategory[selectCategory!()].id.toString());
    logI(charityHomeController.graphDetails[0].id.toString());
    logI(amount);
    paymentStatusCode!(await VoucherCategoryProvider.purchaseVoucherCategory(
      categoryId: voucherCategory[selectCategory!()].id.toString(),
      programId: charityHomeController
          .graphDetails[programListingCtrl.programIndex!()].id
          .toString(),
      amount: amount!,
    ));
    logI('This is paystatusCode$paymentStatusCode');
    if (paymentStatusCode!() == 200) {
      paid(true);
      refreshHomeScreenData();
    } else {
      logW('Cannot refresh data as error in payment process');
      return null;
    }
    logI(paymentStatusCode);
    paymentInProgress(false);
  }

  void refreshHomeScreenData() {
    charityHomeController.assignToGraphDetails();
    charityHomeController.assignToCategoryDetails(charityHomeController
        .graphDetails[programListingCtrl.programIndex!()].id
        .toString());
    charityHomeController.assignDashboardData();
    programListingCtrl.assignToAvailProgCredit();
  }
}
