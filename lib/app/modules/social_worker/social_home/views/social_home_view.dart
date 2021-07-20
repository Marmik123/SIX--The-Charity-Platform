import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/modules/charity/purchase/views/purchase_view.dart';
import 'package:six/app/modules/needy_family/profile/views/profile_view.dart';
import 'package:six/app/routes/app_pages.dart';
import 'package:six/app/ui/components/bottom_nav_bar.dart';
import 'package:six/app/ui/components/catched_image.dart';
import 'package:six/app/ui/components/month_picker.dart';
import 'package:six/app/ui/components/month_picker_dialog.dart';
import 'package:six/app/ui/components/sizedbox.dart';
import 'package:six/app/ui/components/vendor_home_curved_cont.dart';
import 'package:six/r.g.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

import '../controllers/social_home_controller.dart';

class SocialHomeView extends GetView<SocialHomeController> {
  final List<Widget> bottomScreen = <Widget>[
    SocialHome(),
    PurchaseView(
      whichScreen: 'Social',
    ),
    ProfileView(
      whichScreen: 'Social Worker',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          bottomNavigationBar: controller.paid()
              ? const SizedBox.shrink()
              : bottomNavBar(
                  whichScreen: 'Social',
                ),
          backgroundColor: AppColors.kffffff,
          body: bottomScreen.elementAt(controller.currentIndex!())),
    );
  }
}

class SocialHome extends StatelessWidget {
  final SocialHomeController controller = Get.put(SocialHomeController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: 1125.w,
                height: 710.h,
                color: Colors.transparent,
              ),
              Positioned(
                top: 0,
                child: Container(
                  width: 1125.w,
                  height: 600.h,
                  color: AppColors.kE3FCFF,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 132.h,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 60.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed<void>(Routes.VENDOR_HOME);
                            },
                            child: Image.asset(
                              R.image.six_logo().assetName,
                              height: 77.h,
                              width: 170.w,
                            ),
                          ),
                          SizedBox(
                            width: 675.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed<void>(Routes.NOTIFICATION);
                            },
                            child: Container(
                              width: 160.w,
                              height: 160.h,
                              decoration: BoxDecoration(
                                  color: AppColors.kffffff,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 40.sp,
                                      color: AppColors.kD1EFF2.withOpacity(0.8),
                                      offset: const Offset(0, 20),
                                    )
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(70.r))),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Image.asset(
                                  R.image.bell().assetName,
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 57.h,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 337.h,
                child: GestureDetector(
                  onTap: () {
                    monthPickerDialog(
                      context: context,
                      selectedDate: controller.selectedDate,
                    ).then(
                        (value) => controller.assignMonth(value?.month ?? 1));
                  },
                  child: monthPicker(
                    color: AppColors.kffffff,
                    borderColor: AppColors.kE3FCFF,
                    height: 80.h,
                    shadowColor: AppColors.k0A9988,
                    width: 390.w,
                    whichScreen: '',
                    textContent: Text(
                      '${controller.monthName()}, ${controller.selectedDate.year}',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 40.sp,
                        fontStyle: FontStyle.normal,
                        color: AppColors.k1FAF9E,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTapArrow: () {},
                  ),
                ),
              ),
              Positioned(
                top: 398.h,
                child: Container(
                  height: 350.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.r),
                    child: CustomPaint(
                      size: Size(
                          1005.w,
                          (1005.w * 0.5870646766169154)
                              .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                      painter: VendorHomeCurved(),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 40.w,
                          ),
                          Column(
                            //crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 90.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed<void>(
                                          Routes.AVAILABLE_CREDITS);
                                    },
                                    child: Container(
                                      height: 220.h,
                                      width: 452.5.w,
                                      decoration: BoxDecoration(
                                        color:
                                            AppColors.kffffff.withOpacity(0.2),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.k00474E
                                                .withOpacity(0.04),
                                            offset: const Offset(0, 20),
                                            blurRadius: 50.r,
                                          ),
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(50.r),
                                      ),
                                      child: Center(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 53.h,
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                  text: '\$',
                                                  style: TextStyle(
                                                    fontFamily: 'Gilroy',
                                                    fontSize: 60.sp,
                                                    fontStyle: FontStyle.normal,
                                                    color: AppColors.kffffff
                                                        .withOpacity(0.5),
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                        text: '7,500',
                                                        style: TextStyle(
                                                          fontFamily: 'Gilroy',
                                                          fontSize: 60.sp,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          color:
                                                              AppColors.kffffff,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ))
                                                  ]),
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Text(
                                              'Available Credits',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Gilroy',
                                                fontSize: 35.sp,
                                                fontStyle: FontStyle.normal,
                                                color: AppColors.kffffff
                                                    .withOpacity(0.7),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.5.w,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      //Get.toNamed<void>(Routes.ADD_NOTE);
                                    },
                                    child: Container(
                                      height: 220.h,
                                      width: 452.5.w,
                                      decoration: BoxDecoration(
                                        color:
                                            AppColors.kffffff.withOpacity(0.2),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.k00474E
                                                .withOpacity(0.04),
                                            offset: const Offset(0, 20),
                                            blurRadius: 50.r,
                                          ),
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(50.r),
                                      ),
                                      child: Center(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 53.h,
                                            ),
                                            Text(
                                              '25',
                                              style: TextStyle(
                                                fontFamily: 'Gilroy',
                                                fontSize: 60.sp,
                                                fontStyle: FontStyle.normal,
                                                color: AppColors.kffffff,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Text(
                                              'Total Beneficiaries',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Gilroy',
                                                fontSize: 35.sp,
                                                fontStyle: FontStyle.normal,
                                                color: AppColors.kffffff
                                                    .withOpacity(0.7),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 39.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          h(80.h),
          Padding(
            padding: const EdgeInsets.only(right: 185.0),
            child: Text(
              'My Beneficiaries',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 60.sp,
                fontStyle: FontStyle.normal,
                color: AppColors.k033660.withOpacity(0.5),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          h(34.h),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(0),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Get.toNamed<void>(Routes.BENEFICIARY_DETAILS);
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topLeft,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 38.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 0.0),
                            child: Container(
                                height: 319.h,
                                width: 970.w,
                                decoration: BoxDecoration(
                                    color: AppColors.kffffff,
                                    boxShadow: [
                                      BoxShadow(
                                          color: AppColors.k00474E
                                              .withOpacity(0.04),
                                          blurRadius: 50.r,
                                          offset: const Offset(0, 20))
                                    ],
                                    borderRadius: BorderRadius.circular(50.r)),
                                child: Row(
                                  children: [
                                    w(81.w),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        h(30.h),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            w(50.w),
                                            Text(
                                              'Peter Lim',
                                              style: TextStyle(
                                                fontFamily: 'Gilroy',
                                                fontSize: 50.sp,
                                                fontStyle: FontStyle.normal,
                                                color: AppColors.k033660,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            w(80.w),
                                            GestureDetector(
                                              onTap: () {
                                                url_launcher.launch(
                                                    'tel://+65-9324573');
                                              },
                                              child: Container(
                                                height: 80.w,
                                                width: 388.h,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100.r),
                                                  color: AppColors.k13A89E
                                                      .withOpacity(0.1),
                                                ),
                                                child: Center(
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      w(35.w),
                                                      Image.asset(
                                                        R.image.asset.call
                                                            .assetName,
                                                        height: 35.r,
                                                        width: 35.r,
                                                      ),
                                                      w(10.w),
                                                      Text(
                                                        '+65-9324573',
                                                        style: TextStyle(
                                                          fontFamily: 'Gilroy',
                                                          fontSize: 38.sp,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          color: AppColors
                                                              .k13A89E
                                                              .withOpacity(0.7),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            w(35.w),
                                            GestureDetector(
                                              onTap: () {},
                                              child: const Icon(
                                                Icons
                                                    .keyboard_arrow_right_sharp,
                                                color: AppColors.k4F7290,
                                                size: 25,
                                              ),
                                            )
                                          ],
                                        ),
                                        h(10.h),
                                        GestureDetector(
                                          onTap: () {
                                            controller.launchURL();
                                          },
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 50.w,
                                              ),
                                              Image.asset(
                                                R.image.asset.message.assetName,
                                                height: 33.h,
                                                width: 37.w,
                                              ),
                                              w(15.w),
                                              Text(
                                                'peterlim@gmail.com',
                                                style: TextStyle(
                                                  fontFamily: 'Gilroy',
                                                  fontSize: 38.sp,
                                                  fontStyle: FontStyle.normal,
                                                  color: AppColors.k033660
                                                      .withOpacity(0.7),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.center,
                                              )
                                            ],
                                          ),
                                        ),
                                        h(25.h),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 50.w,
                                            ),
                                            Image.asset(
                                              R.image.asset.location.assetName,
                                              height: 37.h,
                                              width: 31.w,
                                            ),
                                            w(15.w),
                                            Text(
                                              '1 Joo koon cir, 13-01 Fairprice hub, Singapore\n629117',
                                              style: TextStyle(
                                                fontFamily: 'Gilroy',
                                                fontSize: 38.sp,
                                                fontStyle: FontStyle.normal,
                                                color: AppColors.k033660
                                                    .withOpacity(0.7),
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.left,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 129.h,
                      right: 0.81.sw,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.kffffff,
                              width: 8.w,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.k001F22.withOpacity(0.03),
                                blurRadius: 25.r,
                                offset: Offset(10.sp, 25.sp),
                              ),
                            ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: cacheImage(
                              height: 180.r,
                              width: 180.r,
                              url: 'https://picsum.photos/id/1027/180'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              separatorBuilder: (context, index) => h(15.h),
              itemCount: 10,
            ),
          )
        ],
      ),
    );
  }
}