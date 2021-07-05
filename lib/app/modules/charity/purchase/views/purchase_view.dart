import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/ui/components/category_card.dart';
import 'package:six/app/ui/components/common_appbar.dart';
import 'package:six/app/ui/components/rounded_gradient_btn.dart';
import 'package:six/app/ui/components/success_dialog.dart';
import 'package:six/r.g.dart';

import '../controllers/purchase_controller.dart';

class PurchaseView extends GetView<PurchaseController> {
  var ctrl = Get.put(PurchaseController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          children: [
            Scaffold(
              backgroundColor: AppColors.kffffff,
              appBar: appBar(
                title: 'Select Category',
                height: 200.h,
              ),
              body: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 70.h,
                    ),
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
                    Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 34.w,
                            mainAxisSpacing: 34.w,
                            childAspectRatio: 628.w / 755.h,
                          ),
                          itemCount: 12,
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                ctrl.selectCategory!.value = index;
                              },
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  categoryCard(
                                    index: index,
                                    categoryName: 'Food &\nBeverage',
                                    creditsRemaining: 0,
                                    totalCredits: 14,
                                    image: Image.asset(
                                      R.image.asset.food.assetName,
                                      height: 148.h,
                                      width: 139.w,
                                    ),
                                    background: AppColors.kFFF5F1,
                                    foreground: AppColors.kECB91B,
                                    shadow: AppColors.kEED2E0.withOpacity(0.15),
                                    accent: AppColors.kE2E2E2,
                                    whichScreen: 'Charity',
                                    height: 629.h,
                                    width: 558.w,
                                    padding: const EdgeInsets.only(
                                        left: 48.0, right: 48, bottom: 35.0),
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
                                      child: ctrl.selectCategory!.value == index
                                          ? Image.asset(
                                              R.image.asset.select_voucher
                                                  .assetName,
                                              height: 88.r,
                                              width: 88.r,
                                              fit: BoxFit.contain,
                                            )
                                          : SizedBox.shrink(),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 350.h,
                    ),
                    Center(
                      child: roundedButton(
                        'Purchase Credit',
                        () {
                          ctrl.purchasePressed.value = true;
                          Get.bottomSheet<void>(
                            Container(
                                width: 1125.w,
                                height: 974.h,
                                child: BottomSheet(
                                  enableDrag: false,
                                  shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(80.r),
                                      topRight: Radius.circular(80.r),
                                    ),
                                    borderSide: BorderSide.none,
                                  ),
                                  onClosing: () {
                                    ctrl.purchasePressed.value = false;
                                  },
                                  builder: (context) => Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 70.h,
                                          ),
                                          Container(
                                            height: 200.r,
                                            width: 200.r,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.kFF007A
                                                  .withOpacity(0.1),
                                            ),
                                            child: Center(
                                              child: Image.asset(
                                                R.image.asset.food.assetName,
                                                height: 106.h,
                                                width: 100.w,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 60.h,
                                          ),
                                          Text(
                                            'Super - Market',
                                            style: TextStyle(
                                              fontFamily: 'Gilroy',
                                              fontSize: 55.sp,
                                              fontStyle: FontStyle.normal,
                                              color: AppColors.k033660,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            height: 87.h,
                                          ),
                                          Container(
                                            height: 170.h,
                                            width: 1005.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50.r),
                                                color: AppColors.kffffff,
                                                border: Border.all(
                                                  color: AppColors.kE2E2E2,
                                                  width: 1.w,
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: AppColors.k00474E
                                                        .withOpacity(0.04),
                                                    offset: Offset(0, 20),
                                                    blurRadius: 50.r,
                                                  ),
                                                ]),
                                            child: TextFormField(
                                              initialValue: '10,000',
                                              enabled: true,
                                              onEditingComplete: () {
                                                FocusScopeNode currentFocus =
                                                    FocusScope.of(context);
                                                currentFocus.unfocus();
                                              },
                                              style: TextStyle(
                                                color: AppColors.k13A89E,
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.normal,
                                                fontFamily: 'Gilroy',
                                                fontSize: 65.sp,
                                              ),
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                fillColor: AppColors.kffffff,
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 120, top: 15),
                                                filled: true,
                                                prefixText: '\$',
                                                prefixStyle: TextStyle(
                                                  color: AppColors.k13A89E,
                                                  fontWeight: FontWeight.w700,
                                                  fontStyle: FontStyle.normal,
                                                  fontFamily: 'Gilroy',
                                                  fontSize: 65.sp,
                                                ),
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                isDense: true,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 87.h,
                                          ),
                                          Center(
                                            child: roundedButton('Pay Now', () {
                                              Get.back<void>();
                                              controller.paid.value = true;
                                            }, 500.w),
                                          )
                                        ],
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          ctrl.purchasePressed.value = false;
                                          ctrl.paid.value = false;
                                          Get.back<void>();
                                        },
                                        icon: Icon(Icons.clear),
                                        color: AppColors.k1FAF9E,
                                        iconSize: 25,
                                      )
                                    ],
                                  ),
                                  backgroundColor: AppColors.kffffff,
                                )),
                            isDismissible: false,
                            enableDrag: false,
                            isScrollControlled: false,
                            elevation: 5,
                          );
                        },
                        500.w,
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                  ],
                ),
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
                            offset: Offset(0, 2),
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
                            offset: Offset(0, 4),
                            blurRadius: 4.r,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Material(
                          color: Colors.transparent,
                          child: successDialog(
                            onTapCancel: () {
                              controller.purchasePressed.value = false;
                              controller.paid.value = false;
                            },
                            dialogTypeText: 'Oops!',
                            assetName: R.image.asset.error_dialog.assetName,
                            text: 'Something went wrong. Please\ntry again',
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
        ));
  }
}
