import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/local/user_provider.dart';
import 'package:six/app/data/models/graph_category_data.dart';
import 'package:six/app/data/remote/provider/home_graph_provider.dart';

class CharityHomeController extends GetxController {
  //TODO: Implement CharityHomeController
  RxInt? tabIndex = 0.obs;
  RxInt? currentIndex = 0.obs;
  RxInt? monthNum = 1.obs;
  RxInt programIndex = 0.obs;
  RxString monthName = 'Sept'.obs;
  RxString totalDonation = ''.obs;
  RxString totalContributors = ''.obs;
  RxString totalFamilyCount = ''.obs;
  RxString availableCredits = ''.obs;
  RxString programId = ''.obs;
  DateTime? selectedDate = DateTime.now();
  RxList<GraphCategoryData> graphDetails = <GraphCategoryData>[].obs;
  RxList<GraphCategoryData> graphCategoryDetails = <GraphCategoryData>[].obs;
  Map<String, dynamic>? dashboardData;
  RxBool isLoading = false.obs;
  Color barColor = Colors.blueGrey;
  TabController tabController = TabController(
    length: 2,
    vsync: NavigatorState(),
  );

  RxString programType = 'Support Beneficiary Fund'.obs;
  List<PopupMenuEntry<Widget>> popUpWidgets = <PopupMenuEntry<Widget>>[];

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

  @override
  void onInit() {
    super.onInit();
    isLoading(true);
    if (UserProvider.role == 'charity') {
      assignToGraphDetails();
      assignDashboardData();
    } else {
      logI('Not Charity');
    }
  }

  //Credits by Program Graph
  Future<void> assignToGraphDetails() async {
    graphDetails(await GraphDataProvider.getGraphProgramData());
    isLoading(false);
  }

  //Credits by Category Graph
  Future<void> assignToCategoryDetails(String programId) async {
    graphCategoryDetails(
        await GraphDataProvider.getGraphCategoryData(programId));
    /*graphCategoryDetails.forEach((element) {
      element.copyWith(barColor: AppColors.kFFF5F1);
    });*/
    isLoading(false);
  }

  //Charity Home Dashboard Data
  Future<void> assignDashboardData() async {
    dashboardData = await GraphDataProvider.getDashboardData();
    logI('@@@$dashboardData');
    availableCredits(dashboardData?['availableCreditData'].toString() ?? '');
    totalDonation(dashboardData?['totalDonation'].toString() ?? '');
    totalContributors(dashboardData?['totalContributors'].toString() ?? '');
    totalFamilyCount(dashboardData?['totalFamilyCount'].toString() ?? '');
  }
}
