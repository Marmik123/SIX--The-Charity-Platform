import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/modules/social_worker/assigned_voucher/controllers/assigned_voucher_controller.dart';
import 'package:six/app/ui/components/action_dialog.dart';
import 'package:six/app/ui/components/catched_image.dart';
import 'package:six/app/ui/components/common_appbar.dart';
import 'package:six/app/ui/components/purchase_bottomsheet.dart';
import 'package:six/app/ui/components/rounded_gradient_btn.dart';
import 'package:six/app/ui/components/sizedbox.dart';
import 'package:six/r.g.dart';

class VoucherDetailsView extends GetView<AssignedVoucherController> {
  @override
  final AssignedVoucherController controller =
      Get.put(AssignedVoucherController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.kffffff,
            appBar: appBar(
              title: 'Details',
              height: 100.h,
              disableBackIcon: false,
            ),
            body: Column(
              children: [
                Container(
                  height: 598.h,
                  width: 1125.w,
                  color: AppColors.kF2FEFF,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: 20,
                        child: Container(
                          width: 1005.w,
                          height: 386.h,
                          decoration: BoxDecoration(
                            color: AppColors.kffffff,
                            borderRadius: BorderRadius.circular(50.r),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.k00474E.withOpacity(0.04),
                                offset: const Offset(0, 20),
                                blurRadius: 50.r,
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 18.0),
                            child: Container(
                              width: 1005.w,
                              height: 150.h,
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
                                              borderRadius:
                                                  BorderRadius.circular(50.r)),
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
                                        ),
                                        Positioned(
                                          left: -15,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              child: FittedBox(
                                                fit: BoxFit.fill,
                                                child: cacheImage(
                                                  height: 121.r,
                                                  width: 121.r,
                                                  url:
                                                      'https://picsum.photos/id/1011/180',
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
                                          '\$${10.toString()}',
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
                                          height: 81.h,
                                          width: 3.w,
                                          color: AppColors.k6886A0
                                              .withOpacity(0.5),
                                        ),
                                        SizedBox(
                                          width: 166.w,
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                            children: [
                                              FittedBox(
                                                child: RichText(
                                                  text: TextSpan(children: <
                                                      TextSpan>[
                                                    TextSpan(
                                                      text: 'Expire Date : ',
                                                      style: TextStyle(
                                                        fontFamily: 'Gilroy',
                                                        fontSize: 40.sp,
                                                        color: AppColors.k033660
                                                            .withOpacity(0.6),
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: '1, Nov 2021',
                                                      style: TextStyle(
                                                        fontFamily: 'Gilroy',
                                                        fontSize: 40.sp,
                                                        color:
                                                            AppColors.k033660,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    )
                                                  ]),
                                                ),
                                              ),
                                              h(14.h),
                                              FittedBox(
                                                fit: BoxFit.contain,
                                                child: Column(
                                                  children: [
                                                    FittedBox(
                                                      child: RichText(
                                                        text:
                                                            TextSpan(children: <
                                                                TextSpan>[
                                                          TextSpan(
                                                            text:
                                                                'Voucher Code : ',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Gilroy',
                                                              fontSize: 40.sp,
                                                              color: AppColors
                                                                  .k033660
                                                                  .withOpacity(
                                                                      0.6),
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: '15015403',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Gilroy',
                                                              fontSize: 40.sp,
                                                              color: AppColors
                                                                  .k033660,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          )
                                                        ]),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
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
                        ),
                      ),
                      Positioned(
                        bottom: -15,
                        child: DottedBorder(
                          radius: Radius.circular(40.r),
                          color: AppColors.k14A1BE,
                          strokeCap: StrokeCap.round,
                          dashPattern: const [3, 3],
                          borderType: BorderType.RRect,
                          strokeWidth: 5.sp,
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.kffffff,
                                /*border: Border.all(
                                color: AppColors.kD7FBFF,
                              ),*/
                                borderRadius: BorderRadius.circular(30.r)),
                            height: 105.h,
                            width: /*whichScreen == 'QRScreen' ? 880.w : */ 920
                                .w,
                            alignment: Alignment.center,
                            child: Obx(() => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (controller.voucherCount() > 0) {
                                          controller.voucherCount.value--;
                                        }
                                      },
                                      child: Container(
                                        height: 70.r,
                                        width: 70.r,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: controller.voucherCount() == 0
                                              ? AppColors.kffffff
                                              : AppColors.k14A1BE,
                                        ),
                                        child: Icon(
                                          Icons.remove,
                                          size: 15,
                                          color: controller.voucherCount() == 0
                                              ? AppColors.k14A1BE
                                              : AppColors.kffffff,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      controller.voucherCount.value.toString(),
                                      style: TextStyle(
                                        fontFamily: 'Gilroy',
                                        fontSize: 50.sp,
                                        fontStyle: FontStyle.normal,
                                        color: AppColors.k13A89E,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        controller.voucherCount.value++;
                                      },
                                      child: Container(
                                        height: 70.r,
                                        width: 70.r,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: controller.voucherCount() == 0
                                              ? AppColors.kffffff
                                              : AppColors.k14A1BE,
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          size: 15,
                                          color: controller.voucherCount() == 0
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
                    ],
                  ),
                ),
                h(138.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Terms & Conditions',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 60.sp,
                        fontStyle: FontStyle.normal,
                        color: AppColors.k033660.withOpacity(0.5),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    h(50.h),
                    Container(
                      width: 1005.w,
                      height: 670.h,
                      decoration: BoxDecoration(
                        color: AppColors.kffffff,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 20),
                            blurRadius: 50.r,
                            color: AppColors.k00474E.withOpacity(0.04),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Excepteur sint occaecat cupidatat non proident,\nsunt in culpa qui officia deserunt mollit anim id est\nlaborum.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 42.sp,
                            fontStyle: FontStyle.normal,
                            color: AppColors.k444444,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    h(454.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 85.0),
                      child: roundedButton(
                        text: 'Pay Now',
                        onTap: () {
                          controller.purchasePressed(true);
                          purchaseBottomSheet(whichScreen: 'Social');
                        },
                        width: 500.w,
                        height: 150.h,
                        fontSize: 50.sp,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          controller.purchasePressed.value
              ? BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20.r, sigmaY: 20.r),
                  child: Container(
                    height: 1.sh,
                    width: 1.sw,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.k0087A1.withOpacity(0.4),
                          offset: const Offset(0, 2),
                          blurRadius: 40.r,
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
          controller.paid.value
              ? BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20.r, sigmaY: 20.r),
                  child: Container(
                    height: 1.sh,
                    width: 1.sw,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.k0087A1.withOpacity(0.6),
                          offset: const Offset(0, 4),
                          blurRadius: 4.r,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Material(
                        color: Colors.transparent,
                        child: actionDialog(
                          whichScreen: 'Charity',
                          onTapCancel: () {
                            controller.purchasePressed.value = false;
                            controller.paid.value = false;
                          },
                          dialogTypeText: 'Success!',
                          assetName: R.image.asset.success_redem.assetName,
                          text:
                              'You have successfully purchased NTUC\nFairprice vouchers',
                        ),
                        /*successDialog(
                              text: 'Voucher has been successfully\nredeemed.',
                              assetName: R.image.asset.success_redem.assetName,
                              onTapCancel: () {
                                controller.purchasePressed.value = false;
                                controller.paid.value = false;
                              })*/ //SUCCESS DIALOG
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
