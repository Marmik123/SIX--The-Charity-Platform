import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/models/vendor_list.dart';
import 'package:six/app/data/models/voucher_category.dart';
import 'package:six/app/data/remote/provider/voucher_category.dart';

class AvailableVendorsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    isLoading(false);
    txtCtrl.clear();
    if (Get.arguments != null) {
      if (Get.arguments[0] is VoucherCategory) {
        voucherCategory = Get.arguments[0] as VoucherCategory;
        assignVendorList(voucherCategory.id);
      } else {
        logI('Different class');
      }
      if (Get.arguments[1] is int) {
        voucherCategoryIndex = Get.arguments[1] as int?;
      }
    } else {
      logI('Arguments empty');
    }
  }

  RxBool isLoading = false.obs;
  RxBool isSearched = false.obs;
  Map<String, dynamic>? vendorDetails;
  RxList<VendorList> searchedVendorList = <VendorList>[].obs;
  RxList<VendorList> vendorList = <VendorList>[].obs;
  RxInt skip = 0.obs;
  RxInt limit = 1000.obs;
  TextEditingController txtCtrl = TextEditingController();
  late VoucherCategory voucherCategory;
  int? voucherCategoryIndex;

  final formKey = GlobalKey<FormState>();
  RxInt categoryIndex = 0.obs;
  //Function for assigning vendor details.
  Future<void> assignVendorDetails(String userId) async {
    isLoading(true);
    vendorDetails = await VoucherCategoryProvider.getVendorDetails(
      userId: userId,
    );
    logI('Vendor Printed Details');
    logI(vendorDetails);
    isLoading(false);
  }

  //Function for assigning searched Vendor.
  Future<void> assignSearchedVendor(
      String categoryId, String searchText) async {
    isLoading(true);
    searchedVendorList(await VoucherCategoryProvider.searchVendor(
      categoryId: categoryId,
      skip: skip.toString(),
      limit: limit.toString(),
      searchText: searchText,
    ));
    logI(searchedVendorList);
    isLoading(false);
  }

  //Function for assigning vendor list.
  Future<void> assignVendorList(String categoryId) async {
    isSearched(false);
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
