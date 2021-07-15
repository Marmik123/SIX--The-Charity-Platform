import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/modules/social_worker/history_sw/views/already_assigned_view.dart';
import 'package:six/app/modules/social_worker/history_sw/views/history_all_voucher_view.dart';
import 'package:six/app/ui/components/common_appbar.dart';
import 'package:six/app/ui/components/common_voucher_card.dart';
import 'package:six/app/ui/components/month_picker.dart';
import 'package:six/app/ui/components/month_picker_dialog.dart';
import 'package:six/app/ui/components/sizedbox.dart';
import 'package:six/app/ui/components/tab_bar_social_worker.dart';

import '../controllers/history_sw_controller.dart';

class HistorySwView extends GetView<HistorySwController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kffffff,
      appBar: appBar(
        title: 'History',
        height: 200.h,
        disableBackIcon: false,
      ),
      body: Obx(
        () => Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 429.h,
                  width: 1125.w,
                  color: AppColors.kF2FEFF,
                ),
                Positioned(
                  top: 0,
                  child: Container(
                    height: 300.h,
                    width: 1005.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      gradient: LinearGradient(
                        begin: Alignment(5, 9),
                        end: Alignment(-1.8, 15),
                        stops: [0.4, 1.79],
                        transform: GradientRotation(123.57),
                        colors: [
                          Color(0xff1FAF9E),
                          Color(0xff0087FF).withOpacity(0.8),
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            //Get.toNamed<void>(Routes.AVAILABLE_CREDITS);
                          },
                          child: Container(
                            height: 220.h,
                            width: 452.5.w,
                            decoration: BoxDecoration(
                              color: AppColors.kffffff.withOpacity(0.2),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.k00474E.withOpacity(0.04),
                                  offset: Offset(0, 20),
                                  blurRadius: 50.r,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 53.h,
                                  ),
                                  Text(
                                    '25',
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize: 60.sp,
                                      fontStyle: FontStyle.normal,
                                      color: AppColors.kffffff,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Text(
                                    'Total Assigned Voucher',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize: 35.sp,
                                      fontStyle: FontStyle.normal,
                                      color: AppColors.kffffff.withOpacity(0.7),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.5.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            //Get.toNamed<void>(Routes.ADD_NOTE);
                          },
                          child: Container(
                            height: 220.h,
                            width: 452.5.w,
                            decoration: BoxDecoration(
                              color: AppColors.kffffff.withOpacity(0.2),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.k00474E.withOpacity(0.04),
                                  offset: Offset(0, 20),
                                  blurRadius: 50.r,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(50.r),
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
                                          fontStyle: FontStyle.normal,
                                          color: AppColors.kffffff
                                              .withOpacity(0.5),
                                          fontWeight: FontWeight.w400,
                                        ),
                                        children: [
                                          TextSpan(
                                              text: '7,500',
                                              style: TextStyle(
                                                fontFamily: 'Gilroy',
                                                fontSize: 60.sp,
                                                fontStyle: FontStyle.normal,
                                                color: AppColors.kffffff,
                                                fontWeight: FontWeight.w700,
                                              ))
                                        ]),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Text(
                                    'Total Redeemed Amount',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize: 35.sp,
                                      fontStyle: FontStyle.normal,
                                      color: AppColors.kffffff.withOpacity(0.7),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 372.h,
                  child: GestureDetector(
                    onTap: () async {
                      controller.monthNum!.value = await monthPickerDialog(
                        context: context,
                        selectedDate: controller.selectedDate,
                      );
                      controller.assignMonth(controller.monthNum!());
                    },
                    child: monthPicker(
                      color: AppColors.kffffff,
                      borderColor: AppColors.kE3FCFF,
                      height: 100.h,
                      whichScreen: 'Social',
                      shadowColor: Colors.transparent,
                      width: 380.w,
                      textContent: Text(
                        '${controller.monthName()}, ${controller.selectedDate!.year}',
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
                )
              ],
            ),
            h(126.h),
            Container(
              width: 1125.w,
              height: 150.h,
              child: TabBar(
                controller: controller.tabController!,
                physics: NeverScrollableScrollPhysics(),
                isScrollable: false,
                indicator: UnderlineTabIndicator(
                  insets: EdgeInsets.only(left: 45.w, right: 45.w),
                  borderSide: BorderSide(
                    color: AppColors.k13A89E,
                    width: 2,
                  ),
                ),
                onTap: (index) {
                  controller.tabIndex!.value = index;
                },
                tabs: List.generate(
                  3,
                  (index) => Container(
                    //color: AppColors.kffffff,
                    height: 110.h,
                    width: 1.sw,
                    child: tabItem(
                      controller.text[index],
                      controller.textNewLine[index],
                      index,
                      'History',
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: controller.tabController!,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  HistoryAllVoucherView(),
                  AlreadyAssignedView(),
                  Container(
                    height: 200.h,
                    width: 1005.w,
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => voucherCard(
                        title: 'Sheng Siong',
                        imgUrl: 'imgUrl',
                        amount: 20,
                        voucherCode: '15015783',
                        date: '1, Oct 2021',
                        onTap: () {},
                        voucherState: VoucherState.active,
                        btnText: 'Already Redeemed',
                        whichScreen: 'History',
                        isQRScreen: false,
                      ),
                      separatorBuilder: (context, index) => h(10.h),
                      itemCount: 10,
                    ),
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
