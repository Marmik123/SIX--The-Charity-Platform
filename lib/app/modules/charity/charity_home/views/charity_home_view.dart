import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/modules/needy_family/available_credits/views/available_credits_view.dart';
import 'package:six/app/ui/components/bottom_nav_bar.dart';
import 'package:six/app/ui/components/curved_container.dart';
import 'package:six/app/ui/components/month_picker.dart';
import 'package:six/graph_data.dart';
import 'package:six/r.g.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controllers/charity_home_controller.dart';

class CharityHomeView extends GetView<CharityHomeController> {
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
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          bottomNavigationBar: bottomNavBar(
            vendorHome: false,
            fromVoucherScreen: false,
          ),
          backgroundColor: AppColors.kffffff,
          body: Obx(() => Column(
                children: [
                  Stack(
                    overflow: Overflow.visible,
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
                                height: 162.h,
                              ),
                              Image.asset(
                                R.image.asset.six_logo.assetName,
                                height: 77.h,
                                width: 170.w,
                              ),
                              SizedBox(
                                height: 98.h,
                              ),
                              monthPicker(
                                color: AppColors.kffffff,
                                borderColor: AppColors.kE3FCFF,
                                height: 80.h,
                                shadowColor: AppColors.k0A9988,
                                width: 390.w,
                                textContent: Text(
                                  'Sept, ${DateTime.now().year}',
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
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 380.h,
                        child: GestureDetector(
                          onTap: () {
                            Get.to<void>(() =>
                                AvailableCreditsView(whichRole: 'Charity'));
                          },
                          child: Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: AppColors.k000000.withOpacity(0.25),
                                  blurRadius: 4.r,
                                  spreadRadius: -32.r,
                                  offset: Offset(0, 40.h))
                            ], borderRadius: BorderRadius.circular(10.r)),
                            child: CustomPaint(
                                child: Container(
                                  width: 1005.w,
                                  height: 220.h,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                              '280',
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
                                            Get.toNamed<void>(
                                                '/available-credits');
                                          },
                                          child: Icon(
                                            Icons.keyboard_arrow_right_sharp,
                                            color: AppColors.kffffff,
                                            size: 25,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                size: Size(
                                    1005.w,
                                    (1005.w * 0.21890547263681592)
                                        .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                painter: CurvedContainer()),
                          ),
                        ),
                      ),
                      Positioned(
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
                                offset: Offset(0, 20),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20),
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
                                      '\$150,000',
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
                                      '120',
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
                                      '745',
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
                      )
                    ],
                  ),
                  SizedBox(
                    height: 222.h,
                  ),
                  TabBar(
                    tabs: [
                      Tab(
                        child: Text(
                          'Credits By Program',
                          style: TextStyle(
                            color: controller.tabIndex!.value == 0
                                ? AppColors.k13A89E
                                : AppColors.k033660,
                            fontSize: 40.sp,
                            fontWeight: controller.tabIndex!.value == 0
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
                            color: controller.tabIndex!.value == 1
                                ? AppColors.k13A89E
                                : AppColors.k033660,
                            fontSize: 40.sp,
                            fontWeight: controller.tabIndex!.value == 1
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
                        borderSide: BorderSide(
                          color: AppColors.k13A89E,
                          width: 2,
                        )),
                    onTap: (index) {
                      controller.tabIndex!.value = index;
                    },
                  ),
                  Container(
                    width: 1000.w,
                    height: 1000.h,
                    child: Center(
                      child: TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 211.h,
                                ),
                                Container(
                                    height: 710.h,
                                    child: SfCartesianChart(
                                      series: <ChartSeries>[
                                        ColumnSeries<GraphData, String>(
                                            dataSource: chartData,
                                            xValueMapper: (GraphData data, _) =>
                                                data.xLabel,
                                            yValueMapper:
                                                (GraphData data, String) =>
                                                    data.value,
                                            pointColorMapper:
                                                (GraphData data, _) =>
                                                    data.columnColor,
                                            // Sets the corner radius
                                            width: 0.15,
                                            dataLabelSettings:
                                                DataLabelSettings(
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
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15),
                                            )),
                                      ],
                                      primaryYAxis: NumericAxis(
                                          majorTickLines: MajorTickLines(
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
                                          maximum: 70000,
                                          interval: 10000,
                                          axisLine: AxisLine(
                                            color: AppColors.kDCDCDC,
                                            width: 2.w,
                                          ),
                                          majorGridLines: MajorGridLines(
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
                                        majorTickLines: MajorTickLines(
                                          size: 1,
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
                                            fontWeight: FontWeight.normal),
                                        majorGridLines: MajorGridLines(
                                            width: 0,
                                            color: AppColors.kD1D1D1,
                                            dashArray: <double>[12, 2]),
                                        maximumLabels: 3,
                                      ),
                                      enableAxisAnimation: true,
                                      plotAreaBorderColor: AppColors.kffffff,
                                    )),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 60.h,
                                ),
                                monthPicker(
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
                                SizedBox(
                                  height: 76.h,
                                ),
                                Container(
                                    height: 710.h,
                                    child: SfCartesianChart(
                                      series: <ChartSeries>[
                                        ColumnSeries<GraphData, String>(
                                            dataSource: secondChart,
                                            xValueMapper: (GraphData data, _) =>
                                                data.xLabel,
                                            yValueMapper:
                                                (GraphData data, String) =>
                                                    data.value,
                                            pointColorMapper:
                                                (GraphData data, _) =>
                                                    data.columnColor,
                                            // Sets the corner radius
                                            width: 0.15,
                                            dataLabelSettings:
                                                DataLabelSettings(
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
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15),
                                            )),
                                      ],
                                      primaryYAxis: NumericAxis(
                                          majorTickLines: MajorTickLines(
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
                                          maximum: 35000,
                                          interval: 5000,
                                          axisLine: AxisLine(
                                            color: AppColors.kDCDCDC,
                                            width: 2.w,
                                          ),
                                          majorGridLines: MajorGridLines(
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
                                        majorTickLines: MajorTickLines(
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
                                        majorGridLines: MajorGridLines(
                                          width: 0,
                                          color: AppColors.kD1D1D1,
                                          dashArray: <double>[2, 2],
                                        ),
                                      ),
                                      enableAxisAnimation: true,
                                      plotAreaBorderColor: AppColors.kffffff,
                                    )),
                              ],
                            ),
                          ]),
                    ),
                  )
                ],
              ))),
    );
  }
}