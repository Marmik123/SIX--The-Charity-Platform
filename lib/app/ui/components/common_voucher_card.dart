import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/local/user_provider.dart';
import 'package:six/app/modules/social_worker/distribute_voucher/controllers/distribute_voucher_controller.dart';
import 'package:six/app/ui/components/app_snackbar.dart';
import 'package:six/app/ui/components/catched_image.dart';
import 'package:six/app/ui/components/dialog_vocher_redeem.dart';
import 'package:six/app/ui/components/sizedbox.dart';
import 'package:six/app/ui/components/voucher_container_paint.dart';
import 'package:six/app/utils/material_prop_ext.dart';
import 'package:six/app/views/views/voucher_terms_view.dart';

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
  required String btnText,
  required String whichScreen,
  required bool isQRScreen,
  bool? isRedeemed,
  bool? dottedIsBlue,
  bool?
      closeDialog, // Close the voucher detail dialog which is coming on scanning QR.
  double? totalAvailable,
  int index = 0,
  DistributeVoucherController? voucherCtrlSW,
  String? beneficiaryName,
  String? terms,
  String? beneProfileUrl,
}) {
  /*DistributeVoucherController voucherCtrlSW =
      Get.put(DistributeVoucherController());
  */
  return Stack(
    clipBehavior: Clip.none,
    alignment: Alignment.bottomCenter,
    children: [
      /*Container(
        width: 940.w,
        color: AppColors.kffffff,
      ),*/
      Container(
        height: whichScreen == 'QRScreen'
            ? 743.h
            : whichScreen == 'redeemedVoucher'
                ? 750.w
                : 646.h,
        child: whichScreen == 'QRScreen' || whichScreen == 'History'
            ? CustomPaint(
                size: Size(
                    1005.w,
                    (1005.w * 0.7357466063348417)
                        .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: DialogVoucherRedeem(),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 18.0),
                  child: Container(
                    width: 1005.w,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: whichScreen == 'History' ? 40.h : 49.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 32.0),
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.centerLeft,
                            children: [
                              Container(
                                width: 515.w,
                                height: 139.h,
                                decoration: BoxDecoration(
                                    color: AppColors.kF8FAFA,
                                    borderRadius: BorderRadius.circular(50.r)),
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
                          ),
                        ),
                        SizedBox(
                          height: whichScreen == 'History' ? 15.w : 40.h,
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
                                width: 90.w,
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
                                              color: AppColors.k033660
                                                  .withOpacity(0.6),
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
                                    /*  FittedBox(
                                      child: RichText(
                                        text: TextSpan(children: <TextSpan>[
                                          TextSpan(
                                            text: 'Voucher Code : ',
                                            style: TextStyle(
                                              fontFamily: 'Gilroy',
                                              fontSize: 40.sp,
                                              color: AppColors.k033660
                                                  .withOpacity(0.6),
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
                                    )*/
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : CustomPaint(
                size: Size(
                    1005.w,
                    (1005.w * 0.6755980861244019)
                        .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: VoucherContainer(voucherState == VoucherState.active
                    ? dottedIsBlue ?? false
                        ? AppColors.kE3FCFF
                        : AppColors.kE7FFED
                    : voucherState == VoucherState.redeemed
                        ? AppColors.kE0F8FF
                        : AppColors.kFFE7E7),
                child: Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Container(
                    width: 1005.w,
                    height: whichScreen == 'redeemedVoucher' ? 350.h : 150.h,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 49.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 32.0),
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.centerLeft,
                            children: [
                              Container(
                                width: 515.w,
                                height: 139.h,
                                decoration: BoxDecoration(
                                    color: AppColors.kF8FAFA,
                                    borderRadius: BorderRadius.circular(50.r)),
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
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
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
                                              color: AppColors.k033660
                                                  .withOpacity(0.6),
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
                                    UserProvider.role == 'social_worker'
                                        ? const SizedBox.shrink()
                                        : FittedBox(
                                            child: SelectableText.rich(
                                              TextSpan(children: <TextSpan>[
                                                TextSpan(
                                                  text: 'Voucher Code : ',
                                                  style: TextStyle(
                                                    fontFamily: 'Gilroy',
                                                    fontSize: 40.sp,
                                                    color: AppColors.k033660
                                                        .withOpacity(0.6),
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
              ),
      ),
      Positioned(
        bottom: whichScreen == 'QRScreen'
            ? 318.h
            : whichScreen == 'History'
                ? 260.w
                : whichScreen == 'redeemedVoucher'
                    ? 270.h
                    : 220.h,
        left: whichScreen == 'QRScreen'
            ? 81.w
            : whichScreen == 'Social Worker'
                ? 20.w
                : whichScreen == 'History'
                    ? 100.w
                    : whichScreen == 'Assign Voucher'
                        ? 30.w
                        : 22.w,
        child: Container(
          width: whichScreen == 'QRScreen'
              ? 905.w
              : whichScreen == 'History'
                  ? 925.w
                  : 955.w,
          height: 3.h,
          color: voucherState == VoucherState.active
              ? AppColors.k14A1BE
              : voucherState == VoucherState.redeemed
                  ? AppColors.k0B92B8
                  : AppColors.kEF0404,
        ),
      ),
      Positioned(
        bottom: whichScreen == 'QRScreen'
            ? 195.h
            : whichScreen == 'History'
                ? 220.w
                : whichScreen == 'Assign Voucher' ||
                        whichScreen == 'Social Worker'
                    ? 45.w
                    : whichScreen == 'redeemedVoucher'
                        ? 100.h
                        : 45.h, //For Needy Family voucher card
        right: whichScreen == 'QRScreen'
            ? 86.w
            : whichScreen == 'Social Worker'
                ? 99.w
                : whichScreen == 'History'
                    ? 130.h
                    : whichScreen == 'Assign Voucher'
                        ? 105.w
                        : 96.w, //For Needy Family voucher card
        child: Column(
          children: [
            InkWell(
              onTap: onTap,
              child: DottedBorder(
                radius: Radius.circular(40.r),
                color: voucherState == VoucherState.active
                    ? dottedIsBlue ?? false
                        ? AppColors.k14A1BE
                        : AppColors.k11C502
                    : voucherState == VoucherState.redeemed
                        ? AppColors.k0B92B8
                        : AppColors.kff0000,
                strokeCap: StrokeCap.round,
                dashPattern: const [3, 3],
                borderType: BorderType.RRect,
                strokeWidth: 5.sp,
                child: Container(
                  decoration: BoxDecoration(
                      color: voucherState == VoucherState.active
                          ? dottedIsBlue ?? false
                              ? AppColors.kD7FBFF
                              : AppColors.kE7FFED
                          : voucherState == VoucherState.redeemed
                              ? AppColors.kE0F8FF
                              : AppColors.kFFD7D7,
                      /*border: Border.all(
                        color: AppColors.kD7FBFF,
                      ),*/
                      borderRadius: BorderRadius.circular(30.r)),
                  height: whichScreen == 'History' ? 80.h : 105.h,
                  width: whichScreen == 'QRScreen'
                      ? 880.w
                      : whichScreen == 'History'
                          ? 920.h
                          : 920.w,
                  alignment: Alignment.center,
                  child: UserProvider.role != 'social_worker' ||
                          whichScreen == 'Assign Voucher' ||
                          whichScreen == 'History'
                      ? Text(
                          btnText,
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: whichScreen == 'History' ? 42.sp : 50.sp,
                            fontStyle: FontStyle.normal,
                            color: voucherState == VoucherState.active
                                ? AppColors.k11C502
                                : voucherState == VoucherState.redeemed
                                    ? AppColors.k0B92B8
                                    : AppColors.kEF0404,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        )
                      : Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {
                                  logI(index);
                                  voucherCtrlSW?.voucherIndex(index);
                                  if (voucherCtrlSW!
                                          .initialVoucherCount[index] >
                                      0) {
                                    voucherCtrlSW.initialVoucherCount[index]--;
                                  }
                                },
                                icon: Container(
                                  height: 70.r,
                                  width: 70.r,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: voucherCtrlSW
                                                ?.initialVoucherCount[index] ==
                                            0
                                        ? AppColors.kffffff
                                        : AppColors.k14A1BE,
                                  ),
                                  child: Icon(
                                    Icons.remove,
                                    size: 15,
                                    color: voucherCtrlSW
                                                ?.initialVoucherCount[index] ==
                                            0
                                        ? AppColors.k14A1BE
                                        : AppColors.kffffff,
                                  ),
                                ),
                              ),
                              Text(
                                voucherCtrlSW?.initialVoucherCount[index]
                                        .toString() ??
                                    '0',
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
                              IconButton(
                                onPressed: () {
                                  logI(index);
                                  voucherCtrlSW?.voucherIndex(index);
                                  if (voucherCtrlSW!
                                          .initialVoucherCount[index] <
                                      totalAvailable!.toInt()) {
                                    voucherCtrlSW.initialVoucherCount[index]++;
                                  }
                                  if (voucherCtrlSW
                                          .initialVoucherCount[index] ==
                                      totalAvailable.toInt()) {
                                    appSnackbar(
                                      message: 'Maximum Limit Reached',
                                      snackbarState: SnackbarState.info,
                                    );
                                  }
                                  logWTF(voucherCtrlSW.initialVoucherCount);
                                },
                                icon: Container(
                                  height: 70.r,
                                  width: 70.r,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: voucherCtrlSW
                                                ?.initialVoucherCount[index] ==
                                            0
                                        ? AppColors.kffffff
                                        : AppColors.k14A1BE,
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    size: 15,
                                    color: voucherCtrlSW
                                                ?.initialVoucherCount[index] ==
                                            0
                                        ? AppColors.k14A1BE
                                        : AppColors.kffffff,
                                  ),
                                ),
                              ),
                            ],
                          )),
                ),
              ),
            ),
            whichScreen == 'History'
                ? const SizedBox.shrink()
                : TextButton(
                    onPressed: () {
                      if (closeDialog == true) {
                        Get.back<void>();
                      }
                      Get.to<void>(() => VoucherTerms(
                            name: title,
                            amount: amount,
                            date: date,
                            terms: terms,
                            iconUrl: imgUrl,
                            isRedeemed: isRedeemed,
                          ));
                    },
                    style: ButtonStyle(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: whichScreen == 'redeemedVoucher'
                          ? const EdgeInsets.only(bottom: 5).msp
                          : EdgeInsets.zero.msp,
                      overlayColor: Colors.transparent.msp,
                    ),
                    child: Text(
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
                  ),
          ],
        ),
      ),
      whichScreen == 'History'
          ? Positioned(
              left: 100.h,
              bottom: 70.h,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: beneProfileUrl == ''
                        ? CircleAvatar(
                            radius: 119.r,
                            child: const Icon(
                              Icons.person,
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: cacheImage(
                                height: 119.r,
                                width: 119.r,
                                url: beneProfileUrl!,
                              ),
                            ),
                          ),
                  ),
                  w(37.w),
                  Text(
                    beneficiaryName ?? 'NA',
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
            )
          : const SizedBox.shrink(),
    ],
  );
}
