import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/data/models/sliver_persistent_header.dart';
import 'package:six/app/modules/social_worker/assigned_voucher/views/assigned_voucher_view.dart';
import 'package:six/app/modules/social_worker/connected_organization/views/connected_organization_view.dart';
import 'package:six/app/modules/social_worker/note_details/views/note_details_view.dart';
import 'package:six/app/routes/app_pages.dart';
import 'package:six/app/ui/components/catched_image.dart';
import 'package:six/app/ui/components/indexed_stack_tab_item.dart';
import 'package:six/app/ui/components/rounded_gradient_btn.dart';
import 'package:six/app/ui/components/sizedbox.dart';
import 'package:six/r.g.dart';

import '../controllers/beneficiary_details_controller.dart';

class BeneficiaryDetailsView extends GetView<BeneficiaryDetailsController> {
  final List<Widget> tabsContent = <Widget>[
    NoteDetailsView(),
    ConnectedOrganizationView(),
    AssignedVoucherView(),
  ];

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
          child: CustomScrollView(
            clipBehavior: Clip.none,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
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
                                url: 'https://picsum.photos/id/1027/180',
                              ),
                            ),
                          ),
                        ),
                        w(30.w),
                        Text(
                          'Peter Lim',
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
                              '+65-9324573',
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
                                url: 'https://picsum.photos/id/1027/180',
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
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                        color:
                                            AppColors.k033660.withOpacity(0.7),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                                h(20.h),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 50.w,
                                    ),
                                    Image.asset(
                                      R.image.asset.location.assetName,
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
                                        color:
                                            AppColors.k033660.withOpacity(0.7),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.left,
                                    )
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
                                    color: AppColors.k00474E.withOpacity(0.04),
                                    offset: const Offset(0, 20),
                                    blurRadius: 50.r,
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                          '\$8,500',
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
                                          '\$500',
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
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                          '4',
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
                                      'Beneficiary Details',
                                      controller.tabIndex(),
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
    );
  }
}
