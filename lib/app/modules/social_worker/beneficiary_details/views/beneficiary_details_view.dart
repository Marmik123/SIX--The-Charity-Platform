import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/models/sliver_persistent_header.dart';
import 'package:six/app/modules/social_worker/assigned_voucher/views/assigned_voucher_view.dart';
import 'package:six/app/modules/social_worker/connected_organization/views/connected_organization_view.dart';
import 'package:six/app/modules/social_worker/note_details/views/note_details_view.dart';
import 'package:six/app/routes/app_pages.dart';
import 'package:six/app/ui/components/catched_image.dart';
import 'package:six/app/ui/components/circular_progress_indicator.dart';
import 'package:six/app/ui/components/indexed_stack_tab_item.dart';
import 'package:six/app/ui/components/rounded_gradient_btn.dart';
import 'package:six/app/ui/components/sizedbox.dart';
import 'package:six/app/utils/url_utils.dart';
import 'package:six/r.g.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

import '../controllers/beneficiary_details_controller.dart';

class BeneficiaryDetailsView extends GetView<BeneficiaryDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Obx(() => controller.tabIndex() == 0
          ? roundedButton(
              text: 'Assign Now',
              onTap: () {
                Get.toNamed<void>(Routes.DISTRIBUTE_VOUCHER);
              },
              width: 452.w,
              height: 150.h,
              fontSize: 50.sp,
            )
          : const SizedBox.shrink()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor:
          controller.tabBarVisibility() ? AppColors.kffffff : AppColors.kffffff,
      body: Container(
        width: Get.width,
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowGlow();
            return false;
          },
          child: RefreshIndicator(
            onRefresh: () {
              logW('onrefresh called');
              return controller.assignBeneDashboardData();
              //throw 'hello';
            },
            child: CustomScrollView(
              clipBehavior: Clip.none,
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              controller: controller.scrollViewController,
              slivers: [
                SliverAppBar(
                  floating: true,
                  pinned: true,
                  titleSpacing: 0.0,
                  centerTitle: false,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: AppColors.k033660,
                    onPressed: () {
                      Get.back<void>();
                    },
                  ),
                  elevation: 5,
                  shadowColor: AppColors.k00474E.withOpacity(0.14),
                  backgroundColor: AppColors.kE3FCFF,
                  // collapsedHeight: 0,
                  title: Obx(
                    () => AnimatedOpacity(
                      opacity: controller.titleVisible() ? 1 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.kffffff,
                                  width: 10.w,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.k00474E.withOpacity(0.2),
                                    offset: const Offset(6, 10),
                                    blurRadius: 60.r,
                                  )
                                ]),
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(200.r),
                                child: cacheImage(
                                  height: 70.r,
                                  width: 70.r,
                                  url: controller.beneficiary.profileImageUrl,
                                  placeholder: CircleAvatar(
                                    radius: 35.r,
                                    child: const Icon(
                                      Icons.person,
                                      size: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          w(30.w),
                          Text(
                            controller.beneficiary.userMetadata?.principalName
                                    .toString() ??
                                'Beneficiary Name',
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontSize: 55.sp,
                              fontStyle: FontStyle.normal,
                              color: AppColors.k033660,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20.0,
                        bottom: 20,
                        right: 8,
                        left: 20,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          url_launcher.launch(
                              'tel://${controller.beneficiary.userMetadata?.mobileNumber.toString() ?? ''}');
                        },
                        child: Container(
                          height: 70.h,
                          width: 338.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.r),
                              color: AppColors.kffffff,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.k00474E.withOpacity(0.14),
                                  offset: const Offset(5, 8),
                                  blurRadius: 50.r,
                                ),
                              ]),
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                w(35.w),
                                Image.asset(
                                  R.image.asset.call.assetName,
                                  height: 35.r,
                                  width: 35.r,
                                ),
                                w(12.w),
                                Text(
                                  controller.beneficiary.userMetadata
                                          ?.mobileNumber
                                          .toString() ??
                                      '',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontSize: 38.sp,
                                    fontStyle: FontStyle.normal,
                                    color: AppColors.k13A89E.withOpacity(0.7),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                  toolbarHeight: 250.h,
                  expandedHeight: 700.h,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    background: Container(
                      height: 360.h,
                      width: 1125.w,
                      color: AppColors.kE3FCFF,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 310.h,
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
                                    offset: const Offset(10, 20),
                                    blurRadius: 60.r,
                                  )
                                ]),
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(200.r),
                                child: cacheImage(
                                  height: 380.r,
                                  width: 380.r,
                                  url: controller.beneficiary.profileImageUrl
                                      .toString(),
                                  placeholder: CircleAvatar(
                                    radius: 180.r,
                                    child: const Icon(
                                      Icons.person,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(
                        height: 450.h,
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              width: 1.sw,
                              height: 450.h,
                              color: AppColors.kE3FCFF,
                              child: Column(
                                children: [
                                  Text(
                                    controller.beneficiary.userMetadata
                                            ?.principalName
                                            .toString() ??
                                        'Beneficiary Name',
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
                                    height: 20.h,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      sendMail(controller
                                          .beneficiary.userMetadata?.email);
                                    },
                                    child: Row(
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
                                          controller.beneficiary.userMetadata
                                                  ?.email
                                                  .toString() ??
                                              'email',
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
                                  ),
                                  h(20.h),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      w(50.w),
                                      Image.asset(
                                        R.image.asset.location.assetName,
                                        height: 37.h,
                                        width: 31.w,
                                      ),
                                      w(15.w),
                                      Expanded(
                                        child: Text(
                                          controller.beneficiary.address,
                                          style: TextStyle(
                                            fontFamily: 'Gilroy',
                                            fontSize: 38.sp,
                                            fontStyle: FontStyle.normal,
                                            color: AppColors.k033660
                                                .withOpacity(0.7),
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      w(50.w),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: -260.h,
                              child: Container(
                                height: 444.h,
                                width: (1.sw) - 120.w,
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
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20),
                                  child: Obx(() => controller.isLoading()
                                      ? buildLoader()
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Total Received Credits :',
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
                                                  '\$${controller.beneDashboard()['totalCredits'] ?? 0}',
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Monthly Received Credits :',
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
                                                  '\$${controller.beneDashboard()['totalMonthlyCredits'] ?? 0}',
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

                                            ///REQUEST MADE ROW
                                            /*Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Requests Made :',
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
                                            '3',
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
                                      ),*/
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Household Size :',
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
                                                  '${controller.beneDashboard()['houseHoldSize'] ?? 0}',
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
                                        )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      h(280.h),
                    ],
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverAppBarDelegate(
                    minHeight: 190.h,
                    maxHeight: 190.h,
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              //padding: const EdgeInsets.only(left: 20, right: 20),
                              width: 1.sw,
                              color: AppColors.kffffff,
                              child: Obx(
                                () => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: List.generate(
                                    3,
                                    (index) => TextButton(
                                      onPressed: () {
                                        controller.tabIndex(index);
                                      },
                                      child: indexedStackTabItem(
                                        controller.text[index],
                                        controller.textNewLine[index],
                                        index,
                                        controller.tabIndex(),
                                        300.w,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 8,
                              child: Container(
                                width: 935.w,
                                height: 2.h,
                                color: AppColors.kB4C3D0,
                              ),
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
                        child: Obx(
                          () => IndexedStack(
                            index: controller.tabIndex(),
                            children: <Widget>[
                              controller.tabIndex() == 0
                                  ? NoteDetailsView()
                                  : const SizedBox.shrink(),
                              controller.tabIndex() == 1
                                  ? ConnectedOrganizationView()
                                  : const SizedBox.shrink(),
                              controller.tabIndex() == 2
                                  ? AssignedVoucherView()
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
