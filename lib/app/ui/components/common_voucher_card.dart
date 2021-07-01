import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/ui/components/catched_image.dart';
import 'package:six/app/ui/components/voucher_container_paint.dart';

enum VoucherState {
  active,
  expired,
  redeemed,
}

Widget voucherCard({
  required String title,
  required String imgUrl,
  required double amount,
  required String voucherCode,
  required String date,
  required VoidCallback onTap,
  required VoucherState voucherState,
}) {
  return Stack(
    overflow: Overflow.visible,
    alignment: Alignment.bottomCenter,
    children: [
      /*Container(
        width: 940.w,
        color: AppColors.kffffff,
      ),*/
      Container(
        height: 690.h,
        child: CustomPaint(
          child: Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Container(
              width: 1005.w,
              child: Column(
                mainAxisSize: MainAxisSize.max,
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
                              title,
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
                                  url: imgUrl,
                                ),
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
                  FittedBox(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 60.w,
                        ),
                        Text(
                          '\$${amount.toString()}',
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
                          width: 42.w,
                        ),
                        Container(
                          height: 81.h,
                          width: 3.w,
                          color: AppColors.k6886A0.withOpacity(0.5),
                        ),
                        SizedBox(
                          width: 90.w,
                        ),
                        FittedBox(
                          fit: BoxFit.contain,
                          child: Column(
                            children: [
                              FittedBox(
                                child: RichText(
                                  text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                      text:
                                          '${voucherState == VoucherState.active ? 'Expire Date' : voucherState == VoucherState.redeemed ? 'Redeemed Date' : 'Expired Date'} : ',
                                      style: TextStyle(
                                        fontFamily: 'Gilroy',
                                        fontSize: 40.sp,
                                        color:
                                            AppColors.k033660.withOpacity(0.6),
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: date,
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
                              ),
                              FittedBox(
                                child: RichText(
                                  text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                      text: 'Voucher Code : ',
                                      style: TextStyle(
                                        fontFamily: 'Gilroy',
                                        fontSize: 40.sp,
                                        color:
                                            AppColors.k033660.withOpacity(0.6),
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: voucherCode,
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
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          size: Size(
              1005.w,
              (1005.w * 0.6755980861244019)
                  .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
          painter: VoucherContainer(voucherState == VoucherState.active
              ? AppColors.kE3FCFF
              : voucherState == VoucherState.redeemed
                  ? AppColors.kFFF5E7
                  : AppColors.kFFE7E7),
        ),
      ),
      Positioned(
        bottom: 232.h,
        left: 22.w,
        child: Container(
          width: 955.w,
          height: 3.h,
          color: voucherState == VoucherState.active
              ? AppColors.k14A1BE
              : voucherState == VoucherState.redeemed
                  ? AppColors.kEF9104
                  : AppColors.kEF0404,
        ),
      ),
      Positioned(
        bottom: 110.h,
        right: 96.w,
        child: Column(
          children: [
            InkWell(
              onTap: onTap,
              child: DottedBorder(
                radius: Radius.circular(40.r),
                color: voucherState == VoucherState.active
                    ? AppColors.k14A1BE
                    : voucherState == VoucherState.redeemed
                        ? AppColors.kEF9104
                        : AppColors.kff0000,
                strokeCap: StrokeCap.round,
                dashPattern: [3, 3],
                borderType: BorderType.RRect,
                strokeWidth: 5.sp,
                child: Container(
                  decoration: BoxDecoration(
                      color: voucherState == VoucherState.active
                          ? AppColors.kD7FBFF
                          : voucherState == VoucherState.redeemed
                              ? AppColors.kFFEFD7
                              : AppColors.kFFD7D7,
                      /*border: Border.all(
                        color: AppColors.kD7FBFF,
                      ),*/
                      borderRadius: BorderRadius.circular(30.r)),
                  height: 105.h,
                  width: 920.w,
                  alignment: Alignment.center,
                  child: Text(
                    voucherState == VoucherState.active
                        ? 'Redeem Now'
                        : voucherState == VoucherState.redeemed
                            ? 'Already Redeemed'
                            : 'Expired Voucher',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 50.sp,
                      fontStyle: FontStyle.normal,
                      color: voucherState == VoucherState.active
                          ? AppColors.k13A89E
                          : voucherState == VoucherState.redeemed
                              ? AppColors.kEF9104
                              : AppColors.kEF0404,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              'Click here for Terms & Conditions',
              style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 35.sp,
                  fontStyle: FontStyle.normal,
                  color: AppColors.k033660,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      )
    ],
  );
}
