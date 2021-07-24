import 'package:get/get.dart';
import 'package:six/app/data/models/vendor_list.dart';
import 'package:six/app/data/models/voucher_category.dart';
import 'package:six/app/data/provider/voucher_category.dart';

class PurchaseController extends GetxController {
  //TODO: Implement PurchaseController
  late RxInt? selectCategory = 0.obs;
  RxBool purchasePressed = false.obs;
  RxList<VoucherCategory> voucherCategory = <VoucherCategory>[].obs;
  RxList<VendorList> vendorList = <VendorList>[].obs;
  RxBool paid = false.obs;
  RxBool isLoading = false.obs;
  RxInt skip = 0.obs;
  RxInt limit = 1000.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    assignVoucherCatList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

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

  //Function for assigning vendor list.
  Future<void> assignVendorList(String categoryId) async {
    isLoading(true);
    vendorList(
      await VoucherCategoryProvider.getVendorOfCategory(
        limit: limit().toString(),
        skip: skip().toString(),
        categoryId: categoryId,
      ),
    );
    isLoading(false);
  }
}
