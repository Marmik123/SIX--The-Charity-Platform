import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/data/models/sliver_persistent_header.dart';
import 'package:six/app/modules/social_worker/history_sw/views/already_assigned_view.dart';
import 'package:six/app/modules/social_worker/history_sw/views/history_all_voucher_view.dart';
import 'package:six/app/modules/social_worker/history_sw/views/redeemed_voucher.dart';
import 'package:six/app/ui/components/common_voucher_card.dart';
import 'package:six/app/ui/components/indexed_stack_tab_item.dart';
import 'package:six/app/ui/components/month_picker.dart';
import 'package:six/app/ui/components/month_picker_dialog.dart';
import 'package:six/app/ui/components/sizedbox.dart';

import '../controllers/history_sw_controller.dart';

class HistorySwView extends GetView<HistorySwController> {
  final List<Widget> tabsContent = <Widget>[
    HistoryAllVoucherView(),
    AlreadyAssignedView(),
    ListView(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        Container(
          height: 1.sh,
          width: 1005.w,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => voucherCard(
              title: 'Sheng Siong',
              imgUrl: 'https://picsum.photos/id/1011/180',
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
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kffffff,
      body: Container(
        width: 1.sw,
        //height: 1.sh,
        //color: Colors.blue,
        child: CustomScrollView(
          clipBehavior: Clip.none,
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          controller: controller.scrollViewController,
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              titleSpacing: 0.0,
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  Get.back<void>();
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: AppColors.k033660,
                ),
              ),
              elevation: 5,
              toolbarHeight: 200.h,
              shadowColor: AppColors.k00474E.withOpacity(0.14),
              backgroundColor: AppColors.kE3FCFF,
              title: Text(
                'History',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 50.sp,
                  fontStyle: FontStyle.normal,
                  color: AppColors.k033660,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 489.h,
                        width: 1125.w,
                        color: Colors.transparent,
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          height: 429.h,
                          width: 1125.w,
                          color: AppColors.kF2FEFF,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          height: 300.h,
                          width: 1005.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.r),
                            gradient: LinearGradient(
                              begin: const Alignment(5, 9),
                              end: const Alignment(-1.8, 15),
                              stops: const [0.4, 1.79],
                              transform: const GradientRotation(123.57),
                              colors: [
                                const Color(0xff1FAF9E),
                                const Color(0xff0087FF).withOpacity(0.8),
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
                                        color:
                                            AppColors.k00474E.withOpacity(0.04),
                                        offset: const Offset(0, 20),
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
                                            color: AppColors.kffffff
                                                .withOpacity(0.7),
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
                                        color:
                                            AppColors.k00474E.withOpacity(0.04),
                                        offset: const Offset(0, 20),
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
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      color: AppColors.kffffff,
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                            color: AppColors.kffffff
                                                .withOpacity(0.7),
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
                        child: Obx(() => GestureDetector(
                              onTap: () {
                                monthPickerDialog(
                                  context: context,
                                  selectedDate: controller.selectedDate(),
                                ).then((value) {
                                  controller
                                      .selectedDate(value ?? DateTime.now());
                                  controller.assignMonth(
                                      month: value?.month ?? 1);
                                });
                              },
                              child: monthPicker(
                                color: AppColors.kffffff,
                                borderColor: AppColors.kE3FCFF,
                                height: 100.h,
                                whichScreen: 'Social',
                                shadowColor: Colors.transparent,
                                width: 380.w,
                                textContent: Text(
                                  '${controller.monthName()}, ${controller.selectedDate().year}',
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
                            )),
                      )
                    ],
                  ),
                  h(0.h),
                ],
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverAppBarDelegate(
                minHeight: 220.h,
                maxHeight: 220.h,
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Obx(() => Container(
                              //padding: const EdgeInsets.only(left: 20, right: 20),
                              width: 1.sw,
                              color: AppColors.kffffff,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: List.generate(
                                  3,
                                  (index) => GestureDetector(
                                    onTap: () {
                                      controller.tabIndex(index);
                                    },
                                    child: indexedStackTabItem(
                                      controller.text[index],
                                      controller.textNewLine[index],
                                      index,
                                      'History',
                                      controller.tabIndex(),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                        Container(
                          width: 935.w,
                          height: 2.h,
                          color: AppColors.kB4C3D0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    width: 1.sw,
                    child: Obx(() => IndexedStack(
                          index: controller.tabIndex(),
                          children: <Widget>[
                            controller.tabIndex() == 0
                                ? HistoryAllVoucherView()
                                : const SizedBox.shrink(),
                            controller.tabIndex() == 1
                                ? AlreadyAssignedView()
                                : const SizedBox.shrink(),
                            controller.tabIndex() == 2
                                ? RedeemedView()
                                : const SizedBox.shrink(),
                          ],
                        )),
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

/*Column(
          children: [
            */
