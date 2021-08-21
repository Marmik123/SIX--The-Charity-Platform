import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/models/available_vouchers.dart';
import 'package:six/app/data/models/support_details.dart';
import 'package:six/app/data/remote/api_service/init_api_service.dart';
import 'package:six/app/ui/components/app_snackbar.dart';

class NeedyProvider {
  //Helper Function to fetch the home screen dashboard data of needy family.
  static Future<Map<String, dynamic>> getDashboardData() async {
    var response = await APIService.get(
      path: '/v1/auth/beneficiary-login-dashboard-data',
    );
    if (response?.statusCode == 200) {
      logI('###### needy Dashboard data########');
      logI(response?.data!['data']);
      return response?.data!['data'] as Map<String, dynamic>;
    } else {
      return <String, dynamic>{};
    }
  }

  //Helper function to fetch the support details in profile section of needy family.
  static Future<List<SupportDetails>> getSupportDetails(
      {required String? skip, required String? limit}) async {
    var response = await APIService.get(
      path: '/v1/auth/beneficiary-support-list/$skip/$limit',
    );
    if (response?.statusCode == 200) {
      logI('######Support details ########');
      logI(response?.data!['data']);
      var vouchers = response?.data!['data'] as List<dynamic>;
      logI(vouchers);
      return List<SupportDetails>.from(vouchers.map<SupportDetails>(
          (dynamic e) => SupportDetails.fromMap(e as Map<String, dynamic>)));
    } else {
      appSnackbar(message: 'Error');
      return <SupportDetails>[];
    }
  }

  //Helper function to fetch the vouchers of particular category on passing categoryID.
  static Future<List<AvailableVouchers>> getVoucherList(
      {String skip = '', String limit = '', required String categoryId}) async {
    var response = await APIService.get(
      path:
          '/v1/auth/beneficiary-login-assigned-voucher-list/$categoryId/$skip/$limit',
    );
    if (response?.statusCode == 200) {
      logI('######Bene. Voucher Lists########');
      logI(response?.data!['data']);
      var voucherCategory = response?.data!['data'] as List<dynamic>;
      return List<AvailableVouchers>.from(
          voucherCategory.map<AvailableVouchers>((dynamic e) =>
              AvailableVouchers.fromJson(e as Map<String, dynamic>)));
    } else {
      // Get.snackbar<void>('Error in voucher list fetching', 'Please Try Again.');
      return <AvailableVouchers>[];
    }
  }
}
