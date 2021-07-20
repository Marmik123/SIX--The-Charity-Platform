import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/modules/social_worker/social_home/controllers/social_home_controller.dart';
import 'package:six/app/ui/components/catched_image.dart';
import 'package:six/app/ui/components/tab_item_social_worker.dart';
import 'package:six/r.g.dart';

import '../controllers/vendor_details_controller.dart';

class VendorDetailsDView extends GetView<VendorDetailsController> {
  final SocialHomeController socialCtrl = Get.put(SocialHomeController());
  final String whichScreen;

  VendorDetailsDView({required this.whichScreen});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kffffff,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 1134.h,
                    width: 1125.w,
                    color: AppColors.kE3FCFF,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 170.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 60.w,
                            ),
                            const Icon(
                              Icons.arrow_back,
                              color: AppColors.k033660,
                            ),
                            SizedBox(
                              width: 373.w,
                            ),
                            Text(
                              'Details',
                              maxLines: 1,
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 50.sp,
                                fontStyle: FontStyle.normal,
                                color: AppColors.k033660,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(200.r),
                              child: cacheImage(
                                height: 380.r,
                                width: 380.r,
                                url: 'https://picsum.photos/id/1011/180',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                        Text(
                          'NTUC Fairprice',
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
                        Container(
                          height: 64.h,
                          width: 226.w,
                          decoration: BoxDecoration(
                            color: AppColors.kffffff,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Center(
                            child: Text(
                              'Super Market',
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 30.sp,
                                fontStyle: FontStyle.normal,
                                color: AppColors.kFF007A,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 80.h,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 944.h,
                    child: Container(
                      width: 1005.w,
                      height: 384.h,
                      decoration: BoxDecoration(
                          color: AppColors.kffffff,
                          borderRadius: BorderRadius.circular(50.r),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.k00474E.withOpacity(0.04),
                              offset: const Offset(0, 20),
                              blurRadius: 50.r,
                            )
                          ]),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 54.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 50.w,
                              ),
                              Image.asset(
                                R.image.asset.message.assetName,
                                height: 39.h,
                                width: 44.w,
                              ),
                              SizedBox(
                                width: 26.w,
                              ),
                              Text(
                                'contact@ntuc.com',
                                style: TextStyle(
                                  fontFamily: 'Gilroy',
                                  fontSize: 40.sp,
                                  fontStyle: FontStyle.normal,
                                  color: AppColors.k033660,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 50.w,
                              ),
                              Image.asset(
                                R.image.asset.call.assetName,
                                height: 39.h,
                                width: 44.w,
                              ),
                              SizedBox(
                                width: 26.w,
                              ),
                              Text(
                                '+1 987 654 3210',
                                style: TextStyle(
                                  fontFamily: 'Gilroy',
                                  fontSize: 40.sp,
                                  fontStyle: FontStyle.normal,
                                  color: AppColors.k033660,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 60.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 50.w,
                              ),
                              Image.asset(
                                R.image.asset.location.assetName,
                                height: 39.h,
                                width: 44.w,
                              ),
                              SizedBox(
                                width: 26.w,
                              ),
                              Text(
                                '1 Joo koon cir, 13-01 Fairprice hub, Singapore\n629117',
                                style: TextStyle(
                                  fontFamily: 'Gilroy',
                                  fontSize: 40.sp,
                                  fontStyle: FontStyle.normal,
                                  color: AppColors.k033660,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 269.h,
              ),
              whichScreen == 'Charity'
                  ? Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'About Us',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 60.sp,
                          fontStyle: FontStyle.normal,
                          color: AppColors.k033660.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : Obx(
                      () => DefaultTabController(
                        length: 2,
                        child: TabBar(
                          physics: const NeverScrollableScrollPhysics(),
                          isScrollable: false,
                          indicator: UnderlineTabIndicator(
                            insets: EdgeInsets.only(left: 45.w, right: 45.w),
                            borderSide: const BorderSide(
                              color: AppColors.k13A89E,
                              width: 2,
                            ),
                          ),
                          onTap: (index) {
                            socialCtrl.tabIndex!.value = index;
                          },
                          tabs: List.generate(
                            2,
                            (index) => Container(
                              //color: AppColors.kffffff,
                              height: 110.h,
                              width: 1.sw,
                              child: tabItem(
                                  controller.text[index],
                                  controller.textNewLine[index],
                                  index,
                                  whichScreen),
                            ),
                          ),
                        ),
                      ),
                    ),
              SizedBox(
                height: 40.h,
              ),
              Container(
                height: 900.h,
                width: 0.99.sw,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing\nelit, sed do eiusmod tempor incididunt ut labore et\ndolore magna aliqua. Ut enim ad minim veniam,\nquis nostrud exercitation ullamco laboris nisi ut\naliquip ex ea commodo consequat. ',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 42.sp,
                        fontStyle: FontStyle.normal,
                        color: AppColors.k6886A0,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
