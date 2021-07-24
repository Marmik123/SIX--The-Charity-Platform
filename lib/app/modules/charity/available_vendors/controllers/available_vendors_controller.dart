import 'package:get/get.dart';
import 'package:six/app/data/models/vendor_details.dart';
import 'package:six/app/data/provider/voucher_category.dart';

class AvailableVendorsController extends GetxController {
  //TODO: Implement AvailableVendorsController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  RxBool isLoading = false.obs;
  RxList<VendorDetails> vendorDetails = <VendorDetails>[].obs;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
  //Function for assigning vendor details.
  Future<void> assignVendorDetails(String userId) async {
    isLoading(true);
    vendorDetails(
      await VoucherCategoryProvider.getVendorDetails(
        userId: userId,
      ),
    );
    isLoading(false);
  }
}
