import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/local/user_provider.dart';
import 'package:six/app/data/models/available_vouchers.dart';
import 'package:six/app/data/remote/provider/vendor_provider.dart';
import 'package:six/app/utils/get_month_name.dart';

class VendorHomeController extends GetxController {
  RxInt? currentIndex = 0.obs;
  RxInt? monthNum = 1.obs;
  RxBool isLoading = false.obs;
  RxBool trLoading = false.obs;
  // RxString monthName = 'Sept'.obs;
  RxString voucherId = ''.obs;
  ScrollController scrollController = ScrollController();
  Map<String, dynamic>? dashboardData;
  RxList<AvailableVouchers> transactions = <AvailableVouchers>[].obs;

  DateTime selectedDate = DateTime.now();
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    if (UserProvider.role == 'vendor') {
      assignDashboardData();
    }
  }

  //Vendor Home Dashboard Data
  Future<void> assignDashboardData() async {
    isLoading(true);
    dashboardData = await VendorProvider.getDashboardData();
    await getTransactionList();
    logI('@@@$dashboardData');
    isLoading(false);
  }

  //Formatted Date
  String? getDate(int index) {
    var formattedDate = DateTime.parse(transactions[index].endDate.toString());
    var date = formattedDate.day;
    var year = formattedDate.year;
    var month = assignMonth(formattedDate.month);
    var finalDate = '$date,$month $year';
    return finalDate;
  }

  //Formatted Time
  String? getTime(int index) {
    var formattedDate = DateTime.parse(transactions[index].endDate.toString());
    var hour = formattedDate.hour;
    var minute = formattedDate.minute;
    voucherId(transactions[index].voucherId);
    logI(voucherId);
    if (hour > 12) {}
    var finalTime =
        ' ${hour < 10 ? '0' '$hour' : formattedDate.hour} : ${minute < 10 ? '$minute' '0' : formattedDate.minute} ${hour < 12 ? 'AM' : 'PM'}';
    return finalTime;
  }

  //Get Transaction List
  Future<void> getTransactionList() async {
    trLoading(true);
    transactions(await VendorProvider.getVoucherList(
      skip: '0',
      limit: '1000',
    ));
    trLoading(false);
  }

  /*void assignMonth(int month) {
    switch (month) {
      case 1:
        monthName('Jan');
        break;
      case 2:
        monthName('Feb');
        break;
      case 3:
        monthName('March');
        break;
      case 4:
        monthName('April');
        break;
      case 5:
        monthName('May');
        break;
      case 6:
        monthName('June');
        break;
      case 7:
        monthName('July');
        break;
      case 8:
        monthName('Aug');
        break;
      case 9:
        monthName('Sept');
        break;
      case 10:
        monthName('Oct');
        break;
      case 11:
        monthName('Nov');
        break;
      case 12:
        monthName('Dec');
        break;
    }
  }*/
}
