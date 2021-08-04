import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedantic/pedantic.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/models/voucher_category.dart';
import 'package:six/app/data/remote/provider/voucher_category.dart';
import 'package:six/app/modules/charity/charity_home/controllers/charity_home_controller.dart';
import 'package:six/app/modules/needy_family/available_credits/controllers/available_credits_controller.dart';
import 'package:six/app/ui/components/app_snackbar.dart';
import 'package:six/app/ui/components/get_dialog.dart';

class PurchaseController extends GetxController {
  late RxInt? selectCategory = 0.obs;
  RxBool purchasePressed = false.obs;
  RxList<VoucherCategory> voucherCategory = <VoucherCategory>[].obs;
  RxBool paid = false.obs;
  // RxBool failed = false.obs;
  RxBool isLoading = false.obs;
  RxBool paymentInProgress = false.obs;
  // RxInt? paymentStatusCode = 0.obs;
  RxInt skip = 0.obs;
  RxInt limit = 1000.obs;
  TextEditingController textEditingController =
      Get.put(TextEditingController());
  CharityHomeController charityHomeController =
      Get.put(CharityHomeController());
  AvailableCreditsController programListingCtrl =
      Get.put(AvailableCreditsController());

  final amountController = MoneyMaskedTextController(
    leftSymbol: '\$ ',
    decimalSeparator: '',
    thousandSeparator: ',',
    initialValue: 0.0,
    precision: 0,
  );

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
    // logI('This is paystatusCode$paymentStatusCode');
    logI(voucherCategory[selectCategory!()].id.toString());
    logI(charityHomeController.graphDetails[0].id.toString());
    logI(amount);

    var selectedProgramIndex = programListingCtrl.programIndex!();
    logWTF(programListingCtrl
        .programCreditsAvailability[selectedProgramIndex].value!);
    var fundsAvailable = programListingCtrl
            .programCreditsAvailability[selectedProgramIndex].value! >
        amount!;
    logI(fundsAvailable);
    if (!fundsAvailable) {
      paymentInProgress(false);
      logI('INSUFFICIENT FUNDS');
      appSnackbar(
        message: 'Insufficient funds in this program',
        snackbarState: SnackbarState.danger,
      );
    } else {
      var success = fundsAvailable
          ? await VoucherCategoryProvider.purchaseVoucherCategory(
              categoryId: voucherCategory[selectCategory!()].id.toString(),
              programId: charityHomeController
                  .graphDetails[programListingCtrl.programIndex!()].id
                  .toString(),
              amount: amount,
            )
          : null;
      logI(success);
      if (success!) {
        paymentInProgress(false);
        var purchasedCategory =
            voucherCategory[selectCategory!()].name.toString();
        unawaited(
          dialog(
              success: true,
              message:
                  'Congrats! You have successfully\npurchased credits for $purchasedCategory category.'),
          /*Get.dialog<void>(
            SizedBox(
              height: Get.height,
              width: Get.width,
              child: Stack(
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20.r, sigmaY: 20.r),
                    child: Container(
                      height: 1.sh,
                      width: 1.sw,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.k0087A1.withOpacity(0.4),
                            offset: const Offset(0, 2),
                            blurRadius: 40.r,
                          ),
                        ],
                      ),
                    ),
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20.r, sigmaY: 20.r),
                    child: Container(
                      height: 1.sh,
                      width: 1.sw,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.k0087A1.withOpacity(0.6),
                            offset: const Offset(0, 4),
                            blurRadius: 4.r,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Material(
                          color: Colors.transparent,
                          child: actionDialog(
                            onTapCancel: () {
                              paid(false);
                              Get.back<void>();
                            },
                            dialogTypeText: 'Success!',
                            assetName: R.image.asset.success_redem.assetName,
                            text:
                                'Congrats! You have successfully\npurchased credits for $purchasedCategory\ncategory',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            useSafeArea: false,
          ),*/
        );
        refreshHomeScreenData();
      } else {
        paymentInProgress(false);
        unawaited(
          dialog(success: false),
/*
          Get.dialog<void>(
            Scaffold(
              extendBody: true,
              body: SizedBox(
                height: Get.height,
                width: Get.width,
                child: Stack(
                  children: [
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20.r, sigmaY: 20.r),
                      child: Container(
                        height: 1.sh,
                        width: 1.sw,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.k0087A1.withOpacity(0.4),
                              offset: const Offset(0, 2),
                              blurRadius: 40.r,
                            ),
                          ],
                        ),
                      ),
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20.r, sigmaY: 20.r),
                      child: Container(
                        height: 1.sh,
                        width: 1.sw,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.k0087A1.withOpacity(0.6),
                              offset: const Offset(0, 4),
                              blurRadius: 4.r,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Material(
                            color: Colors.transparent,
                            child: actionDialog(
                              onTapCancel: () {
                                paid(false);
                                Get.back<void>();
                              },
                              dialogTypeText: 'Oops!',
                              assetName: R.image.asset.error_dialog.assetName,
                              text: 'Something went wrong. Please\ntry again',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            useSafeArea: false,
          ),
*/
        );
        logW('Cannot refresh data as error in payment process');
        return null;
      }
    }
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
