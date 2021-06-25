import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/ui/components/bottom_nav_bar.dart';
import 'package:six/app/ui/components/catched_image.dart';
import 'package:six/app/ui/components/category_card.dart';
import 'package:six/app/ui/components/curved_container.dart';
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
          child: bottomNavBar(),
        ),
        extendBodyBehindAppBar: true,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              overflow: Overflow.visible,
              alignment: Alignment.bottomCenter,
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
                      ),
                      SizedBox(
                        height: 70.h,
                      ),
                      Container(
                        height: 80.h,
                        width: 390.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Sept, ${DateTime.now().year}',
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 40.sp,
                                fontStyle: FontStyle.normal,
                                color: AppColors.k1FAF9E,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: AppColors.k033660,
                              size: 20,
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: AppColors.kffffff,
                            borderRadius: BorderRadius.circular(30.r),
                            border: Border.all(
                              color: AppColors.kE3FCFF,
                              width: 5.sp,
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.k0A9988,
                                  blurRadius: 30.r,
                                  offset: Offset(0, 25.sp))
                            ]),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: -110.h,
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed<void>('/available-credits');
                    },
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: AppColors.k000000.withOpacity(0.25),
                            blurRadius: 4.r,
                            spreadRadius: -32.r,
                            offset: Offset(0, 40.h))
                      ], borderRadius: BorderRadius.circular(10.r)),
                      child: CustomPaint(
                          child: Container(
                            width: 1005.w,
                            height: 220.h,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 60.w,
                                  ),
                                  Text(
                                    'Total Credits Available',
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize: 50.sp,
                                      fontStyle: FontStyle.normal,
                                      color: AppColors.kffffff,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    width: 134.w,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '\$',
                                        style: TextStyle(
                                          fontFamily: 'Gilroy',
                                          fontSize: 60.sp,
                                          fontStyle: FontStyle.normal,
                                          color: AppColors.kffffff,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        '280',
                                        style: TextStyle(
                                          fontFamily: 'Gilroy',
                                          fontSize: 60.sp,
                                          fontStyle: FontStyle.normal,
                                          color: AppColors.kffffff,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 2.0),
                                        child: Text(
                                          '/500',
                                          style: TextStyle(
                                            fontFamily: 'Gilroy',
                                            fontSize: 40.sp,
                                            fontStyle: FontStyle.normal,
                                            color: AppColors.kffffff,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed<void>('/available-credits');
                                    },
                                    child: Icon(
                                      Icons.keyboard_arrow_right_sharp,
                                      color: AppColors.kffffff,
                                      size: 25,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          size: Size(
                              1005.w,
                              (1005.w * 0.21890547263681592)
                                  .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                          painter: CurvedContainer()),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 190.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text(
                'Your Available Credits',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 60.sp,
                  fontStyle: FontStyle.normal,
                  color: AppColors.k033660.withOpacity(0.5),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Container(
                height: 565.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: categoryCard(
                      index: index,
                      image: Image.asset(
                        R.image.asset.super_market.assetName,
                        height: 130.h,
                        width: 120.w,
                      ),
                      background: AppColors.kFF007A.withOpacity(0.05),
                      categoryName: 'Super - Market',
                      creditsRemaining: 100,
                      totalCredits: 300,
                      accent: AppColors.kFBEEF4,
                      shadow: AppColors.kEED2E0,
                      foreground: AppColors.kFF007A,
                    ),
                  ),
                ),
              ),
            )
          ],
        )));
  }
}
