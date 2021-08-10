import 'package:get/get.dart';
import 'package:pedantic/pedantic.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/models/available_vouchers.dart';
import 'package:six/app/data/models/voucher_category.dart';
import 'package:six/app/data/remote/provider/social_worker.dart';
import 'package:six/app/data/remote/provider/voucher_category.dart';
import 'package:six/app/modules/social_worker/beneficiary_details/controllers/beneficiary_details_controller.dart';
import 'package:six/app/ui/components/app_snackbar.dart';
import 'package:six/app/ui/components/get_dialog.dart';

class DistributeVoucherController extends GetxController {
  //TODO: Implement DistributeVoucherController
  RxInt selectedCategory = 0.obs;
  RxInt voucherIndex = 0.obs;
  RxInt height = 280.obs;
  RxList<VoucherCategory> categoryList = <VoucherCategory>[].obs;
  RxList<AvailableVouchers> vouchers = <AvailableVouchers>[].obs;
  RxList<int> initialVoucherCount = <int>[].obs;
  RxInt voucherCount = 0.obs;
  RxBool voucherAssigned = false.obs;
  RxBool isLoading = false.obs;
  RxBool isVoucherLoading = false.obs;
  RxInt skip = 0.obs;
  RxInt limit = 1000.obs;
  RxString categoryId = ''.obs;
  BeneficiaryDetailsController beneCtrl =
      Get.find<BeneficiaryDetailsController>();
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
    logI(initialVoucherCount);
    logI(categoryList);
    isVoucherLoading(false);
  }

  Future<void> assignNow({
    String? familyUserId,
    String? voucherId,
    String? name,
    double? quantity,
    double? amount,
  }) async {
    // isLoading(true);
    var check =
        initialVoucherCount.singleWhere((element) => element != 0, orElse: () {
      appSnackbar(
        message: 'Set quantity more than zero',
        snackbarState: SnackbarState.warning,
      );
      return 0;
    });
    if (initialVoucherCount.any((element) => element != 0)) {
      var success = await SocialWorkerProvider.assignVoucher(
        familyUserId: familyUserId!,
        voucherId: voucherId!,
        name: name!,
        quantity: quantity!,
        amount: amount!,
      );

      if (success) {
        //isLoading(false);
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
