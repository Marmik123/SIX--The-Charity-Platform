import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/modules/needy_family/home/controllers/home_controller.dart';
import 'package:six/app/modules/vendor/vendor_home/controllers/vendor_home_controller.dart';
import 'package:six/app/routes/app_pages.dart';
import 'package:six/app/ui/components/shape_utils.dart';
import 'package:six/r.g.dart';

Widget bottomNavBar(
    {required bool fromVoucherScreen, required bool vendorHome}) {
  var vendorCtrl = Get.put(VendorHomeController());
  HomeController controller = Get.put(HomeController());
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
      currentIndex: vendorHome
          ? vendorCtrl.currentIndex!.value
          : controller.currentIndex!.value,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      onTap: (index) {
        vendorHome
            ? vendorCtrl.currentIndex!.value = index
            : controller.currentIndex!.value = index;
        fromVoucherScreen ? (Get.offAllNamed<void>(Routes.HOME)) : null;
      },
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
            child: PhysicalShape(
              clipper: StarClipper(),
              color: Colors.blue,
              elevation: 1,
              shadowColor: AppColors.k1FAF9E,
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
              vendorHome
                  ? R.image.asset.ticket.assetName
                  : R.image.discount().assetName,
              height: 61.h,
              width: 61.w,
            ),
          ),
          activeIcon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: AppColors.k1FAF9E.withOpacity(0.4),
                    blurRadius: 20.sp,
                    offset: Offset(5, 5))
              ]),
              child: Image.asset(
                vendorHome
                    ? R.image.asset.ticket_click.assetName
                    : R.image.discoun_active().assetName,
                height: 61.h,
                width: 61.w,
              ),
            ),
          ),
          label: vendorHome ? 'Redeem' : 'Voucher',
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
              duration: Duration(milliseconds: 200),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: AppColors.k1FAF9E.withOpacity(0.4),
                    blurRadius: 20.sp,
                    offset: Offset(5, 5))
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

class StarClipper extends CustomClipper<Path> {
  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;

  @override
  Path getClip(Size size) => ShapeUtils.createHome(Size(61.w, 61.h));
}