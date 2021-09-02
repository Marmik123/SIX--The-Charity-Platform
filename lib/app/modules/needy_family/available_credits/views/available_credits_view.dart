import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/data/local/user_provider.dart';
import 'package:six/app/routes/app_pages.dart';
import 'package:six/app/ui/components/catched_image.dart';
import 'package:six/app/ui/components/circular_progress_indicator.dart';
import 'package:six/app/ui/components/sizedbox.dart';

import '../controllers/available_credits_controller.dart';
import 'package:six/r.g.dart';

class AvailableCreditsView extends GetView<AvailableCreditsController> {
  /*final String whichRole;
  AvailableCreditsView({required this.whichRole});*/
  @override
  final AvailableCreditsController controller =
      Get.put(AvailableCreditsController());

  @override
  Widget build(BuildContext context) {
    //var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kF2FEFF,
        elevation: 0,
        title: Text(
          'Available Credits',
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 50.sp,
            fontStyle: FontStyle.normal,
            color: AppColors.k033660,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        toolbarHeight: 200.h,
        leading: controller.disableLeading()
            ? Container()
            : IconButton(
                icon: const Icon(Icons.arrow_back),
                color: AppColors.k033660,
                onPressed: () {
                  Get.back<void>();
                },
              ),
      ),
      backgroundColor: AppColors.kffffff,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
          return false;
        },
        child: RefreshIndicator(
          color: Colors.white,
          backgroundColor: Colors.white,
          displacement: 1.sh,
          strokeWidth: 0,
          onRefresh: () {
            if (UserProvider.role == 'needy_family') {
              return controller.assignToNeedyProgCredit();
            } else {
              return controller.assignToAvailProgCredit();
            }
          },
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(() => controller.disableLeading()
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          h(70.h),
                          Padding(
                            padding: EdgeInsets.only(right: 600.w),
                            child: Text(
                              'Select Program',
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
                        ],
                      )
                    : Container(
                        height: 0,
                      )),
                Obx(
                  () => UserProvider.role == 'charity'
                      ? controller.isLoading()
                          ? buildLoader()
                          : controller.programCreditsAvailability().isEmpty
                              ? const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('No Data Available'),
                                )
                              : Flexible(
                                  child: ListView.builder(
                                    itemCount: controller
                                        .programCreditsAvailability()
                                        .length,
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 50),
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      final moneyFormat =
                                          NumberFormat('#,##0.00', 'en_US');

                                      var creditsOfProgram = moneyFormat.format(
                                          double.tryParse(controller
                                                      .programCreditsAvailability()[
                                                          index]
                                                      .value ==
                                                  null
                                              ? '-'
                                              : '${controller.programCreditsAvailability()[index].value!.toStringAsFixed(2)}'));

                                      return GestureDetector(
                                        onTap: () {
                                          controller.programIndex!(index);
                                          Get.toNamed<void>(Routes.PURCHASE);
                                        },
                                        child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                    height: 260.h,
                                                    width: 916.w,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            AppColors.kffffff,
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: AppColors
                                                                  .k00474E
                                                                  .withOpacity(
                                                                      0.04),
                                                              blurRadius: 50.r,
                                                              offset:
                                                                  const Offset(
                                                                      0, 20))
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    50.r)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 40.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            height: 66.h,
                                                          ),
                                                          Text(
                                                            controller
                                                                .programCreditsAvailability()[
                                                                    index]
                                                                .name
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Gilroy',
                                                              fontSize: 50.sp,
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
                                                          SizedBox(
                                                            height: 19.h,
                                                          ),
                                                          Text(
                                                            '\$${creditsOfProgram}',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Gilroy',
                                                              fontSize: 60.sp,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              color: AppColors
                                                                  .k14A1BE,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )),
                                                SizedBox(
                                                  height: 25.h,
                                                ),
                                              ],
                                            ),
                                            Positioned(
                                              bottom: 15,
                                              right: 0.78.sw,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: AppColors.kffffff,
                                                      width: 8.w,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: AppColors.k001F22
                                                            .withOpacity(0.03),
                                                        blurRadius: 25.r,
                                                        offset: Offset(
                                                            10.sp, 25.sp),
                                                      ),
                                                    ]),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  child: cacheImage(
                                                    height: 180.r,
                                                    width: 180.r,
                                                    url: controller
                                                        .programCreditsAvailability()[
                                                            index]
                                                        .icon,
                                                    placeholder: ImageIcon(
                                                      R.image.categories(),
                                                      color: AppColors.k033660,
                                                      size: 35,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                )
                      : controller.isNeedyLoading()
                          ? buildLoader()
                          : controller.needyProgCredits().isEmpty
                              ? const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('No Data Available'),
                                )
                              : Flexible(
                                  child: ListView.builder(
                                    itemCount:
                                        controller.needyProgCredits().length,
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 50),
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, index) =>
                                        GestureDetector(
                                      onTap: () {
                                        controller.programIndex!(index);
                                        Get.toNamed<void>(Routes.PURCHASE);
                                      },
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                  height: 260.h,
                                                  width: 916.w,
                                                  decoration: BoxDecoration(
                                                      color: AppColors.kffffff,
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: AppColors
                                                                .k00474E
                                                                .withOpacity(
                                                                    0.04),
                                                            blurRadius: 50.r,
                                                            offset:
                                                                const Offset(
                                                                    0, 20))
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.r)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 40.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          height: 66.h,
                                                        ),
                                                        Text(
                                                          controller
                                                              .needyProgCredits()[
                                                                  index]
                                                              .name
                                                              .toString(),
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Gilroy',
                                                            fontSize: 50.sp,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            color: AppColors
                                                                .k033660,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        SizedBox(
                                                          height: 19.h,
                                                        ),
                                                        Text(
                                                          '\$${controller.needyProgCredits()[index].value.toString()}',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Gilroy',
                                                            fontSize: 60.sp,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            color: AppColors
                                                                .k14A1BE,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                              SizedBox(
                                                height: 25.h,
                                              ),
                                            ],
                                          ),
                                          Positioned(
                                            bottom: 15,
                                            right: 0.78.sw,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: AppColors.kffffff,
                                                    width: 8.w,
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: AppColors.k001F22
                                                          .withOpacity(0.03),
                                                      blurRadius: 25.r,
                                                      offset:
                                                          Offset(10.sp, 25.sp),
                                                    ),
                                                  ]),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                child: cacheImage(
                                                  height: 180.r,
                                                  width: 180.r,
                                                  url: controller
                                                      .needyProgCredits()[index]
                                                      .profileUrl,
                                                  placeholder: ImageIcon(
                                                    R.image.categories(),
                                                    color: AppColors.k033660,
                                                    size: 35,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
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
