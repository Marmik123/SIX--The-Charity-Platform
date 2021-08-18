import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:pedantic/pedantic.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/local/user_provider.dart';
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
      return <String, dynamic>{};
    }
  }

  //Helper Function to fetch the social worker history dashboard data .
  static Future<Map<String, dynamic>?> getSWHistoryData() async {
    var response = await APIService.get(
      path: '/v1/auth/worker-history-dashboard-data',
    );
    if (response?.statusCode == 200) {
      logI('######SWHistoryDashData########');
      logI(response?.data!['data']);
      var availCredits = response?.data!['data'] as Map<String, dynamic>;
      return availCredits;
    } else {
      appSnackbar(message: 'Error');
      return null;
    }
  }

  //Helper Function to fetch the beneficiary dashboard data .
  static Future<Map<String, dynamic>> getBeneDashBoardData(
      String beneficiaryId) async {
    var response = await APIService.get(
      path: '/v1/auth/beneficiary-dashboard-data/$beneficiaryId',
    );
    if (response?.statusCode == 200) {
      logI('######Beneficiary Dashboard########');
      logI(response?.data!['data']);
      var availCredits = response?.data!['data'] as Map<String, dynamic>;
      return availCredits;
    } else {
      appSnackbar(message: 'Error');
      return <String, dynamic>{};
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

  //Helper Function to get the connected organization of beneficiary.
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

  //Helper Function to get the assigned vouchers to beneficiary.
  static Future<List<AvailableVouchers>> getAssignedVouchers(
      {required String? needyFamilyId,
      required String? skip,
      required String? limit}) async {
    var response = await APIService.get(
      path:
          '/v1/auth/beneficiary-assigned-voucher-list/$needyFamilyId/$skip/$limit',
    );
    if (response?.statusCode == 200) {
      logI('######Assigned Vouchers########');
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

  static Future<List<AvailableVouchers>> getFilterAssignedVouchers(
      {required String? needyFamilyId,
      required String? skip,
      required String? type,
      required String? limit}) async {
    var response = await APIService.get(
      path:
          '/v1/auth/beneficiary-filter-assigned-voucher-list/$needyFamilyId/$type/$skip/$limit',
    );
    if (response?.statusCode == 200) {
      logI('######Assigned Vouchers########');
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

  //Helper function to fetch the history of vouchers for a social worker.
  static Future<List<AvailableVouchers>> getHistoryVouchers(
      {required String? type,
      required String? skip,
      required String? limit}) async {
    var response = await APIService.get(
      path: '/v1/auth/worker-assigned-voucher-list/$type/$skip/$limit',
    );
    if (response?.statusCode == 200) {
      logI('######History of Assigned Vouchers########');
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

  //Helper Function to fetch history of vouchers by month filter.
  static Future<List<AvailableVouchers>> getVouchersHistoryByMonth(
      {required String? type,
      required String? skip,
      required String? startDate,
      required String? endDate,
      required String? limit}) async {
    var response = await APIService.get(
      path:
          '/v1/auth/worker-assigned-voucher-filter-list/$type/$startDate/$endDate/$skip/$limit',
    );
    if (response?.statusCode == 200) {
      logI('######History By Month Filter########');
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

  //Helper Function to assign a purchased voucher to  selected beneficiary.
  static Future<bool> assignVoucher({
    required List vouchers,
  }) async {
    var response = await APIService.post(
        path: '/v1/auth/assign-beneficiery',
        encrypt: true,
        data: <String, dynamic>{
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

  //Helper Function to upload the profile picture of the user.
  static Future<String> uploadProfileImg(
      {required String filename, dynamic finalImage}) async {
    var url = 'https://six.api.dharmatech.in/file/upload/user/profile';
    var uri = Uri.parse(url);
    var request = http.MultipartRequest('POST', uri);

    var multipartFile = http.MultipartFile.fromBytes(
        'profile', finalImage as List<int>,
        filename: '$filename',
        contentType: MediaType('application', 'octet-stream'));
    request.files.add(multipartFile);
    var result = await http.Response.fromStream(await request.send());
    logI('Result: ${result.statusCode}');
    logI(result.body);
    dynamic json = jsonDecode(result.body);
    logW(json['file']);
    if (result.statusCode != 200) {
      logW('FILE UPLOAD FAILED');
      return 'false';
    } else {
      logW('FILE UPLOAD SUCCESS');
      return json['file'] as String;
    }
  }

  //Helper function to edit the profile picture of the user.
  static Future<bool> editProfilePicture({
    required String profileImg,
  }) async {
    var response = await APIService.put(
        path: '/v1/auth/edit-user',
        encrypt: true,
        data: <String, dynamic>{
          'profile_image': profileImg,
        });
    logI(response);
    if (response?.statusCode != 200) {
      unawaited(dialog(
          success: false, message: response!.data['message'].toString()));
    } else {
      UserProvider.currentUser?.profileImageUrl =
          response?.data['data']['profile_image_url'];
      logWTF(response?.statusMessage);
    }
    return response?.statusCode == 200;
  }
}
