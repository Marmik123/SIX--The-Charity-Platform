import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/data/local/user_provider.dart';
import 'package:six/app/modules/charity/charity_home/controllers/charity_home_controller.dart';
import 'package:six/app/modules/needy_family/available_credits/controllers/available_credits_controller.dart';
import 'package:six/app/modules/needy_family/home/controllers/home_controller.dart';
import 'package:six/app/modules/social_worker/social_home/controllers/social_home_controller.dart';
import 'package:six/app/modules/vendor/vendor_home/controllers/vendor_home_controller.dart';
import 'package:six/r.g.dart';

Widget bottomNavBar({
  required ValueChanged<int> onTap,
  required int currentIndex,
}) {
  /*var vendorCtrl = Get.put(VendorHomeController());
  var charityCtrl = Get.put(CharityHomeController());
  var socialCtrl = Get.put(SocialHomeController());
  var controller = Get.put(HomeController());
  var avail = Get.put(AvailableCreditsController());*/

  return Container(
    decoration: BoxDecoration(
      color: AppColors.kffffff,
      boxShadow: [
        BoxShadow(
          spreadRadius: 1.5.sp,
          color: AppColors.k1FAF9E.withOpacity(0.15),
        )
      ],
    ),
    child: BottomNavigationBar(
      backgroundColor: AppColors.kffffff,
      elevation: 45,
      iconSize: 25,
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      /*onTap: (index) {
        UserProvider.role == 'vendor'
            ? vendorCtrl.currentIndex!(index)
            : UserProvider.role == 'needy_family'
                ? controller.currentIndex!(index)
                : UserProvider.role == 'social_worker'
                    ? socialCtrl.currentIndex(index)
                    : charityCtrl.currentIndex!(index);
        if (UserProvider.role == 'charity') {
          avail.disableLeading(true);
        } else if (UserProvider.role == 'social_worker') {
          if (index == 2) {
            socialCtrl.getHistoryOfAssignVoucher('all');
            socialCtrl.assignHistoryDashData();
          }
          avail.disableLeading(true);
        }
        //fromVoucherScreen ? (Get.offAllNamed<void>(Routes.HOME)) : null;
      },*/
      onTap: onTap,
      unselectedFontSize: 36.sp,
      selectedFontSize: 36.sp,
      selectedItemColor: AppColors.k1FAF9E,
      unselectedItemColor: AppColors.k6886A0,
      showSelectedLabels: true,
      selectedLabelStyle: TextStyle(
        fontSize: 36.sp,
        fontStyle: FontStyle.normal,
        color: AppColors.k1FAF9E,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 36.sp,
        fontStyle: FontStyle.normal,
        color: AppColors.k033660,
        fontWeight: FontWeight.w500,
      ),
      items: [
        BottomNavigationBarItem(
          backgroundColor: AppColors.kffffff,
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Image.asset(
              R.image.home().assetName,
              height: 61.h,
              width: 61.w,
            ),
          ),
          activeIcon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: AppColors.k1FAF9E.withOpacity(0.4),
                    blurRadius: 20.sp,
                    offset: const Offset(5, 5))
              ]),
              child: Image.asset(
                R.image.home_new().assetName,
                height: 61.h,
                width: 61.w,
              ),
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Image.asset(
              UserProvider.role == 'vendor'
                  ? R.image.asset.ticket.assetName
                  : UserProvider.role == 'charity'
                      ? R.image.asset.charity_ticket.assetName
                      : UserProvider.role == 'social_worker'
                          ? R.image.asset.purchase_social.assetName
                          : R.image.discount().assetName,
              height: 61.h,
              width: 61.w,
            ),
          ),
          activeIcon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: AppColors.k1FAF9E.withOpacity(0.4),
                    blurRadius: 20.sp,
                    offset: const Offset(5, 5))
              ]),
              child: Image.asset(
                UserProvider.role == 'vendor'
                    ? R.image.asset.ticket_click.assetName
                    : UserProvider.role == 'charity'
                        ? R.image.purchase_icon().assetName
                        : UserProvider.role == 'social_worker'
                            ? R.image.asset.buy.assetName
                            : R.image.discoun_active().assetName,
                height: 61.h,
                width: 61.w,
                //color: AppColors.k1FAF9E,
              ),
            ),
          ),
          label: UserProvider.role == 'vendor'
              ? 'Redeem'
              : UserProvider.role == 'charity' ||
                      UserProvider.role == 'social_worker'
                  ? 'Purchase'
                  : 'Voucher',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Image.asset(
              R.image.profile().assetName,
              width: 61.w,
              height: 61.h,
            ),
          ),
          activeIcon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: AppColors.k1FAF9E.withOpacity(0.4),
                    blurRadius: 20.sp,
                    offset: const Offset(5, 5))
              ]),
              child: Image.asset(
                R.image.profile_new().assetName,
                width: 61.w,
                height: 61.h,
              ),
            ),
          ),
          label: 'Profile',
        ),
      ],
    ),
  );
}
