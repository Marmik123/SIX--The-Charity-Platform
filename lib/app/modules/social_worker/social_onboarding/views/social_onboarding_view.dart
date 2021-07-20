import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/routes/app_pages.dart';
import 'package:six/app/ui/components/onboarding_content.dart';
import 'package:six/app/ui/components/onboarding_navigation.dart';

import '../controllers/social_onboarding_controller.dart';

class SocialOnboardingView extends GetView<SocialOnboardingController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.kffffff,
        extendBodyBehindAppBar: true,
        body: Column(
          children: [
            Container(
              height: 0.9.sh,
              width: 1.sw,
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowGlow();
                  return false;
                },
                child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.title.length,
                    onPageChanged: (index) {
                      controller.index!.value = index;
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
                        controller.pageController,
                        controller.imageAssetName[index],
                        index == 2 ? 0 : 40.h,
                      );
                    }),
              ),
            ),
            Container(
              width: 1.sw,
              height: 150.h,
              child: onBoardingNavigation(
                  itemCount: controller.title.length,
                  isVendor: false,
                  onTapArrow: () {
                    controller.index!() == 2
                        ? Get.offAllNamed<void>(Routes.SOCIAL_HOME)
                        : controller.pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease);
                  },
                  onTapSkip: () {
                    Get.offAllNamed<void>(Routes.SOCIAL_HOME);
                  },
                  screenIndex: controller.index!.value.toDouble(),
                  onChangedPadding: 35.w),
            ),
          ],
        ),
      ),
    );
  }
}
