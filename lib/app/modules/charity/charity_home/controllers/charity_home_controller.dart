import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/models/graph_category_data.dart';
import 'package:six/app/data/models/graph_data.dart';
import 'package:six/app/data/provider/home_graph_provider.dart';
import 'package:six/app/ui/components/month_picker.dart';

class CharityHomeController extends GetxController {
  //TODO: Implement CharityHomeController
  RxInt? tabIndex = 0.obs;
  RxInt? currentIndex = 0.obs;
  RxInt? monthNum = 1.obs;
  RxInt programIndex = 0.obs;
  RxString monthName = 'Sept'.obs;
  RxString totalDonation = 'Sept'.obs;
  RxString totalContributors = 'Sept'.obs;
  RxString totalFamilyCount = 'Sept'.obs;
  RxString availableCredits = 'Sept'.obs;
  DateTime selectedDate = DateTime.now();
  RxList<GraphData> graphDetails = <GraphData>[].obs;
  RxList<GraphCategoryData> graphCategoryDetails = <GraphCategoryData>[].obs;
  Map<String, dynamic>? dashboardData;
  RxBool isLoading = false.obs;
  TabController tabController = TabController(
    length: 2,
    vsync: NavigatorState(),
  );
  Rx<Widget> popUpItem = monthPicker(
    color: AppColors.kF2FEFF,
    borderColor: AppColors.kD8FCFF,
    height: 90.h,
    whichScreen: '',
    shadowColor: AppColors.kffffff,
    textContent: Text(
      'Support Beneficiary Fund',
      style: TextStyle(
        fontFamily: 'Gilroy',
        fontSize: 35.sp,
        fontStyle: FontStyle.normal,
        color: AppColors.k13A89E,
        fontWeight: FontWeight.w500,
      ),
    ),
    width: 627.w,
    onTapArrow: () {},
  ).obs;
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

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    isLoading(true);
    assignToGraphDetails();
    assignDashboardData();
  }

  Future<void> assignToGraphDetails() async {
    graphDetails(await GraphDataProvider.getGraphProgramData());
    isLoading(false);
  }

  Future<void> assignToCategoryDetails(String programId) async {
    graphCategoryDetails(
        await GraphDataProvider.getGraphCategoryData(programId));
    isLoading(false);
  }

  Future<void> assignDashboardData() async {
    dashboardData = await GraphDataProvider.getDashboardData();
    logI('@@@$dashboardData');
    availableCredits(dashboardData?['availableCreditData'].toString() ?? '');
    totalDonation(dashboardData?['totalDonation'].toString() ?? '');
    totalContributors(dashboardData?['totalContributors'].toString() ?? '');
    totalFamilyCount(dashboardData?['totalFamilyCount'].toString() ?? '');
  }
}
/*

PopupMenuItem<Widget>(
value: monthPicker(
color: AppColors.kF2FEFF,
borderColor: AppColors.kD8FCFF,
whichScreen: '',
height: 90.h,
shadowColor: AppColors.kffffff,
textContent: Text(
'Support Beneficiary Fund',
style: TextStyle(
fontFamily: 'Gilroy',
fontSize: 35.sp,
fontStyle: FontStyle.normal,
color: AppColors.k13A89E,
fontWeight: FontWeight.w500,
),
),
width: 627.w,
onTapArrow: () {},
),
child: Container(
width: 525.w,
child: Text(
'Support Beneficiary Fund',
style: TextStyle(
fontFamily: 'Gilroy',
fontSize: 35.sp,
fontStyle: FontStyle.normal,
color: AppColors.k13A89E,
fontWeight: FontWeight.w500,
),
),
),
),*/
