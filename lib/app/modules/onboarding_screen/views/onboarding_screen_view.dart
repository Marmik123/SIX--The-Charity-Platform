import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/ui/components/circular_arrow_btn.dart';
import 'package:six/app/ui/components/onboarding_content.dart';

import '../controllers/onboarding_screen_controller.dart';

class OnboardingScreenView extends GetView<OnboardingScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kE5E5E5,
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
                      controller.subTitle[index],
                      index,
                      controller.pageController);
                }),
          ),
          Container(
            width: 1.sw,
            height: 150.h,
            child: Obx(() => Row(
                  children: [
                    SizedBox(
                      width: 60.w,
                    ),
                    Container(
                      width: 20.w,
                      height: 20.h,
                      decoration: controller.index!.value == 0
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
                    Container(
                      width: 20.w,
                      height: 20.h,
                      decoration: controller.index!.value == 1
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
                    Container(
                      width: 20.w,
                      height: 20.h,
                      decoration: controller.index!.value == 2
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
                      width: 337.w,
                    ),
                    circularArrowButton(controller),
                    SizedBox(
                      width: 346.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offAndToNamed<void>('/sign-pass-verification');
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
                )),
          )
        ],
      ),
    );
  }
}
