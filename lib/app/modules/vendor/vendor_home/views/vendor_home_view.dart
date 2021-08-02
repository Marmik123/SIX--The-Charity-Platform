import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/data/models/sliver_persistent_header.dart';
import 'package:six/app/modules/needy_family/profile/views/profile_view.dart';
import 'package:six/app/modules/vendor/vendor_redeem/controllers/vendor_redeem_controller.dart';
import 'package:six/app/modules/vendor/vendor_redeem/views/vendor_redeem_view.dart';
import 'package:six/app/ui/components/bottom_nav_bar.dart';
import 'package:six/app/ui/components/month_picker.dart';
import 'package:six/app/ui/components/month_picker_dialog.dart';
import 'package:six/app/ui/components/vendor_home_curved_cont.dart';
import 'package:six/r.g.dart';

import '../controllers/vendor_home_controller.dart';

class VendorHomeView extends GetView<VendorHomeController> {
  final VendorRedeemController vendorRCtrl = Get.put(VendorRedeemController());
  final List<Widget> bottomNavScreen = <Widget>[
    VendorHome(),
    VendorRedeemView(),
    ProfileView(
      whichScreen: 'Vendor',
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.kffffff,
        bottomNavigationBar:
            !vendorRCtrl.redeemNow.value && !vendorRCtrl.redeemThroughNum.value
                ? bottomNavBar()
                : const SizedBox.shrink(),
        body: bottomNavScreen.elementAt(
          controller.currentIndex!.value,
        ),
      ),
    );
  }
}

class VendorHome extends StatelessWidget {
  late final DateTime? selectedDate;
  final VendorHomeController ctrl = Get.put(VendorHomeController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
          return false;
        },
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          controller: ctrl.scrollController,
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: true,
              titleSpacing: 0.0,
              centerTitle: true,
              elevation: 5,
              expandedHeight: 200.h,
              toolbarHeight: 200.h,
              backgroundColor: AppColors.kE3FCFF,
              shadowColor: AppColors.k00474E.withOpacity(0.14),
              title: Container(
                height: 677.h,
                width: 1125.w,
                color: AppColors.kE3FCFF,
                child: Center(
                  child: Image.asset(
                    R.image.asset.six_logo.assetName,
                    height: 77.h,
                    width: 170.w,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Obx(
                    () => Container(
                      height: 700.h,
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            height: 370.h,
                            color: AppColors.kE3FCFF,
                          ),
                          Positioned(
                            top: 50.h,
                            child: Container(
                              width: 380.w,
                              child: GestureDetector(
                                onTap: () {
                                  monthPickerDialog(
                                    context: context,
                                    selectedDate: ctrl.selectedDate,
                                  ).then((value) =>
                                      ctrl.assignMonth(value?.month ?? 1));
                                },
                                child: Container(
                                  width: 380.w,
                                  height: 80.h,
                                  child: monthPicker(
                                    color: AppColors.kffffff,
                                    borderColor: AppColors.kE3FCFF,
                                    height: 80.h,
                                    whichScreen: '',
                                    shadowColor: AppColors.k0A9988,
                                    width: 390.w,
                                    textContent: Text(
                                      '${ctrl.monthName()}, ${ctrl.selectedDate.year}',
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
                              ),
                            ),
                          ),
                          Positioned(
                            top: 95.h,
                            child: Container(
                              height: 590.h,
                              child: CustomPaint(
                                size: Size(
                                  1005.w,
                                  (1005.w * 0.5870646766169154).toDouble(),
                                ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                painter: VendorHomeCurved(),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 40.w,
                                    ),
                                    Column(
                                      //crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          height: 90.h,
                                        ),
                                        Container(
                                          height: 220.h,
                                          width: 926.w,
                                          decoration: BoxDecoration(
                                            color: AppColors.kffffff
                                                .withOpacity(0.2),
                                            boxShadow: [
                                              BoxShadow(
                                                color: AppColors.k00474E
                                                    .withOpacity(0.04),
                                                offset: const Offset(0, 20),
                                                blurRadius: 50.r,
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(50.r),
                                          ),
                                          child: Center(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 53.h,
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                      text: '\$',
                                                      style: TextStyle(
                                                        fontFamily: 'Gilroy',
                                                        fontSize: 60.sp,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        color: AppColors.kffffff
                                                            .withOpacity(0.5),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                            text: '50,000',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Gilroy',
                                                              fontSize: 60.sp,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              color: AppColors
                                                                  .kffffff,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ))
                                                      ]),
                                                ),
                                                SizedBox(
                                                  height: 20.h,
                                                ),
                                                Text(
                                                  'Redeemed Amount',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'Gilroy',
                                                    fontSize: 35.sp,
                                                    fontStyle: FontStyle.normal,
                                                    color: AppColors.kffffff
                                                        .withOpacity(0.7),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 220.h,
                                              width: 452.5.w,
                                              decoration: BoxDecoration(
                                                color: AppColors.kffffff
                                                    .withOpacity(0.2),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: AppColors.k00474E
                                                        .withOpacity(0.04),
                                                    offset: const Offset(0, 20),
                                                    blurRadius: 50.r,
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(50.r),
                                              ),
                                              child: Center(
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 53.h,
                                                    ),
                                                    Text(
                                                      '350',
                                                      style: TextStyle(
                                                        fontFamily: 'Gilroy',
                                                        fontSize: 60.sp,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        color:
                                                            AppColors.kffffff,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    SizedBox(
                                                      height: 20.h,
                                                    ),
                                                    Text(
                                                      'Redeemed Vouchers',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontFamily: 'Gilroy',
                                                        fontSize: 35.sp,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        color: AppColors.kffffff
                                                            .withOpacity(0.7),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20.5.w,
                                            ),
                                            Container(
                                              height: 220.h,
                                              width: 452.5.w,
                                              decoration: BoxDecoration(
                                                color: AppColors.kffffff
                                                    .withOpacity(0.2),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: AppColors.k00474E
                                                        .withOpacity(0.04),
                                                    offset: const Offset(0, 20),
                                                    blurRadius: 50.r,
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(50.r),
                                              ),
                                              child: Center(
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 53.h,
                                                    ),
                                                    Text(
                                                      '130',
                                                      style: TextStyle(
                                                        fontFamily: 'Gilroy',
                                                        fontSize: 60.sp,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        color:
                                                            AppColors.kffffff,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    SizedBox(
                                                      height: 20.h,
                                                    ),
                                                    Text(
                                                      'Active Vouchers',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontFamily: 'Gilroy',
                                                        fontSize: 35.sp,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        color: AppColors.kffffff
                                                            .withOpacity(0.7),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 40.h,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 39.w,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverAppBarDelegate(
                  minHeight: 110.h,
                  maxHeight: 110.h,
                  child: Container(
                    width: 1.sw,
                    alignment: Alignment.centerLeft,
                    decoration: const BoxDecoration(
                      color: AppColors.kffffff,
                      /*  boxShadow: [
                        BoxShadow(
                          color: AppColors.k00474E.withOpacity(0.1),
                          offset: const Offset(0, 20),
                          blurRadius: 50.r,
                        ),
                      ],
                    */
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 22, top: 0),
                      child: Text(
                        'Transactions',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 60.sp,
                          fontStyle: FontStyle.normal,
                          color: AppColors.k033660.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  )),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    width: 1.sw,
                    child: ListView.builder(
                        itemCount: 15,
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 0),
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                width: 1005.w,
                                height: 200.h,
                                decoration: BoxDecoration(
                                  color: AppColors.kffffff,
                                  borderRadius: BorderRadius.circular(50.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          AppColors.k00474E.withOpacity(0.04),
                                      offset: const Offset(0, 20),
                                      blurRadius: 50.r,
                                    )
                                  ],
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 50.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 41.h,
                                        ),
                                        Text(
                                          'Voucher code : 150154403',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Gilroy',
                                            fontSize: 50.sp,
                                            fontStyle: FontStyle.normal,
                                            color: AppColors.k033660,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 18.h,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              R.image.asset.calendar.assetName,
                                              height: 33.33.h,
                                              width: 30.w,
                                            ),
                                            SizedBox(
                                              width: 25.w,
                                            ),
                                            Text(
                                              '12 Apr, 2021',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Gilroy',
                                                fontSize: 35.sp,
                                                fontStyle: FontStyle.normal,
                                                color: AppColors.k033660
                                                    .withOpacity(0.7),
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 25.w,
                                            ),
                                            Text(
                                              '06:32 PM',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Gilroy',
                                                fontSize: 35.sp,
                                                fontStyle: FontStyle.normal,
                                                color: AppColors.k033660
                                                    .withOpacity(0.7),
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 265.w,
                                    ),
                                    Text(
                                      '\$15',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Gilroy',
                                        fontSize: 50.sp,
                                        fontStyle: FontStyle.normal,
                                        color: AppColors.k14A1BE,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                            ],
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
