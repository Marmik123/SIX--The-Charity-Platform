import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/ui/components/bottom_nav_bar.dart';
import 'package:six/app/ui/components/catched_image.dart';
import 'package:six/r.g.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        backgroundColor: AppColors.kffffff,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: AppColors.kffffff,
            boxShadow: [
              BoxShadow(
                spreadRadius: 1.5.sp,
                color: AppColors.k1FAF9E.withOpacity(0.15),
              )
            ],
          ),
          child: bottomNavBar(controller),
        ),
        extendBodyBehindAppBar: true,
        body: Column(
          children: [
            Container(
              width: 1125.w,
              height: 1265.h,
              color: AppColors.kE3FCFF,
              child: Column(
                children: [
                  SizedBox(
                    height: 120.h,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 66.w,
                      ),
                      Image.asset(
                        R.image.six_logo().assetName,
                        height: 77.h,
                        width: 170.w,
                      ),
                      SizedBox(
                        width: 669.w,
                      ),
                      Container(
                        width: 160.w,
                        height: 160.h,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.asset(
                            R.image.bell().assetName,
                            height: 20,
                            width: 20,
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: AppColors.kffffff,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 40.sp,
                                color: AppColors.kD1EFF2.withOpacity(0.8),
                                offset: Offset(0, 20),
                              )
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(70.r))),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 57.h,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 520.r,
                        height: 520.r,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.kC7E8EB,
                              spreadRadius: 1,
                            ),
                            BoxShadow(
                              color: AppColors.kffffff,
                              offset: Offset(4, 5),
                            ),
                            BoxShadow(
                              color: AppColors.kD4FAFF,
                              spreadRadius: 3,
                              offset: Offset(0, 2),
                              blurRadius: 12.0,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.kffffff,
                            width: 8.w,
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.kffffff,
                                offset: Offset(-2, -1),
                                blurRadius: 15),
                            BoxShadow(
                              color: AppColors.kCFE3E5,
                              blurRadius: 5,
                              offset: Offset(3, 2),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(80),
                          child: cacheImage(
                            width: 400.r,
                            height: 400.r,
                            url: 'https://picsum.photos/id/1027/400',
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 45.h,
                  ),
                  Text(
                    'Hi, Peter Lim',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 65.sp,
                      fontStyle: FontStyle.normal,
                      color: AppColors.k033660,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Welcome back!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 40.sp,
                      fontStyle: FontStyle.normal,
                      color: AppColors.k033660,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            )
          ],
        )));
  }
}
