import 'package:get/get.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/models/vendor_details.dart';
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

  static Future<List<VendorDetails>> getVendorDetails(
      {String userId = ''}) async {
    var response = await APIService.get(
      path: '/v1/get-other-user-detail/$userId',
    );
    if (response.statusCode == 200) {
      logI('######VendorDetails########');
      logI(response.data!['data']);
      var vendorList = response.data!['data'] as List<dynamic>;
      return List<VendorDetails>.from(vendorList.map<VendorDetails>(
          (dynamic e) => VendorDetails.fromJson(e as Map<String, dynamic>)));
    } else {
      Get.snackbar<void>('Error in Graph Data', 'Please Try Again.');
      return <VendorDetails>[];
    }
  }
}
