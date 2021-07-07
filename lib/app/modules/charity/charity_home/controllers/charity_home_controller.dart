import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/ui/components/month_picker.dart';
import 'package:six/graph_data.dart';

class CharityHomeController extends GetxController {
  //TODO: Implement CharityHomeController
  RxInt? tabIndex = 0.obs;
  RxInt? currentIndex = 0.obs;
  RxInt? monthNum = 1.obs;
  RxString monthName = 'Sept'.obs;
  late DateTime? selectedDate = DateTime.now();

  Rx<Widget> popUpItem = monthPicker(
    color: AppColors.kF2FEFF,
    borderColor: AppColors.kD8FCFF,
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
  ).obs;
  RxString programType = 'Support Beneficiary Fund'.obs;

  List<PopupMenuEntry<Widget>> popUpWidgets = [
    PopupMenuItem<Widget>(
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
      value: monthPicker(
        color: AppColors.kF2FEFF,
        borderColor: AppColors.kD8FCFF,
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
    ),
    PopupMenuItem<Widget>(
      child: Container(
        width: 525.w,
        child: Text(
          'Covid19 Relief Fund',
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 35.sp,
            fontStyle: FontStyle.normal,
            color: AppColors.k13A89E,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      value: monthPicker(
        color: AppColors.kF2FEFF,
        borderColor: AppColors.kD8FCFF,
        height: 90.h,
        shadowColor: AppColors.kffffff,
        textContent: Text(
          'Covid19 Relief Fund',
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
    ),
    PopupMenuItem<Widget>(
      child: Container(
        width: 525.w,
        child: Text(
          'Serving the Elderly',
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 35.sp,
            fontStyle: FontStyle.normal,
            color: AppColors.k13A89E,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      value: monthPicker(
        color: AppColors.kF2FEFF,
        borderColor: AppColors.kD8FCFF,
        height: 90.h,
        shadowColor: AppColors.kffffff,
        textContent: Text(
          'Serving the Elderly',
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
    ),
  ];
  final List<GraphData> chartData = [
    GraphData(
      yLabel: '\$60k',
      xLabel: 'Support\nBeneficiary Fund',
      value: 60000,
      columnColor: AppColors.kFF9871,
    ),
    GraphData(
      yLabel: '\$20k',
      xLabel: 'Covid19\nRelief Fund',
      value: 20000,
      columnColor: AppColors.kFF007A,
    ),
    GraphData(
      yLabel: '\$15k',
      xLabel: 'Serving\nthe Elderly',
      value: 15000,
      columnColor: AppColors.kFFD85E,
    ),
  ];
  final List<GraphData> secondChart = [
    GraphData(
      yLabel: '\$60k',
      xLabel: 'Food &\nbeverage',
      value: 15000,
      columnColor: AppColors.kFF9871,
    ),
    GraphData(
      yLabel: '\$20k',
      xLabel: 'Delivery',
      value: 5000,
      columnColor: AppColors.kFF007A,
    ),
    GraphData(
      yLabel: '\$15k',
      xLabel: 'Supermarket',
      value: 30000,
      columnColor: AppColors.k13A89E,
    ),
    GraphData(
      yLabel: '\$15k',
      xLabel: 'Transportation',
      value: 10000,
      columnColor: AppColors.kFFD85E,
    ),
  ];

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
  }
}
