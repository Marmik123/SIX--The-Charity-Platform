import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/routes/app_pages.dart';
import 'package:six/app/ui/components/catched_image.dart';
import 'package:six/app/ui/components/circular_progress_indicator.dart';
import 'package:six/app/ui/components/sizedbox.dart';

import '../controllers/available_credits_controller.dart';

class AvailableCreditsView extends GetView<AvailableCreditsController> {
  final String whichRole;
  AvailableCreditsView({required this.whichRole});
  @override
  final AvailableCreditsController controller =
      Get.put(AvailableCreditsController());

  @override
  Widget build(BuildContext context) {
    //var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kE3FCFF,
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
      body: Column(
        children: [
          Obx(() => controller.disableLeading()
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    h(70.h),
                    Text(
                      'Select Program Category',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 60.sp,
                        fontStyle: FontStyle.normal,
                        color: AppColors.k033660.withOpacity(0.5),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                )
              : Container()),
          Obx(
            () => controller.isLoading()
                ? buildLoader()
                : controller.programCreditsAvailability().isEmpty
                    ? const Text('No Data Available')
                    : Expanded(
                        child: ListView.builder(
                          itemCount: whichRole == 'Charity'
                              ? controller.programCreditsAvailability().length
                              : 2,
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(top: 20, left: 50),
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => GestureDetector(
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
                                                  color: AppColors.k00474E
                                                      .withOpacity(0.04),
                                                  blurRadius: 50.r,
                                                  offset: const Offset(0, 20))
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(50.r)),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 40.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 66.h,
                                              ),
                                              Text(
                                                controller
                                                    .programCreditsAvailability()[
                                                        index]
                                                    .title
                                                    .toString(),
                                                style: TextStyle(
                                                  fontFamily: 'Gilroy',
                                                  fontSize: 50.sp,
                                                  fontStyle: FontStyle.normal,
                                                  color: AppColors.k033660,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                height: 19.h,
                                              ),
                                              Text(
                                                '\$${controller.programCreditsAvailability()[index].value.toString()}',
                                                style: TextStyle(
                                                  fontFamily: 'Gilroy',
                                                  fontSize: 60.sp,
                                                  fontStyle: FontStyle.normal,
                                                  color: AppColors.k14A1BE,
                                                  fontWeight: FontWeight.w700,
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
                                            offset: Offset(10.sp, 25.sp),
                                          ),
                                        ]),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: cacheImage(
                                          height: 180.r,
                                          width: 180.r,
                                          url:
                                              'https://picsum.photos/id/1011/180'),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
