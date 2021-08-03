import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/models/available_credits_sw.dart';
import 'package:six/app/data/models/beneficiary_list_details.dart';
import 'package:six/app/data/remote/api_service/init_api_service.dart';
import 'package:six/app/ui/components/app_snackbar.dart';

class SocialWorkerProvider {
  //Helper Function to fetch the social worker dashboard data .
  static Future<Map<String, dynamic>?> getSWDashBoardData() async {
    var response = await APIService.get(
      path: '/v1/auth/worker-dashboard-data',
    );
    if (response.statusCode == 200) {
      logI('######SWDashData########');
      logI(response.data!['data']);
      var availCredits = response.data!['data'] as Map<String, dynamic>;
      return availCredits;
    } else {
      appSnackbar(message: 'Error');
      return null;
    }
  }

  //Helper Function to fetch the social worker dashboard data .
  static Future<List<BeneficiaryListDetails>> getBeneficiaryList(
      {required String? skip, required String? limit}) async {
    var response = await APIService.get(
      path: '/v1/auth/worker-beneficiary-list/$skip/$limit',
    );
    if (response.statusCode == 200) {
      logI('######BeneficiaryList########');
      logI(response.data!['data']);
      var beneList = response.data!['data'] as List<dynamic>;
      logI(beneList);
      return List<BeneficiaryListDetails>.from(
          beneList.map<BeneficiaryListDetails>((dynamic e) =>
              BeneficiaryListDetails.fromMap(e as Map<String, dynamic>)));
    } else {
      appSnackbar(message: 'Error');
      return <BeneficiaryListDetails>[];
    }
  }

  //Helper Function to fetch the available credits of the category.
  static Future<List<AvailableCredits>> availableCreditsCategory(
      {required String? skip, required String? limit}) async {
    var response = await APIService.get(
      path: '/v1/auth/worker-list-available-credits/$skip/$limit',
    );
    if (response.statusCode == 200) {
      logI('######AvailableCreditsCateg########');
      logI(response.data!['data']);
      var availCredits = response.data!['data'] as List<dynamic>;
      logI(availCredits);
      return List<AvailableCredits>.from(availCredits.map<AvailableCredits>(
          (dynamic e) => AvailableCredits.fromMap(e as Map<String, dynamic>)));
    } else {
      appSnackbar(message: 'Error');
      return <AvailableCredits>[];
    }
  }

  //Helper Function to fetch the available vouchers of a particular vendor.
  static Future<List<BeneficiaryListDetails>> getAvailableVouchers(
      {required String? vendorId,
      required String? skip,
      required String? limit}) async {
    var response = await APIService.get(
      path: '/v1/auth/list-vendor-voucher/$vendorId/$skip/$limit',
    );
    if (response.statusCode == 200) {
      logI('######Available Vouchers########');
      logI(response.data!['data']);
      var vouchers = response.data!['data'] as List<dynamic>;
      logI(vouchers);
      return List<BeneficiaryListDetails>.from(
          vouchers.map<BeneficiaryListDetails>((dynamic e) =>
              BeneficiaryListDetails.fromMap(e as Map<String, dynamic>)));
    } else {
      appSnackbar(message: 'Error');
      return <BeneficiaryListDetails>[];
    }
  }
}
