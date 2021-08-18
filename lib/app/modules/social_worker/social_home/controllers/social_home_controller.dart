import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/local/note_details_helper.dart';
import 'package:six/app/data/local/user_provider.dart';
import 'package:six/app/data/models/available_vouchers.dart';
import 'package:six/app/data/models/user_entity.dart';
import 'package:six/app/data/remote/provider/social_worker.dart';
import 'package:six/app/utils/get_month_name.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialHomeController extends GetxController {
  //TODO: Implement SocialHomeController
  RxInt? currentIndex = 0.obs;
  RxInt? beneIndex = 0.obs;
  RxInt? tabIndex = 0.obs;
  RxInt availableCredits = 0.obs;
  RxInt beneficiaryCount = 0.obs;
  RxMap<String, dynamic>? dashboardData = <String, dynamic>{}.obs;
  Map<String, dynamic>? historyDashData;
  RxList<Map<String, dynamic>?> decodedAddress = <Map<String, dynamic>?>[].obs;
  RxBool paid = false.obs;
  RxInt skip = 0.obs;
  RxInt limit = 1000.obs;
  RxBool isLoading = false.obs;
  RxBool vouchersLoading = false.obs;
  RxBool isAddressNull = false.obs;
  RxInt? monthNum = 1.obs;
  RxString monthName = 'Sept'.obs;
  DateTime selectedDate = DateTime.now();
  RxList<UserEntity> beneficiaryList = <UserEntity>[].obs;
  ScrollController scrollController = ScrollController();
  RxList<AvailableVouchers> historyVouchers = <AvailableVouchers>[].obs;
  // final NoteDetailsController notesCtrl = Get.put(NoteDetailsController());
  final dbHelper = DatabaseHelper.instance;
  @override
  void onInit() {
    super.onInit();
    if (UserProvider.role == 'social_worker') {
      assignDashboardData();
      assignHistoryDashData();
      assignBeneficiaryList();
    }
    logI(UserProvider.role);
  }

  void assignAddress(Map<String, dynamic>? address) {
    decodedAddress.add(address);
    logI('finalDecodedAddress$decodedAddress');
  }

  String returnAddress(int index) {
    logI('!!##$decodedAddress');
    logI('!!##${decodedAddress[index]}');
    if (decodedAddress[index]!.isNotEmpty) {
      return '${decodedAddress[index]!['floor']['value']},${decodedAddress[index]!['building']['value']},${decodedAddress[index]!['street']['value']},\n${decodedAddress[index]!['block']['value']},${decodedAddress[index]!['country']['desc']},${decodedAddress[index]!['postal']['value']}.';
    } else
      return '';
  }

  Future<void> launchURL(String mailId) async {
    final params = Uri(
      scheme: 'mailto',
      path: mailId,
    );
    var url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  Future<void> assignDashboardData() async {
    isLoading(true);
    dashboardData!(await SocialWorkerProvider.getSWDashBoardData());
    availableCredits(dashboardData?['availableCreditData'] as int);
    beneficiaryCount(dashboardData?['beneficiaryCount'] as int);
    logI(dashboardData);
    await assignBeneficiaryList();
    isLoading(false);
    // logW(dashboardData?['availableCreditData'][0]['total'] ?? '0');
  }

  Future<void> assignHistoryDashData() async {
    isLoading(true);
    historyDashData = await SocialWorkerProvider.getSWHistoryData();
    logI(historyDashData);
    isLoading(false);
  }

  Future<void> getHistoryOfAssignVoucher(String type) async {
    vouchersLoading(true);
    historyVouchers(await SocialWorkerProvider.getHistoryVouchers(
      type: type,
      skip: skip().toString(),
      limit: limit().toString(),
    ));
    vouchersLoading(false);
  }

  Future<void> getHistoryByMonthFilter(
      String type, String startDate, String endDate) async {
    vouchersLoading(true);
    historyVouchers(
      await SocialWorkerProvider.getVouchersHistoryByMonth(
        type: type,
        startDate: startDate,
        endDate: endDate,
        skip: skip().toString(),
        limit: limit().toString(),
      ),
    );
    vouchersLoading(false);
  }

  String? getDate(int index) {
    var formattedDate =
        DateTime.parse(historyVouchers[index].endDate.toString());
    var date = formattedDate.day;
    var year = formattedDate.year;
    var month = assignMonth(formattedDate.month);
    var finalDate = '$date,$month $year';
    return finalDate;
  }

  Future<void> assignBeneficiaryList() async {
    isLoading(true);
    beneficiaryList(await SocialWorkerProvider.getBeneficiaryList(
      skip: skip().toString(),
      limit: limit().toString(),
    ));
    // logI(beneficiaryList());
    isLoading(false);
  }

  bool checkIsExpired(int index) {
    var isAfter = DateTime.now().compareTo(historyVouchers[index].endDate!);
    if (isAfter > 0) {
      return true;
    } else {
      return false;
    }
  }
}
