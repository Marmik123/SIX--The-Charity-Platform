import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/models/available_vouchers.dart';
import 'package:six/app/data/remote/provider/social_worker.dart';
import 'package:six/app/utils/get_month_name.dart';

class VendorDetailsController extends GetxController {
  TabController? tabController;
  RxInt tabIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxInt skip = 0.obs;
  RxInt limit = 1000.obs;
  RxString vendorId = ''.obs;
  ScrollController scrollController = ScrollController();
  RxList<AvailableVouchers> availableVouchers = <AvailableVouchers>[].obs;
  List<String> text = [
    '',
    '',
  ];
  List<String> textNewLine = [
    'About Us',
    'Available Vouchers ',
  ];

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      logW(Get.arguments);
      vendorId(Get.arguments as String);
      assignAvailVouchers();
    }
    tabController = TabController(
      length: 2,
      vsync: NavigatorState(),
    );
  }

  @override
  void onClose() {
    tabController!.dispose();
  }

  Future<void> assignAvailVouchers() async {
    availableVouchers(await SocialWorkerProvider.getAvailableVouchers(
      vendorId: vendorId(),
      skip: skip().toString(),
      limit: limit().toString(),
    ));
  }

  String? getDate(int index){
    var formattedDate = DateTime
        .parse(availableVouchers[index]
        .endDate
        .toString());
    var date =
        formattedDate.day;
    var year =
        formattedDate.year;
    var month = assignMonth(
        formattedDate.month);
    var finalDate =
        '$date,$month $year';
    return finalDate;
  }
}
