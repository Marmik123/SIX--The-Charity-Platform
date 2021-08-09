import 'package:get/get.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/models/available_vouchers.dart';
import 'package:six/app/data/models/voucher_category.dart';
import 'package:six/app/data/remote/provider/voucher_category.dart';

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
}
