import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/data/local/user_provider.dart';
import 'package:six/app/modules/social_worker/beneficiary_details/controllers/beneficiary_details_controller.dart';
import 'package:six/app/modules/social_worker/history_sw/controllers/history_sw_controller.dart';
import 'package:six/app/modules/social_worker/social_home/controllers/social_home_controller.dart';

Widget tabItem(String text, String textNewLine, int index, String whichScreen) {
  var ctrl = Get.put(BeneficiaryDetailsController());
  var socialCtrl = Get.put(SocialHomeController());
  var historyCtrl = Get.put(HistorySwController());
  return Obx(
    () => Tab(
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Gilroy',
              fontSize: 30.sp,
              color: (UserProvider.role == 'social_worker'
                      ? socialCtrl.tabIndex!() == index
                      : whichScreen == 'History'
                          ? historyCtrl.tabIndex() == index
                          : ctrl.tabIndex() == index)
                  ? AppColors.k13A89E
                  : AppColors.k033660,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(textNewLine,
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 40.sp,
                color: (UserProvider.role == 'social_worker'
                        ? socialCtrl.tabIndex!() == index
                        : whichScreen == 'History'
                            ? historyCtrl.tabIndex() == index
                            : ctrl.tabIndex() == index)
                    ? AppColors.k13A89E
                    : AppColors.k033660,
                fontWeight: FontWeight.w700,
              ))
        ],
      ),
    ),
  );
}
