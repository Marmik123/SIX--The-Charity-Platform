import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/models/available_vouchers.dart';
import 'package:six/app/data/remote/api_service/init_api_service.dart';

class VendorProvider {
  //Helper Function to fetch the home screen dashboard data of vendor.
  static Future<Map<String, dynamic>> getDashboardData() async {
    var response = await APIService.get(
      path: '/v1/auth/vendor-dashboard-data',
    );
    if (response?.statusCode == 200) {
      logI('###### vendor Dashboard data########');
      logI(response?.data!['data']);
      return response?.data!['data'] as Map<String, dynamic>;
    } else {
      return <String, dynamic>{};
    }
  }

  //Helper Function to fetch the vendor transactions list.
  static Future<List<AvailableVouchers>> getVoucherList({
    String skip = '',
    String limit = '',
  }) async {
    var response = await APIService.get(
      path: '/v1/auth/vendor-voucher-transaction/$skip/$limit',
    );
    if (response?.statusCode == 200) {
      logI('######transaction List########');
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

  //Helper function to redeem the voucher of needy family by scanning QR(QR will provide long id as data).
  static Future<bool> redeemVoucher({
    required String userVoucherId,
  }) async {
    var response = await APIService.post(
      path: '/v1/auth/redeem-voucher',
      data: <String, dynamic>{
        'userVoucherId': [
          userVoucherId,
        ],
      },
    );
    return response?.statusCode == 200;
  }

  //Helper function to redeem the voucher of needy family by manually typing redeem code or voucher code(For ex. test203).
  static Future<bool> redeemVoucherByRedeemCode({
    required String redeemCode,
  }) async {
    var response = await APIService.post(
      path: '/v1/auth/redeem-voucher-from-code',
      data: <String, dynamic>{
        'redeem_code': redeemCode,
      },
    );
    logW(response?.statusCode);
    return response?.statusCode == 200;
  }

  //Helper Function to fetch static pages info like terms and conditions ,privacy policy.
  static Future<Map<String, dynamic>> getStaticPages({
    String slugName = '',
  }) async {
    var response = await APIService.get(
      path: '/v1/list-static-page-slug/$slugName',
    );
    if (response?.statusCode == 200) {
      logI('######Static Pages########');
      logI(response?.data!['data']);
      //var voucherCategory = response?.data!['data'] as List<dynamic>;
      return response?.data!['data'] as Map<String, dynamic>;
    } else {
      // Get.snackbar<void>('Error in voucher list fetching', 'Please Try Again.');
      return <String, dynamic>{};
    }
  }
}
