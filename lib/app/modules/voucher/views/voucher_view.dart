import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/ui/components/bottom_nav_bar.dart';
import 'package:six/app/ui/components/catched_image.dart';
import 'package:six/app/ui/components/voucher_container.dart';
import 'package:six/r.g.dart';

import '../controllers/voucher_controller.dart';

class VoucherView extends GetView<VoucherController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: bottomNavBar(),
        backgroundColor: AppColors.kffffff,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              overflow: Overflow.visible,
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: 1125.w,
                  color: AppColors.kF2FEFF,
                  height: 440.h,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 467.w,
                        ),
                        Text(
                          ' Voucher',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 50.sp,
                            fontStyle: FontStyle.normal,
                            color: AppColors.k033660,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 247.w,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 160.w,
                            height: 160.h,
                            decoration: BoxDecoration(
                                color: AppColors.kffffff,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 40.r,
                                    color: AppColors.k00474E.withOpacity(0.08),
                                    offset: Offset(0, 20),
                                  )
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(70.r))),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset(
                                R.image.voucher_filter().assetName,
                                height: 20,
                                width: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: -40,
                  left: -60,
                  right: 0,
                  top: 80,
                  child: Container(
                    height: 315.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding:
                          const EdgeInsets.only(top: 10, left: 70, right: 10),
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) => Row(
                        children: [
                          Container(
                            width: 380.w,
                            height: 315.h,
                            decoration: BoxDecoration(
                                color: AppColors.kffffff,
                                borderRadius: BorderRadius.circular(50.r),
                                gradient: LinearGradient(
                                    begin: Alignment(-1, -2.8),
                                    end: Alignment(1, 2),
                                    colors: [
                                      AppColors.k1FAF9E,
                                      AppColors.k0087FF
                                    ]),
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          AppColors.k000000.withOpacity(0.04),
                                      blurRadius: 50.r,
                                      offset: Offset(0, 20))
                                ]),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 40.h,
                                ),
                                Image.asset(
                                  R.image.asset.voucher_card_1.assetName,
                                  height: 113.h,
                                  width: 104.w,
                                ),
                                SizedBox(
                                  height: 30.5.h,
                                ),
                                Text(
                                  'Super - Market',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontSize: 40.sp,
                                    fontStyle: FontStyle.normal,
                                    color: AppColors.kffffff,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 25.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 140.h,
            ),
            CustomPaint(
              child: Padding(
                padding: const EdgeInsets.only(right: 28, bottom: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 49.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: Stack(
                        children: [
                          Container(
                            child: Center(
                              child: Text(
                                'NTUC Fairprice',
                                style: TextStyle(
                                  fontFamily: 'Gilroy',
                                  fontSize: 50.sp,
                                  fontStyle: FontStyle.normal,
                                  color: AppColors.k033660,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            width: 515.w,
                            height: 139.h,
                            decoration: BoxDecoration(
                                color: AppColors.kF8FAFA,
                                borderRadius: BorderRadius.circular(50.r)),
                          ),
                          Positioned(
                            left: -15,
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: cacheImage(
                                      height: 121.r,
                                      width: 121.r,
                                      url:
                                          'https://picsum.photos/id/1011/200/300'),
                                ),
                              ),
                            ),
                          ),
                        ],
                        overflow: Overflow.visible,
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    SizedBox(
                      height: 43.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 60.w,
                        ),
                        Text(
                          '\$10',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 100.sp,
                            fontStyle: FontStyle.normal,
                            color: AppColors.k033660,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 144.w,
                        ),
                        Container(
                          width: 81.w,
                          color: AppColors.k000000,
                        ),
                        SizedBox(
                          width: 150.w,
                        ),
                        Column(
                          children: [
                            RichText(
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                  text: 'Expire Date :',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontSize: 40.sp,
                                    color: AppColors.k033660.withOpacity(0.6),
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: ' 1,Nov 2021',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontSize: 40.sp,
                                    color: AppColors.k033660,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ]),
                            ),
                            RichText(
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                  text: 'Voucher Code :',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontSize: 40.sp,
                                    color: AppColors.k033660.withOpacity(0.6),
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: ' 15015403',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontSize: 40.sp,
                                    color: AppColors.k033660,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ]),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 52.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.kD4FAFF,
                        border: Border.all(
                          color: AppColors.kD4FAFF,
                        ),
                      ),
                      height: 105.h,
                      width: 900.w,
                      alignment: Alignment.center,
                    ),
                  ],
                ),
              ),
              size: Size(
                  1005.w,
                  (1005.w * 0.6755980861244019)
                      .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: VoucherContainer(),
            )
          ],
        ));
  }
}
