import 'package:pedantic/pedantic.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/models/available_credits_sw.dart';
import 'package:six/app/data/models/available_vouchers.dart';
import 'package:six/app/data/models/user_entity.dart';
import 'package:six/app/data/remote/api_service/init_api_service.dart';
import 'package:six/app/ui/components/app_snackbar.dart';
import 'package:six/app/ui/components/get_dialog.dart';

class SocialWorkerProvider {
  //Helper Function to fetch the social worker dashboard data .
  static Future<Map<String, dynamic>?> getSWDashBoardData() async {
    var response = await APIService.get(
      path: '/v1/auth/worker-dashboard-data',
    );
    if (response?.statusCode == 200) {
      logI('######SWDashData########');
      logI(response?.data!['data']);
      var availCredits = response?.data!['data'] as Map<String, dynamic>;
      return availCredits;
    } else {
      appSnackbar(message: 'Error');
      return null;
    }
  }

  //Helper Function to fetch the beneficiaries associated with SW.
  static Future<List<UserEntity>> getBeneficiaryList(
      {required String? skip, required String? limit}) async {
    var response = await APIService.get(
      path: '/v1/auth/worker-beneficiary-list/$skip/$limit',
    );
    if (response?.statusCode == 200) {
      logI('######BeneficiaryList########');
      logI(response?.data!['data']);
      var beneList = response?.data!['data'] as List<dynamic>;
      logI(beneList);
      return List<UserEntity>.from(beneList.map<UserEntity>(
          (dynamic e) => UserEntity.fromMap(e as Map<String, dynamic>)));
    } else {
      appSnackbar(message: 'Error');
      return <UserEntity>[];
    }
  }

  //Helper Function to fetch the available credits of the category.
  static Future<List<AvailableCredits>> availableCreditsCategory(
      {required String? skip, required String? limit}) async {
    var response = await APIService.get(
      path: '/v1/auth/worker-list-available-credits/$skip/$limit',
    );
    if (response?.statusCode == 200) {
      logI('######AvailableCreditsCateg########');
      logI(response?.data!['data']);
      var availCredits = response?.data!['data'] as List<dynamic>;
      logI(availCredits);
      return List<AvailableCredits>.from(availCredits.map<AvailableCredits>(
          (dynamic e) => AvailableCredits.fromMap(e as Map<String, dynamic>)));
    } else {
      appSnackbar(message: 'Error');
      return <AvailableCredits>[];
    }
  }

  //Helper Function to fetch the available vouchers of a particular vendor.
  static Future<List<AvailableVouchers>> getAvailableVouchers(
      {required String? vendorId,
      required String? skip,
      required String? limit}) async {
    var response = await APIService.get(
      path: '/v1/auth/list-vendor-voucher/$vendorId/$skip/$limit',
    );
    if (response?.statusCode == 200) {
      logI('######Available Vouchers########');
      logI(response?.data!['data']);
      var vouchers = response?.data!['data'] as List<dynamic>;
      logI(vouchers);
      return List<AvailableVouchers>.from(vouchers.map<AvailableVouchers>(
          (dynamic e) => AvailableVouchers.fromMap(e as Map<String, dynamic>)));
    } else {
      appSnackbar(message: 'Error');
      return <AvailableVouchers>[];
    }
  }

  static Future<List<UserEntity>> getBeneficiaryOrganization(
      {required String? needyFamilyId,
      required String? skip,
      required String? limit}) async {
    var response = await APIService.get(
      path: '/v1/auth/beneficiary-charity-list/$needyFamilyId/$skip/$limit',
    );
    if (response?.statusCode == 200) {
      logI('######Available Vouchers########');
      logI(response?.data!['data']);
      var vouchers = response?.data!['data'] as List<dynamic>;
      logI(vouchers);
      return List<UserEntity>.from(vouchers.map<UserEntity>(
          (dynamic e) => UserEntity.fromMap(e as Map<String, dynamic>)));
    } else {
      appSnackbar(message: 'Error');
      return <UserEntity>[];
    }
  }

  //Helper Function to assign a purchased voucher to  selected beneficiary.
  static Future<bool> assignVoucher({
    required String familyUserId,
    required String voucherId,
    required String name,
    required double quantity,
    required double amount,
  }) async {
    var response = await APIService.post(
        path: '/v1/auth/assign-beneficiery',
        encrypt: true,
        data: <String, dynamic>{
          'familyUserId': familyUserId,
          'voucherId': voucherId,
          'name': name,
          'quantity': quantity,
          'amount': amount,
        });
    logI(response);
    if (response?.statusCode != 200) {
      unawaited(dialog(
          success: false, message: response!.data['message'].toString()));
    }
    logWTF(response?.statusMessage);
    return response?.statusCode == 200;
  }

  //Helper Function to purchase a voucher from available vouchers.
  static Future<bool> purchaseVoucher({
    String? skip,
    String? limit,
    required List<Map<String, dynamic>> categoryAmount,
    required List<Map<String, dynamic>> vouchers,
  }) async {
    var response = await APIService.post(
        path: '/v1/auth/cart-checkout',
        encrypt: true,
        data: <String, dynamic>{
          'category_amount': categoryAmount,
          'vouchers': vouchers,
        });
    logI(response);
    if (response?.statusCode != 200) {
      unawaited(dialog(
          success: false, message: response!.data['message'].toString()));
    }
    logWTF(response?.statusMessage);
    return response?.statusCode == 200;
  }
}
