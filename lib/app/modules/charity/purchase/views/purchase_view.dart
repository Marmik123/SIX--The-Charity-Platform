import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/ui/components/category_card.dart';
import 'package:six/app/ui/components/circular_progress_indicator.dart';
import 'package:six/app/ui/components/common_appbar.dart';
import 'package:six/app/ui/components/purchase_bottomsheet.dart';
import 'package:six/app/ui/components/rounded_gradient_btn.dart';
import 'package:six/app/ui/components/sizedbox.dart';
import 'package:six/app/utils/color_ext.dart';
import 'package:six/r.g.dart';

import '../controllers/purchase_controller.dart';

class PurchaseView extends GetView<PurchaseController> {
  final PurchaseController ctrl = Get.put(PurchaseController());
  final String whichScreen;

  PurchaseView({required this.whichScreen});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          floatingActionButton: whichScreen == 'Social'
              ? const SizedBox.shrink()
              : ctrl.paymentInProgress()
                  ? FittedBox(child: buildLoader())
                  : roundedButton(
                      text: 'Purchase Credit',
                      onTap: () {
                        ctrl.amountController.clear();
                        whichScreen == 'Social'
                            ? purchaseBottomSheet(whichScreen: 'Social')
                            : purchaseBottomSheet(
                                whichScreen: 'Charity',
                                category: ctrl
                                    .voucherCategory[ctrl.selectCategory!()]
                                    .name
                                    .toString(),
                              );
                      },
                      width: 500.w,
                      height: 150.h,
                      fontSize: 50.sp,
                    ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          backgroundColor: AppColors.kffffff,
          appBar: appBar(
            title: 'Select Category',
            height: 200.h,
            disableBackIcon: false,
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                h(70.h),
                Text(
                  'Select Voucher Category',
                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 60.sp,
                    fontStyle: FontStyle.normal,
                    color: AppColors.k033660.withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 50.h,
                ),
                ctrl.isLoading()
                    ? buildLoader()
                    : Expanded(
                        child: GetBuilder<PurchaseController>(
                          builder: (_) => GridView.builder(
                              physics: const ClampingScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 34.w,
                                mainAxisSpacing: 34.w,
                                childAspectRatio: 638.w / 855.h,
                              ),
                              itemCount: ctrl.voucherCategory.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var backColor = HexColor.fromHex(
                                    ctrl.voucherCategory[index].background!);
                                var foreColor = HexColor.fromHex(
                                    ctrl.voucherCategory[index].forground!);
                                var accent = HexColor.fromHex(
                                    ctrl.voucherCategory[index].accent!);
                                return GestureDetector(
                                  onTap: () {
                                    ctrl.selectCategory!(index);
                                    ctrl.update();
                                  },
                                  child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      categoryCard(
                                        index: index,
                                        categoryName: ctrl
                                            .voucherCategory()[index]
                                            .name
                                            .toString(),
                                        creditsRemaining: 0,
                                        totalCredits: 14,
                                        imageUrl: ctrl.voucherCategory[index]
                                                .iconUrl ??
                                            '${R.image.asset.food.assetName}',
                                        background: backColor,
                                        foreground: foreColor,
                                        shadow:
                                            AppColors.kEED2E0.withOpacity(0.15),
                                        accent: accent,
                                        whichScreen: whichScreen == 'Social'
                                            ? 'Social'
                                            : 'Charity',
                                        height: 622.h,
                                        width: 558.w,
                                        context: context,
                                        padding: const EdgeInsets.only(
                                            left: 20.0,
                                            right: 20,
                                            bottom: 35.0),
                                      ),
                                      Positioned(
                                        right: 30.r,
                                        top: 30.r,
                                        child: Container(
                                          width: 88.r,
                                          height: 88.r,
                                          decoration: BoxDecoration(
                                              color: AppColors.kffffff,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: AppColors.k033660
                                                    .withOpacity(0.05),
                                                width: 1.w,
                                              )),
                                          child: ctrl.selectCategory!.value ==
                                                  index
                                              ? Image.asset(
                                                  R.image.asset.select_voucher
                                                      .assetName,
                                                  height: 88.r,
                                                  width: 88.r,
                                                  fit: BoxFit.contain,
                                                )
                                              : const SizedBox.shrink(),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ),
              ],
            ),
          ),
        ));
  }

/*
  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          children: [
            Scaffold(
              floatingActionButton: whichScreen == 'Social'
                  ? const SizedBox.shrink()
                  : roundedButton(
                      text: 'Purchase Credit',
                      onTap: () {
                        ctrl.purchasePressed(true);
                        whichScreen == 'Social'
                            ? purchaseBottomSheet(whichScreen: 'Social')
                            : purchaseBottomSheet(
                                whichScreen: 'Charity',
                                category: ctrl
                                    .voucherCategory[ctrl.selectCategory!()]
                                    .name
                                    .toString(),
                              );
                      },
                      width: 500.w,
                      height: 150.h,
                      fontSize: 50.sp,
                    ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              backgroundColor: AppColors.kffffff,
              appBar: appBar(
                title: 'Select Category',
                height: 200.h,
                disableBackIcon: false,
              ),
              body: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    h(70.h),
                    Text(
                      'Select Voucher Category',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 60.sp,
                        fontStyle: FontStyle.normal,
                        color: AppColors.k033660.withOpacity(0.5),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    ctrl.isLoading()
                        ? buildLoader()
                        : Expanded(
                            child: GetBuilder<PurchaseController>(
                              builder: (_) => GridView.builder(
                                  physics: const ClampingScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 34.w,
                                    mainAxisSpacing: 34.w,
                                    childAspectRatio: 638.w / 855.h,
                                  ),
                                  itemCount: ctrl.voucherCategory.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    var backColor = HexColor.fromHex(ctrl
                                        .voucherCategory[index].background!);
                                    var foreColor = HexColor.fromHex(
                                        ctrl.voucherCategory[index].forground!);
                                    var accent = HexColor.fromHex(
                                        ctrl.voucherCategory[index].accent!);
                                    return GestureDetector(
                                      onTap: () {
                                        ctrl.selectCategory!(index);
                                        ctrl.update();
                                      },
                                      child: Stack(
                                        alignment: Alignment.topRight,
                                        children: [
                                          categoryCard(
                                            index: index,
                                            categoryName: ctrl
                                                .voucherCategory()[index]
                                                .name
                                                .toString(),
                                            creditsRemaining: 0,
                                            totalCredits: 14,
                                            imageUrl: ctrl
                                                    .voucherCategory[index]
                                                    .iconUrl ??
                                                '${R.image.asset.food.assetName}',
                                            background: backColor,
                                            foreground: foreColor,
                                            shadow: AppColors.kEED2E0
                                                .withOpacity(0.15),
                                            accent: accent,
                                            whichScreen: whichScreen == 'Social'
                                                ? 'Social'
                                                : 'Charity',
                                            height: 622.h,
                                            width: 558.w,
                                            context: context,
                                            padding: const EdgeInsets.only(
                                                left: 20.0,
                                                right: 20,
                                                bottom: 35.0),
                                          ),
                                          Positioned(
                                            right: 30.r,
                                            top: 30.r,
                                            child: Container(
                                              width: 88.r,
                                              height: 88.r,
                                              decoration: BoxDecoration(
                                                  color: AppColors.kffffff,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: AppColors.k033660
                                                        .withOpacity(0.05),
                                                    width: 1.w,
                                                  )),
                                              child:
                                                  ctrl.selectCategory!.value ==
                                                          index
                                                      ? Image.asset(
                                                          R
                                                              .image
                                                              .asset
                                                              .select_voucher
                                                              .assetName,
                                                          height: 88.r,
                                                          width: 88.r,
                                                          fit: BoxFit.contain,
                                                        )
                                                      : const SizedBox.shrink(),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ),
                  ],
                ),
              ),
            ),
            controller.purchasePressed()
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
            controller.paymentInProgress()
                ? Center(child: buildPaymentLoader())
                : controller.paid()
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
                                child: ctrl.paid()
                                    ? actionDialog(
                                        whichScreen: 'Charity',
                                        onTapCancel: () {
                                          controller.purchasePressed(false);
                                          controller.paid(false);
                                          //controller.failed(false);
                                        },
                                        dialogTypeText: 'Success!',
                                        assetName: R.image.asset.success_redem
                                            .assetName,
                                        text:
                                            'Congrats! You have successfully\npurchased credits for supermarket\ncategory',
                                      )
                                    : actionDialog(
                                        whichScreen: 'Charity',
                                        onTapCancel: () {
                                          controller.purchasePressed(false);
                                          controller.paid(false);
                                          //controller.failed(false);
                                        },
                                        dialogTypeText: 'Oops!',
                                        assetName: R
                                            .image.asset.error_dialog.assetName,
                                        text:
                                            'Something went wrong. Please\ntry again',
                                      )

                                */
/*successDialog(
                              text: 'Voucher has been successfully\nredeemed.',
                              assetName: R.image.asset.success_redem.assetName,
                              onTapCancel: () {
                                controller.purchasePressed.value = false;
                                controller.paid.value = false;
                              })*/ /*
 //SUCCESS DIALOG
                                ),
                          ),
                        ),
                      )
                    : Container(),
          ],
        ));
  }
*/
}
