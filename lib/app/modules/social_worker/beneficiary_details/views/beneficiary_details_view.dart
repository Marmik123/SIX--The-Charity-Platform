import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/modules/social_worker/assigned_voucher/views/assigned_voucher_view.dart';
import 'package:six/app/modules/social_worker/connected_organization/views/connected_organization_view.dart';
import 'package:six/app/modules/social_worker/note_details/views/note_details_view.dart';
import 'package:six/app/ui/components/catched_image.dart';
import 'package:six/app/ui/components/sizedbox.dart';
import 'package:six/app/ui/components/tab_bar_social_worker.dart';
import 'package:six/r.g.dart';

import '../controllers/beneficiary_details_controller.dart';

class BeneficiaryDetailsView extends GetView<BeneficiaryDetailsController> {
  ScrollController scrollViewController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Obx(() => DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor:
                controller.backColor() ? AppColors.kffffff : AppColors.kffffff,
            body: NotificationListener<ScrollUpdateNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollViewController.position.userScrollDirection ==
                    ScrollDirection.reverse) {
                  //controller.snap(true);
                  /* print('${controller.snap()}');
                  controller.opacity(0);*/
                  if (scrollViewController.offset < 1330.h) {
                    controller.opacity(0);
                  }
                  print('scroll .... up');
                } else {
                  if (scrollViewController.position.userScrollDirection ==
                      ScrollDirection.forward) {
                    // controller.snap(false);
                    //print('${controller.snap()}');
                    if (scrollViewController.offset < 1030.h) {
                      controller.opacity(1);
                    }
                    print('scroll .... down ');
                  }
                }
                return false;
              },
              child: NestedScrollView(
                controller: scrollViewController,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverOverlapAbsorber(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                        sliver: SliverAppBar(
                          floating: true,
                          pinned: true,
                          snap: false,
                          leading: Container(),

                          backgroundColor: AppColors.kffffff,
                          // collapsedHeight: 0,
                          forceElevated: innerBoxIsScrolled,
                          bottom: PreferredSize(
                            preferredSize: Size(500.w, 210.h),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: Container(
                                //color: AppColors.kffffff,
                                width: 1.sw,
                                child: Column(
                                  children: [
                                    controller.opacity() == 1
                                        ? AnimatedOpacity(
                                            opacity: controller.opacity(),
                                            duration:
                                                Duration(milliseconds: 500),
                                            child: FittedBox(
                                              fit: BoxFit.contain,
                                              child: Container(
                                                width: 1005.w,
                                                height: 444.h,
                                                decoration: BoxDecoration(
                                                    color: AppColors.kffffff,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.r),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: AppColors.k00474E
                                                            .withOpacity(0.04),
                                                        offset: Offset(0, 20),
                                                        blurRadius: 50.r,
                                                      )
                                                    ]),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20.0,
                                                          right: 20),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Total Received Credits :',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Gilroy',
                                                              fontSize: 40.sp,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              color: AppColors
                                                                  .k033660,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                          Text(
                                                            '\$8,500',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Gilroy',
                                                              fontSize: 40.sp,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              color: AppColors
                                                                  .k13A89E,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Monthly Received Credits :',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Gilroy',
                                                              fontSize: 40.sp,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              color: AppColors
                                                                  .k033660,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                          Text(
                                                            '\$500',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Gilroy',
                                                              fontSize: 40.sp,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              color: AppColors
                                                                  .k13A89E,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Requests Made :',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Gilroy',
                                                              fontSize: 40.sp,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              color: AppColors
                                                                  .k033660,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                          Text(
                                                            '3',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Gilroy',
                                                              fontSize: 40.sp,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              color: AppColors
                                                                  .k13A89E,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Household Size :',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Gilroy',
                                                              fontSize: 40.sp,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              color: AppColors
                                                                  .k033660,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                          Text(
                                                            '4',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Gilroy',
                                                              fontSize: 40.sp,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              color: AppColors
                                                                  .k13A89E,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        : SizedBox.shrink(),
                                    h(40.h),
                                    TabBar(
                                      enableFeedback: true,
                                      isScrollable: false,
                                      indicatorColor: AppColors.k13A89E,
                                      indicator: UnderlineTabIndicator(
                                          insets: EdgeInsets.only(
                                              left: 45.w, right: 45.w),
                                          borderSide: BorderSide(
                                            color: AppColors.k13A89E,
                                            width: 2,
                                          )),
                                      onTap: (index) {
                                        controller.tabIndex!(index);
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
                                            'Charity',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          toolbarHeight: 1350.h,
                          flexibleSpace: FlexibleSpaceBar(
                            collapseMode: CollapseMode.parallax,
                            background: Column(
                              children: [
                                Stack(
                                  alignment: Alignment.bottomCenter,
                                  overflow: Overflow.visible,
                                  children: [
                                    Container(
                                      height: 1156.h,
                                      width: 1125.w,
                                      color: AppColors.kE3FCFF,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 150.h,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 60.w,
                                              ),
                                              Icon(
                                                Icons.arrow_back,
                                                color: AppColors.k033660,
                                              ),
                                              SizedBox(
                                                width: 550.w,
                                              ),
                                              Container(
                                                height: 100.h,
                                                width: 388.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100.r),
                                                  color: AppColors.kffffff,
                                                ),
                                                child: Center(
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      w(35.w),
                                                      Image.asset(
                                                        R.image.asset.call
                                                            .assetName,
                                                        height: 35.r,
                                                        width: 35.r,
                                                      ),
                                                      w(12.w),
                                                      Text(
                                                        '+65-9324573',
                                                        style: TextStyle(
                                                          fontFamily: 'Gilroy',
                                                          fontSize: 38.sp,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          color: AppColors
                                                              .k13A89E
                                                              .withOpacity(0.7),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 31.h,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: AppColors.kffffff,
                                                  width: 10.w,
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: AppColors.kCAE9ED,
                                                    offset: Offset(10, 20),
                                                    blurRadius: 60.r,
                                                  )
                                                ]),
                                            child: Center(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        200.r),
                                                child: cacheImage(
                                                  height: 380.r,
                                                  width: 380.r,
                                                  url:
                                                      'https://picsum.photos/id/1027/180',
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 40.h,
                                          ),
                                          Text(
                                            'Peter Lim',
                                            style: TextStyle(
                                              fontFamily: 'Gilroy',
                                              fontSize: 65.sp,
                                              fontStyle: FontStyle.normal,
                                              color: AppColors.k033660,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            height: 40.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 50.w,
                                              ),
                                              Image.asset(
                                                R.image.asset.message.assetName,
                                                height: 33.h,
                                                width: 37.w,
                                              ),
                                              w(15.w),
                                              Text(
                                                'peterlim@gmail.com',
                                                style: TextStyle(
                                                  fontFamily: 'Gilroy',
                                                  fontSize: 38.sp,
                                                  fontStyle: FontStyle.normal,
                                                  color: AppColors.k033660
                                                      .withOpacity(0.7),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.center,
                                              )
                                            ],
                                          ),
                                          h(20.h),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 50.w,
                                              ),
                                              Image.asset(
                                                R.image.asset.location
                                                    .assetName,
                                                height: 37.h,
                                                width: 31.w,
                                              ),
                                              w(15.w),
                                              Text(
                                                '231, Bedok Reservoir Rd, Singapore, 429333',
                                                style: TextStyle(
                                                  fontFamily: 'Gilroy',
                                                  fontSize: 38.sp,
                                                  fontStyle: FontStyle.normal,
                                                  color: AppColors.k033660
                                                      .withOpacity(0.7),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.left,
                                              )
                                            ],
                                          ),
                                          h(60.h),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 305.h,
                                ),
                              ],
                            ),
                          ),
                        )),
                  ];
                },
                body: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    NoteDetailsView(),
                    ConnectedOrganizationView(),
                    AssignedVoucherView(),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
