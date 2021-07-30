import 'package:get/get.dart' hide FormData;
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/models/vendor_list.dart';
import 'package:six/app/data/models/voucher_category.dart';
import 'package:six/app/data/remote/api_service/init_api_service.dart';

class VoucherCategoryProvider {
  //Helper function to fetch the voucher category list.
  static Future<List<VoucherCategory>> getVoucherCategoryList(
      {String skip = '', String limit = '', String type = 'vendor'}) async {
    var response = await APIService.get(
      path: '/v1/auth/list-type-active-category-application/$type/$skip/$limit',
    );
    if (response.statusCode == 200) {
      logI('######Voucher Category########');
      logI(response.data!['data']);
      var voucherCategory = response.data!['data'] as List<dynamic>;
      return List<VoucherCategory>.from(voucherCategory.map<VoucherCategory>(
          (dynamic e) => VoucherCategory.fromJson(e as Map<String, dynamic>)));
    } else {
      Get.snackbar<void>('Error in Graph Data', 'Please Try Again.');
      return <VoucherCategory>[];
    }
  }

  //Helper function to fetch the vendors of particular category on passing categoryID.
  static Future<List<VendorList>> getVendorOfCategory(
      {String skip = '', String limit = '', String categoryId = ''}) async {
    var response = await APIService.get(
      path: '/v1/auth/list-vendor-category/$categoryId/$skip/$limit',
    );
    if (response.statusCode == 200) {
      logI('######Vendor of Category########');
      logI(response.data!['data']);
      var vendorList = response.data!['data'] as List<dynamic>;
      return List<VendorList>.from(vendorList.map<VendorList>(
          (dynamic e) => VendorList.fromJson(e as Map<String, dynamic>)));
    } else {
      Get.snackbar<void>('Error in Graph Data', 'Please Try Again.');
      return <VendorList>[];
    }
  }

  //Helper function to fetch the vendor details on passing vendor ID as path variable.
  static Future<Map<String, dynamic>?> getVendorDetails(
      {String userId = ''}) async {
    var response = await APIService.get(
      path: '/v1/get-other-user-detail/$userId',
    );
    if (response.statusCode == 200) {
      logI('######VendorDetails########');
      logI(response.data!['data']);
      var vendorList = response.data!['data'] as Map<String, dynamic>;
      return vendorList;
      /*  return List<VendorDetails>.from(vendorList.map<VendorDetails>(
          (dynamic e) => VendorDetails.fromJson(e as Map<String, dynamic>)));
   */
    } else {
      Get.snackbar<void>('Error in Graph Data', 'Please Try Again.');
      return null;
    }
  }

  //Helper function to display the searched vendor by name.
  static Future<List<VendorList>> searchVendor(
      {String searchText = '',
      String skip = '',
      String limit = '',
      String categoryId = ''}) async {
    var response = await APIService.get(
      path:
          '/v1/auth/list-search-vendor-category/$searchText/$categoryId/$skip/$limit',
    );
    if (response.statusCode == 200) {
      logI('######Searched Vendor########');
      logI(response.data!['data']);
      var vendorList = response.data!['data'] as List<dynamic>;
      return List<VendorList>.from(vendorList.map<VendorList>(
          (dynamic e) => VendorList.fromJson(e as Map<String, dynamic>)));
    } else {
      Get.snackbar<void>('Error in Graph Data', 'Please Try Again.');
      return <VendorList>[];
    }
  }

  //Helper function to purchase the voucher of particular category.
  static Future<bool> purchaseVoucherCategory({
    required String categoryId,
    required String programId,
    required double amount,
  }) async {
    assert(amount > 0);
    var response = await APIService.post(
      path: '/v1/auth/distribute-program-amount',
      data: <String, dynamic>{
        'charity_program_id': programId,
        'category_id': categoryId,
        'amount': amount,
      },
    );
    return response.statusCode == 200;
  }
}
