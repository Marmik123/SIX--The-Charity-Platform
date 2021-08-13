import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/models/graph_category_data.dart';
import 'package:six/app/modules/needy_family/available_credits/controllers/available_credits_controller.dart';
import 'package:six/app/modules/needy_family/available_credits/views/available_credits_view.dart';
import 'package:six/app/modules/needy_family/profile/views/profile_view.dart';
import 'package:six/app/routes/app_pages.dart';
import 'package:six/app/ui/components/bottom_nav_bar.dart';
import 'package:six/app/ui/components/circular_progress_indicator.dart';
import 'package:six/app/ui/components/month_picker.dart';
import 'package:six/r.g.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controllers/charity_home_controller.dart';

class CharityHomeView extends GetView<CharityHomeController> {
  //final PurchaseController purCtrl = Get.put(PurchaseController());
  final List<Widget> bottomScreen = <Widget>[
    CharityHome(),
    AvailableCreditsView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          bottomNavigationBar: bottomNavBar(),
          backgroundColor: AppColors.kffffff,
          body: bottomScreen.elementAt(controller.currentIndex!.value),
        ));
  }
}

class CharityHome extends StatelessWidget {
  final CharityHomeController ctrl = Get.put(CharityHomeController());
  final AvailableCreditsController creditsCtrl =
      Get.put(AvailableCreditsController());
  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowGlow();
        return false;
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: 813.h,
                  width: 1125.w,
                  color: AppColors.kE3FCFF,
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 202.h,
                        ),
                        Image.asset(
                          R.image.asset.six_logo.assetName,
                          height: 77.h,
                          width: 170.w,
                        ),
                        SizedBox(
                          height: 98.h,
                        ),
                      ],
                    ),
                  ),
                ),
                //MONTH PICKER
                /*Obx(() => Positioned(
                      top: 337.h,
                      child: GestureDetector(
                        onTap: () {
                          monthPickerDialog(
                            context: context,
                            selectedDate: ctrl.selectedDate!,
                          ).then((value) {
                            if (value != null) {
                              ctrl.selectedDate = value;
                              var lastDay =
                                  DateTime(value.year, value.month + 1, 0);
                              logI(value);
                              logI(lastDay);
                              ctrl.assignMonth(value.month);
                            }
                            */
                /* else {
                              ctrl.selectedDate = DateTime.now();
                            }*/
                /*
                          });
                        },
                        child: monthPicker(
                          color: AppColors.kffffff,
                          borderColor: AppColors.kE3FCFF,
                          height: 80.h,

                          shadowColor: AppColors.k0A9988,
                          width: 390.w,
                          textContent: Text(
                            '${ctrl.monthName()}, ${ctrl.selectedDate!.year}',
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontSize: 40.sp,
                              fontStyle: FontStyle.normal,
                              color: AppColors.k1FAF9E,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTapArrow: () {},
                        ),
                      ),
                    )),*/
                Obx(() => Positioned(
                      top: 380.h,
                      child: GestureDetector(
                        onTap: () {
                          creditsCtrl.assignToAvailProgCredit();
                          creditsCtrl.disableLeading(false);
                          Get.toNamed<void>(Routes.AVAILABLE_CREDITS,
                              arguments: 'Charity');
                        },
                        child: Container(
                          width: 1005.w,
                          height: 220.h,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                begin: Alignment(-1, -2.8),
                                end: Alignment(1, 10),
                                colors: [AppColors.k1FAF9E, AppColors.k0087FF]),
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  'Available Credits',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontSize: 50.sp,
                                    fontStyle: FontStyle.normal,
                                    color: AppColors.kffffff,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  width: 223.w,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '\$',
                                      style: TextStyle(
                                        fontFamily: 'Gilroy',
                                        fontSize: 60.sp,
                                        fontStyle: FontStyle.normal,
                                        color: AppColors.kffffff,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      ctrl.availableCredits(),
                                      style: TextStyle(
                                        fontFamily: 'Gilroy',
                                        fontSize: 60.sp,
                                        fontStyle: FontStyle.normal,
                                        color: AppColors.kffffff,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    creditsCtrl.assignToAvailProgCredit();
                                    creditsCtrl.disableLeading(false);
                                    Get.toNamed<void>('/available-credits',
                                        arguments: 'Charity');
                                  },
                                  child: const Icon(
                                    Icons.keyboard_arrow_right_sharp,
                                    color: AppColors.kffffff,
                                    size: 25,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
                Obx(() => Positioned(
                      top: 627.h,
                      child: Container(
                        width: 1005.w,
                        height: 353.h,
                        decoration: BoxDecoration(
                          color: AppColors.kffffff,
                          borderRadius: BorderRadius.circular(50.r),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.k00474E.withOpacity(0.04),
                              blurRadius: 50.r,
                              offset: const Offset(0, 20),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Overall Donation Received :',
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize: 40.sp,
                                      fontStyle: FontStyle.normal,
                                      color: AppColors.k033660,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    '\$${ctrl.totalDonation()}',
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize: 40.sp,
                                      fontStyle: FontStyle.normal,
                                      color: AppColors.k13A89E,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total Contributors :',
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize: 40.sp,
                                      fontStyle: FontStyle.normal,
                                      color: AppColors.k033660,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    ctrl.totalContributors(),
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize: 40.sp,
                                      fontStyle: FontStyle.normal,
                                      color: AppColors.k13A89E,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Impacted Households',
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize: 40.sp,
                                      fontStyle: FontStyle.normal,
                                      color: AppColors.k033660,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    ctrl.totalFamilyCount(),
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize: 40.sp,
                                      fontStyle: FontStyle.normal,
                                      color: AppColors.k13A89E,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 222.h,
            ),
            Obx(() => TabBar(
                  controller: ctrl.tabController,
                  tabs: [
                    Tab(
                      child: Text(
                        'Credits By Program',
                        style: TextStyle(
                          color: ctrl.tabIndex!.value == 0
                              ? AppColors.k13A89E
                              : AppColors.k033660,
                          fontSize: 40.sp,
                          fontWeight: ctrl.tabIndex!.value == 0
                              ? FontWeight.w700
                              : FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Credits By Categories',
                        style: TextStyle(
                          color: ctrl.tabIndex!.value == 1
                              ? AppColors.k13A89E
                              : AppColors.k033660,
                          fontSize: 40.sp,
                          fontWeight: ctrl.tabIndex!.value == 1
                              ? FontWeight.bold
                              : FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ],
                  indicatorColor: AppColors.k13A89E,
                  indicator: UnderlineTabIndicator(
                      insets: EdgeInsets.only(left: 95.w, right: 95.w),
                      borderSide: const BorderSide(
                        color: AppColors.k13A89E,
                        width: 2,
                      )),
                  onTap: (index) {
                    ctrl.tabIndex!.value = index;
                    if (index == 1) {
                      ctrl.assignToCategoryDetails(
                          ctrl.graphDetails[ctrl.programIndex()].id.toString());
                    }
                  },
                )),
            Container(
              width: 1000.w,
              height: 1000.h,
              child: Center(
                child: TabBarView(
                  controller: ctrl.tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 211.h,
                        ),
                        Obx(() => ctrl.isLoading()
                            ? buildLoader()
                            : Container(
                                height: 710.h,
                                child: SfCartesianChart(
                                  series: <ChartSeries>[
                                    ColumnSeries<GraphCategoryData, String>(
                                        dataSource: ctrl.graphDetails(),
                                        xValueMapper: (data, _) => data.name,
                                        yValueMapper: (data, _) => data.value,
                                        pointColorMapper: (data, _) =>
                                            data.barColor,
                                        width: 0.15,
                                        color: ctrl.barColor,
                                        dataLabelSettings: DataLabelSettings(
                                          // Renders the data label
                                          isVisible: true,
                                          borderRadius: 25.r,
                                          color: AppColors.kffffff,
                                          //useSeriesColor: true,
                                          borderColor: AppColors.kE2E2E2,
                                          borderWidth: 1.w,
                                          labelAlignment:
                                              ChartDataLabelAlignment.outer,
                                          textStyle: TextStyle(
                                            color: AppColors.k033660,
                                            fontSize: 35.sp,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Gilroy',
                                          ),
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                        )),
                                  ],
                                  primaryYAxis: NumericAxis(
                                      majorTickLines: const MajorTickLines(
                                        size: 1,
                                        width: 0,
                                        color: Colors.transparent,
                                      ),
                                      edgeLabelPlacement:
                                          EdgeLabelPlacement.hide,
                                      numberFormat:
                                          NumberFormat.compactCurrency(
                                        decimalDigits: 0,
                                        symbol: '\$',
                                        locale: 'en_US',
                                      ),
                                      labelAlignment: LabelAlignment.end,
                                      minimum: 0,
                                      //maximum: 5000,
                                      //interval: 1000,
                                      axisLine: AxisLine(
                                        color: AppColors.kDCDCDC,
                                        width: 2.w,
                                      ),
                                      majorGridLines: const MajorGridLines(
                                        width: 1,
                                        color: AppColors.kffffff,
                                      ),
                                      labelStyle: TextStyle(
                                          color: AppColors.k585858,
                                          fontFamily: 'Gilroy',
                                          fontSize: 30.sp,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal)),
                                  primaryXAxis: CategoryAxis(
                                    majorTickLines: const MajorTickLines(
                                      size: 1,
                                      width: 0,
                                      color: Colors.transparent,
                                    ),
                                    axisLine: AxisLine(
                                      color: AppColors.kDCDCDC,
                                      width: 2.w,
                                    ),
                                    //maximumLabelWidth: 200.w,
                                    labelIntersectAction:
                                        AxisLabelIntersectAction.wrap,
                                    labelStyle: TextStyle(
                                        color: AppColors.k033660,
                                        fontFamily: 'Gilroy',
                                        fontSize: 30.sp,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.normal),
                                    majorGridLines: const MajorGridLines(
                                        width: 0,
                                        color: AppColors.kD1D1D1,
                                        dashArray: <double>[12, 2]),
                                    maximumLabels: 3,
                                  ),
                                  enableAxisAnimation: true,
                                  plotAreaBorderColor: AppColors.kffffff,
                                ),
                              )),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 60.h,
                        ),
                        Obx(() => PopupMenuButton<int>(
                              offset: const Offset(-2, 1),
                              elevation: 10,
                              onSelected: (widget) {
                                // ctrl.popUpItem(widget);
                                ctrl.programIndex(widget);
                                logI(ctrl.programIndex);
                                ctrl.programId(ctrl
                                    .graphDetails[ctrl.programIndex()].id
                                    .toString());
                                ctrl.assignToCategoryDetails(ctrl
                                    .graphDetails[ctrl.programIndex()].id
                                    .toString());
                              },
                              shape: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2.w,
                                    color: AppColors.kD8FCFF,
                                  ),
                                  borderRadius: BorderRadius.circular(30.r)),
                              color: AppColors.kF2FEFF,
                              itemBuilder: (context) => List.generate(
                                ctrl.graphDetails().length,
                                (index) => PopupMenuItem<int>(
                                  /*value: monthPicker(
                                    color: AppColors.kF2FEFF,
                                    borderColor: AppColors.kD8FCFF,

                                    height: 90.h,
                                    shadowColor: AppColors.kffffff,
                                    textContent: Text(
                                      ctrl
                                          .graphDetails()[index]
                                          .title
                                          .toString(),
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
                                  ),*/
                                  value: index,
                                  child: Container(
                                    width: 525.w,
                                    child: Text(
                                      ctrl
                                          .graphDetails()[index]
                                          .name
                                          .toString(),
//'Support Beneficiary Fund',
                                      style: TextStyle(
                                        fontFamily: 'Gilroy',
                                        fontSize: 35.sp,
                                        fontStyle: FontStyle.normal,
                                        color: AppColors.k13A89E,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              child: monthPicker(
                                color: AppColors.kF2FEFF,
                                borderColor: AppColors.kD8FCFF,
                                height: 90.h,
                                shadowColor: AppColors.kffffff,
                                textContent: Text(
                                  ctrl
                                      .graphDetails()[ctrl.programIndex()]
                                      .name
                                      .toString(),
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
                            )),
                        SizedBox(
                          height: 76.h,
                        ),
                        Obx(() => ctrl.isLoading()
                            ? buildLoader()
                            : Container(
                                height: 710.h,
                                child: SfCartesianChart(
                                  series: <ChartSeries>[
                                    ColumnSeries<GraphCategoryData, String>(
                                      dataSource: ctrl.graphCategoryDetails(),
                                      xValueMapper: (data, _) => data.name,
                                      yValueMapper: (data, _) => data.value,
                                      pointColorMapper: (data, _) =>
                                          data.barColor,
                                      // Sets the corner radius
                                      width: 0.15,
                                      dataLabelSettings: DataLabelSettings(
                                        // Renders the data label
                                        isVisible: true,
                                        borderRadius: 25.r,
                                        color: AppColors.kffffff,
                                        //useSeriesColor: true,
                                        borderColor: AppColors.kE2E2E2,
                                        borderWidth: 1.w,
                                        labelAlignment:
                                            ChartDataLabelAlignment.outer,
                                        textStyle: TextStyle(
                                          color: AppColors.k033660,
                                          fontSize: 35.sp,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Gilroy',
                                        ),
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                    ),
                                  ],
                                  primaryYAxis: NumericAxis(
                                      majorTickLines: const MajorTickLines(
                                        size: 1,
                                        width: 0,
                                        color: Colors.transparent,
                                      ),
                                      edgeLabelPlacement:
                                          EdgeLabelPlacement.hide,
                                      numberFormat:
                                          NumberFormat.compactCurrency(
                                        decimalDigits: 0,
                                        symbol: '\$',
                                        locale: 'en_US',
                                      ),
                                      labelAlignment: LabelAlignment.end,
                                      minimum: 0,
                                      /*
                                maximum: 35000,
                                interval: 5000,*/
                                      axisLine: AxisLine(
                                        color: AppColors.kDCDCDC,
                                        width: 2.w,
                                      ),
                                      majorGridLines: const MajorGridLines(
                                        width: 0,
                                        color: AppColors.kffffff,
                                      ),
                                      labelStyle: TextStyle(
                                          color: AppColors.k585858,
                                          fontFamily: 'Gilroy',
                                          fontSize: 30.sp,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal)),
                                  primaryXAxis: CategoryAxis(
                                    labelIntersectAction:
                                        AxisLabelIntersectAction.wrap,
                                    majorTickLines: const MajorTickLines(
                                      size: 5,
                                      width: 0,
                                      color: Colors.transparent,
                                    ),
                                    axisLine: AxisLine(
                                      color: AppColors.kDCDCDC,
                                      width: 2.w,
                                    ),
                                    labelStyle: TextStyle(
                                      color: AppColors.k033660,
                                      fontFamily: 'Gilroy',
                                      fontSize: 30.sp,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    majorGridLines: const MajorGridLines(
                                      width: 0,
                                      color: AppColors.kD1D1D1,
                                      dashArray: <double>[2, 2],
                                    ),
                                  ),
                                  enableAxisAnimation: true,
                                  plotAreaBorderColor: AppColors.kffffff,
                                ),
                              )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
