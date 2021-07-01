import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/ui/components/circular_arrow_btn.dart';
import 'package:six/app/ui/components/onboarding_content.dart';

import '../controllers/onboarding_vendor_controller.dart';

class OnboardingVendorView extends GetView<OnboardingVendorController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kffffff,
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Container(
            height: 0.9.sh,
            width: 1.sw,
            child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.title.length,
                onPageChanged: (index) {
                  controller.index!.value = index;
                  print('@@$index');
                  print(controller.index!.value);
                  /* controller.pageController.nextPage(
                      duration: Duration(milliseconds: 200), curve: Curves.bounceOut);
                */
                },
                controller: controller.pageController,
                itemBuilder: (context, index) {
                  return onBoarding(
                    controller.title[index],
                    controller.subtitle[index],
                    index,
                    controller.pageController,
                    controller.imageAssetName[index],
                    125.h,
                  );
                }),
          ),
          Container(
            width: 1.sw,
            height: 150.h,
            child: Row(
              children: [
                SizedBox(
                  width: 60.w,
                ),
                Container(
                  width: 100.w,
                  height: 150.h,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: ClampingScrollPhysics(),
                      itemCount: controller.title.length,
                      itemBuilder: (context, index) => Obx(() => Row(
                            children: [
                              Container(
                                width: 20.w,
                                height: 20.h,
                                decoration: controller.index!.value == index
                                    ? BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.k14A1BE,
                                      )
                                    : BoxDecoration(
                                        border: Border.all(
                                          color: AppColors.k6886A0,
                                          width: 3.w,
                                        ),
                                        shape: BoxShape.circle,
                                        color: AppColors.kffffff,
                                      ),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                            ],
                          ))),
                ),
                SizedBox(
                  width: 337.w,
                ),
                circularArrowButton(() {
                  controller.index == 2
                      ? Get.offAllNamed<void>('/sign-pass-verification')
                      : controller.pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease);
                }),
                SizedBox(
                  width: 346.w,
                ),
                GestureDetector(
                  onTap: () {
                    Get.offAllNamed<void>('/sign-pass-verification');
                  },
                  child: Text(
                    'Skip',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 42.sp,
                      fontStyle: FontStyle.normal,
                      color: AppColors.k585858,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
