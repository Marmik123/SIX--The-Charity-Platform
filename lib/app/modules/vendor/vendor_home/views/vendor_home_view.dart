import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/modules/needy_family/profile/views/profile_view.dart';
import 'package:six/app/modules/vendor/vendor_redeem/controllers/vendor_redeem_controller.dart';
import 'package:six/app/modules/vendor/vendor_redeem/views/vendor_redeem_view.dart';
import 'package:six/app/ui/components/bottom_nav_bar.dart';
import 'package:six/app/ui/components/month_picker.dart';
import 'package:six/app/ui/components/vendor_home_curved_cont.dart';
import 'package:six/r.g.dart';

import '../controllers/vendor_home_controller.dart';

class VendorHomeView extends GetView<VendorHomeController> {
  VendorRedeemController vendorRCtrl = Get.put(VendorRedeemController());
  List<Widget> bottomNavScreen = <Widget>[
    VendorHome(),
    VendorRedeemView(),
    ProfileView(
      whichScreen: 'Vendor',
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.kffffff,
        bottomNavigationBar: !vendorRCtrl.redeemThroughNum.value
            ? bottomNavBar(whichScreen: 'Vendor')
            : SizedBox.shrink(),
        body: bottomNavScreen.elementAt(controller.currentIndex!.value),
      ),
    );
  }
}

class VendorHome extends StatelessWidget {
  const VendorHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          overflow: Overflow.visible,
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 677.h,
              width: 1125.w,
              color: AppColors.kE3FCFF,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 161.h,
                    ),
                    Image.asset(
                      R.image.asset.six_logo.assetName,
                      height: 77.h,
                      width: 170.w,
                    ),
                    SizedBox(
                      height: 98.h,
                    ),
                    monthPicker(
                      color: AppColors.kffffff,
                      borderColor: AppColors.kE3FCFF,
                      width: 390.w,
                      height: 80.h,
                      shadowColor: AppColors.k0A9988,
                      textContent: Text(
                        'Sept, ${DateTime.now().year}',
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
                  ],
                ),
              ),
            ),
            Positioned(
              top: 380.h,
              child: Container(
                height: 590.h,
                child: CustomPaint(
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
                          Container(
                            height: 220.h,
                            width: 926.w,
                            decoration: BoxDecoration(
                              color: AppColors.kffffff.withOpacity(0.2),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.k00474E.withOpacity(0.04),
                                  offset: Offset(0, 20),
                                  blurRadius: 50.r,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(50.r),
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
                                              text: '50,000',
                                              style: TextStyle(
                                                fontFamily: 'Gilroy',
                                                fontSize: 60.sp,
                                                fontStyle: FontStyle.normal,
                                                color: AppColors.kffffff,
                                                fontWeight: FontWeight.w700,
                                              ))
                                        ]),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Text(
                                    'Redeemed Amount',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize: 35.sp,
                                      fontStyle: FontStyle.normal,
                                      color: AppColors.kffffff.withOpacity(0.7),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 220.h,
                                width: 452.5.w,
                                decoration: BoxDecoration(
                                  color: AppColors.kffffff.withOpacity(0.2),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          AppColors.k00474E.withOpacity(0.04),
                                      offset: Offset(0, 20),
                                      blurRadius: 50.r,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(50.r),
                                ),
                                child: Center(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 53.h,
                                      ),
                                      Text(
                                        '350',
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
                                        'Redeemed Vouchers',
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
                              SizedBox(
                                width: 20.5.w,
                              ),
                              Container(
                                height: 220.h,
                                width: 452.5.w,
                                decoration: BoxDecoration(
                                  color: AppColors.kffffff.withOpacity(0.2),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          AppColors.k00474E.withOpacity(0.04),
                                      offset: Offset(0, 20),
                                      blurRadius: 50.r,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(50.r),
                                ),
                                child: Center(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 53.h,
                                      ),
                                      Text(
                                        '130',
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
                                        'Active Vouchers',
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
                  size: Size(
                      1005.w,
                      (1005.w * 0.5870646766169154)
                          .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: VendorHomeCurved(),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 349.h,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Transactions',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Gilroy',
              fontSize: 60.sp,
              fontStyle: FontStyle.normal,
              color: AppColors.k033660.withOpacity(0.5),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 15,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      width: 1005.w,
                      height: 200.h,
                      decoration: BoxDecoration(
                        color: AppColors.kffffff,
                        borderRadius: BorderRadius.circular(50.r),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.k00474E.withOpacity(0.04),
                            offset: Offset(0, 20),
                            blurRadius: 50.r,
                          )
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 50.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 41.h,
                              ),
                              Text(
                                'Voucher code : 150154403',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Gilroy',
                                  fontSize: 50.sp,
                                  fontStyle: FontStyle.normal,
                                  color: AppColors.k033660,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 18.h,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    R.image.asset.calendar.assetName,
                                    height: 33.33.h,
                                    width: 30.w,
                                  ),
                                  SizedBox(
                                    width: 25.w,
                                  ),
                                  Text(
                                    '12 Apr, 2021',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize: 35.sp,
                                      fontStyle: FontStyle.normal,
                                      color: AppColors.k033660.withOpacity(0.7),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 25.w,
                                  ),
                                  Text(
                                    '06:32 PM',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize: 35.sp,
                                      fontStyle: FontStyle.normal,
                                      color: AppColors.k033660.withOpacity(0.7),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 265.w,
                          ),
                          Text(
                            '\$15',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontSize: 50.sp,
                              fontStyle: FontStyle.normal,
                              color: AppColors.k14A1BE,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                  ],
                );
              }),
        ),
      ],
    );
  }
}
