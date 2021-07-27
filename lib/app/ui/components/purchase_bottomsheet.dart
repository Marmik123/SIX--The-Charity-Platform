import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/modules/charity/purchase/controllers/purchase_controller.dart';
import 'package:six/app/modules/social_worker/assigned_voucher/controllers/assigned_voucher_controller.dart';
import 'package:six/app/ui/components/common_textfield.dart';
import 'package:six/app/ui/components/rounded_gradient_btn.dart';
import 'package:six/r.g.dart';

Future<void> purchaseBottomSheet({
  required String whichScreen,
  String? category,
}) {
  var ctrl = Get.put(PurchaseController());
  //var socialCtrl = Get.put(SocialHomeController());
  var assignCtrl = Get.put(AssignedVoucherController());
  return Get.bottomSheet<void>(
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
          ctrl.textEditingController.clear();
          ctrl.purchasePressed(false);
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
                    color: AppColors.kFF007A.withOpacity(0.1),
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
                  category ?? 'NA',
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
                      borderRadius: BorderRadius.circular(50.r),
                      color: AppColors.kffffff,
                      border: Border.all(
                        color: AppColors.kE2E2E2,
                        width: 1.w,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.k00474E.withOpacity(0.04),
                          offset: const Offset(0, 20),
                          blurRadius: 50.r,
                        ),
                      ]),
                  child: textField(
                    context: context,
                    height: 170.h,
                    controller: ctrl.textEditingController,
                    width: 1005.w,
                    initialValue: '10,000',
                    prefixText: '\$',
                    hintText: '',
                    prefixImageName: '',
                    onTap: () {},
                    keyBoardType: TextInputType.number,
                    textStyle: TextStyle(
                      color: AppColors.k13A89E,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'Gilroy',
                      fontSize: 65.sp,
                    ),
                    contentPadding: const EdgeInsets.only(left: 105, bottom: 5),
                    hintStyle: TextStyle(
                      color: AppColors.k6886A0,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'Gilroy',
                      fontSize: 45.sp,
                    ),
                    whichScreen: 'PurchaseSheet',
                  ),
                  /*TextFormField(
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
                                            )*/
                ),
                SizedBox(
                  height: 87.h,
                ),
                Center(
                  child: roundedButton(
                    text: 'Pay Now',
                    onTap: () {
                      if (purchaseController.textEditingController.text
                              .trim()
                              .isNotEmpty &&
                          GetUtils.isNum(purchaseController
                              .textEditingController.text
                              .trim())) {
                        purchaseController.purchaseVoucherCat(
                            amount: double.tryParse(
                                ctrl.textEditingController.text.trim()));
                        Get.back<void>();
                        whichScreen == 'Social'
                            ? assignCtrl.paid(true)
                            : whichScreen == 'Charity' &&
                                    ctrl.paymentStatusCode!() == 200
                                ? ctrl.paid(true)
                                : ctrl.failed(true);
                      } else {
                        Get.snackbar<void>(
                          'Amount is Null',
                          'Please enter valid amount',
                          backgroundColor: AppColors.kffffff,
                          overlayColor: AppColors.k14A1BE,
                        );
                      }
                    },
                    width: 500.w,
                    height: 150.h,
                    fontSize: 50.sp,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                whichScreen == 'Social'
                    ? assignCtrl.purchasePressed(false)
                    : ctrl.purchasePressed(false);

                whichScreen == 'Social'
                    ? assignCtrl.paid(false)
                    : ctrl.paid.value = false;
                Get.back<void>();
              },
              icon: const Icon(Icons.clear),
              color: AppColors.k1FAF9E,
              iconSize: 25,
            ),
          ],
        ),
        backgroundColor: AppColors.kffffff,
      ),
    ),
    isDismissible: false,
    enableDrag: false,
    isScrollControlled: false,
    elevation: 5,
  );
}
