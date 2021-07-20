import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/ui/components/action_dialog.dart';
import 'package:six/app/ui/components/common_appbar.dart';
import 'package:six/app/ui/components/common_textfield.dart';
import 'package:six/app/ui/components/common_voucher_card.dart';
import 'package:six/app/ui/components/rounded_gradient_btn.dart';
import 'package:six/r.g.dart';

import '../controllers/distribute_voucher_controller.dart';

class DistributeVoucherView extends GetView<DistributeVoucherController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: roundedButton(
              text: 'Confirm Now',
              onTap: () {
                controller.voucherAssigned(true);
                //Get.toNamed<void>(Routes.DISTRIBUTE_VOUCHER);
              },
              width: 452.w,
              height: 150.h,
              fontSize: 50.sp,
            ),
            backgroundColor: AppColors.kffffff,
            appBar: appBar(
              title: 'Voucher',
              height: 200.h,
              disableBackIcon: false,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      color: AppColors.kffffff,
                      width: 1.sw,
                      height: 0.20.sh,
                    ),
                    Positioned(
                      top: 0,
                      child: Container(
                        width: 1125.w,
                        color: AppColors.kF2FEFF,
                        height: 350.h,
                        child: Container(),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      child: Container(
                        width: 985.w,
                        height: 160.h,
                        child: textField(
                          context: context,
                          height: 250.h,
                          width: 1005.w,
                          initialValue: '',
                          prefixText: '',
                          hintText: 'Search',
                          prefixImageName: R.image.asset.search.assetName,
                          onTap: () {},
                          contentPadding: const EdgeInsets.only(
                            bottom: 5.0,
                          ),
                          textStyle: TextStyle(
                            fontSize: 35.sp,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w500,
                            color: AppColors.k6886A0,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 45.sp,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w500,
                            color: AppColors.k6886A0,
                          ),
                          keyBoardType: TextInputType.text,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -30,
                      left: -60,
                      right: 0,
                      top: 15,
                      child: Obx(
                        () => Container(
                          height: controller.height().h,
                          child: ListView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 70,
                              right: 10,
                            ),
                            itemCount: 10,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) => Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.selectedCategory(index);
                                    controller.update();
                                  },
                                  child: Container(
                                    width: 380.w,
                                    height: 271.h,
                                    decoration: BoxDecoration(
                                        color: AppColors.kffffff,
                                        borderRadius:
                                            BorderRadius.circular(50.r),
                                        gradient:
                                            controller.selectedCategory.value ==
                                                    index
                                                ? const LinearGradient(
                                                    begin: Alignment(-1, -2.8),
                                                    end: Alignment(1, 2),
                                                    colors: [
                                                        AppColors.k1FAF9E,
                                                        AppColors.k0087FF
                                                      ])
                                                : const LinearGradient(colors: [
                                                    AppColors.kffffff,
                                                    AppColors.kffffff
                                                  ]),
                                        boxShadow: [
                                          BoxShadow(
                                              color: AppColors.k000000
                                                  .withOpacity(0.04),
                                              blurRadius: 50.r,
                                              offset: const Offset(0, 20))
                                        ]),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 40.h,
                                        ),
                                        Image.asset(
                                          controller.selectedCategory.value ==
                                                  index
                                              ? R.image.asset.voucher_card_1
                                                  .assetName
                                              : R.image.asset.super_market
                                                  .assetName,
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
                                            color: controller.selectedCategory
                                                        .value ==
                                                    index
                                                ? AppColors.kffffff
                                                : AppColors.k033660,
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
                                ),
                                SizedBox(
                                  width: 25.w,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(0),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 60.w,
                          ),
                          voucherCard(
                            title: 'NTUC Fairprice',
                            amount: 10,
                            date: '31,Nov 2021',
                            imgUrl: 'https://picsum.photos/id/1011/200/300',
                            whichScreen: 'Social Worker',
                            onTap: () {
                              //homeController.currentIndex!.value = 1;
                              //Get.toNamed<void>(Routes.VOUCHER_REDEMPTION);
                            },
                            voucherCode: '15015403',
                            btnText: 'Redeem Now',
                            voucherState: VoucherState.active,
                            isQRScreen: false,
                          ), //Common Voucher Card
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 60.w,
                          ),
                          voucherCard(
                            title: 'Sheng Siong',
                            amount: 20,
                            date: '1,Oct 2021',
                            imgUrl: 'https://picsum.photos/id/1012/200/300',
                            onTap: () {},
                            voucherCode: '15015403',
                            btnText: 'Already Redeemed',
                            whichScreen: 'Social Worker',
                            voucherState: VoucherState.active,
                            isQRScreen: false,
                          ), //Common Voucher Card
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 60.w,
                          ),
                          voucherCard(
                            title: 'NTUC Fairprice',
                            amount: 15,
                            date: '1,Jan 2021',
                            imgUrl: 'https://picsum.photos/id/1013/200/300',
                            voucherCode: '15015403',
                            onTap: () {},
                            whichScreen: 'Social Worker',
                            btnText: 'Expired Voucher',
                            voucherState: VoucherState.active,
                            isQRScreen: false,
                          ), //Common Voucher Card
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          controller.voucherAssigned.value
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
                            whichScreen: 'SW',
                            dialogTypeText: 'Voucher Successfully\nAssigned',
                            text:
                                'You have successfully assigned the\nvoucher to the beneficiary',
                            assetName: R.image.asset.success_redem.assetName,
                            onTapCancel: () {
                              controller.voucherAssigned(false);
                              //vendorRCtrl.redeemThroughNum.value = false;
                            }),
                      ),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
