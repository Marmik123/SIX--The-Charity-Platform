import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/models/beneficiary_list_details.dart';
import 'package:six/app/data/remote/provider/social_worker.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialHomeController extends GetxController {
  //TODO: Implement SocialHomeController
  RxInt? currentIndex = 0.obs;
  RxInt? tabIndex = 0.obs;
  Map<String, dynamic>? dashboardData;
  Map<String, dynamic>? address;
  RxBool paid = false.obs;
  String skip = '0';
  String limit = '1000';
  RxBool isLoading = false.obs;
  RxInt? monthNum = 1.obs;
  RxString monthName = 'Sept'.obs;
  DateTime selectedDate = DateTime.now();
  RxList<BeneficiaryListDetails> beneficiaryList =
      <BeneficiaryListDetails>[].obs;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    assignDashboardData();
    assignBeneficiaryList();
  }

  Future<void> launchURL() async {
    final params = Uri(
      scheme: 'mailto',
      path: 'raymondwong@gmail.com',
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
    dashboardData = await SocialWorkerProvider.getSWDashBoardData();
    logI(dashboardData);
    isLoading(false);
    logW(dashboardData?['availableCreditData'][0]['total'] ?? '0');
  }

  Future<void> assignBeneficiaryList() async {
    isLoading(true);
    beneficiaryList(await SocialWorkerProvider.getBeneficiaryList(
      skip: skip,
      limit: limit,
    ));
    // logI(beneficiaryList());
    isLoading(false);
  }

  void assignMonth(int month) {
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
  }
}
