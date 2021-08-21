import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pedantic/pedantic.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/models/assign_voucher.dart';
import 'package:six/app/data/models/voucher_category.dart';
import 'package:six/app/data/remote/provider/social_worker.dart';
import 'package:six/app/data/remote/provider/voucher_category.dart';
import 'package:six/app/modules/social_worker/beneficiary_details/controllers/beneficiary_details_controller.dart';
import 'package:six/app/ui/components/get_dialog.dart';

class DistributeVoucherController extends GetxController {
  //TODO: Implement DistributeVoucherController
  RxInt selectedCategory = 0.obs;
  RxInt voucherIndex = 0.obs;
  RxInt height = 280.obs;
  RxInt voucherToBeAssignCount = 0.obs;
  RxList<VoucherCategory> categoryList = <VoucherCategory>[].obs;
  RxList<AssignVoucher> searchedVoucherList = <AssignVoucher>[].obs;
  RxList<AssignVoucher> vouchers = <AssignVoucher>[].obs;
  RxList<int> initialVoucherCount = <int>[].obs;
  RxInt voucherCount = 0.obs;
  RxBool voucherAssigned = false.obs;
  RxBool voucherAssignLoading = false.obs;
  RxBool isLoading = false.obs;
  RxBool isSearched = false.obs;
  RxBool isVoucherLoading = false.obs;
  RxBool isSVoucherLoading = false.obs;
  RxInt skip = 0.obs;
  RxInt limit = 1000.obs;
  RxString categoryId = ''.obs;
  TextEditingController voucherSearch = TextEditingController();
  BeneficiaryDetailsController beneCtrl =
      Get.put(BeneficiaryDetailsController());
  @override
  void onInit() {
    super.onInit();
    assignVoucherCatList();
  }

  Future<void> assignVoucherCatList() async {
    isLoading(true);
    categoryList(await VoucherCategoryProvider.getVoucherCategoryList(
      limit: limit().toString(),
      skip: skip().toString(),
      type: 'vendor',
    ));
    logI(categoryList);
    isLoading(false);
    await assignVoucherList(categoryList[0].id!);
  }

  Future<void> assignSearchedVoucher(
      String categoryId, String searchText) async {
    isVoucherLoading(true);
    vouchers(await VoucherCategoryProvider.searchVoucher(
      categoryId: categoryId,
      skip: skip.toString(),
      limit: limit.toString(),
      searchText: searchText,
    ));
    logI(searchedVoucherList);
    isVoucherLoading(false);
  }

  /*String? getDate(int index) {
    var formattedDate = DateTime.parse(vouchers[index].voucherId.toString());
    var date = formattedDate.day;
    var year = formattedDate.year;
    var month = assignMonth(formattedDate.month);
    var finalDate = '$date,$month $year';
    return finalDate;
  }*/

  // bool checkIsExpired(int index) {
  //   var isAfter = DateTime.now().compareTo(vouchers[index].endDate!);
  //   if (isAfter > 0) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  Future<void> assignVoucherList(String categoryId) async {
    isVoucherLoading(true);
    initialVoucherCount.fillRange(0, initialVoucherCount.length, 0);
    logI(initialVoucherCount);
    vouchers(
      await VoucherCategoryProvider.getVoucherList(
        limit: limit().toString(),
        skip: skip().toString(),
        categoryId: categoryId,
      ),
    );
    initialVoucherCount.clear();
    vouchers.forEach((element) {
      initialVoucherCount.add(0);
    });
    logWTF(initialVoucherCount);
    logI(categoryList);
    isVoucherLoading(false);
  }

  Future<void> assignNow({
    required List vouchers,
  }) async {
    // isLoading(true);
    /* var check =
        initialVoucherCount.singleWhere((element) => element != 0, orElse: () {
      appSnackbar(
        message: 'Set quantity more than zero',
        snackbarState: SnackbarState.warning,
      );
      return 0;
    });*/

    if (initialVoucherCount.any((element) => element != 0)) {
      var success =
          await SocialWorkerProvider.assignVoucher(vouchers: vouchers);
      if (success) {
        voucherAssignLoading(false);
        await beneCtrl.assignBeneDashboardData();
        await beneCtrl.getAssignedVouchers();
        unawaited(
          dialog(
            success: true,
            message: 'Voucher Successfully\nAssigned',
          ),
        );
      }
    }
  }
}
