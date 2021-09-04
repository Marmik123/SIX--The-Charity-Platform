import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/local/user_provider.dart';
import 'package:six/app/ui/components/app_snackbar.dart';
import 'package:six/app/ui/components/catched_image.dart';
import 'package:six/app/ui/components/circular_progress_indicator.dart';
import 'package:six/app/ui/components/common_appbar.dart';
import 'package:six/app/ui/components/common_textfield.dart';
import 'package:six/app/ui/components/common_voucher_card.dart';
import 'package:six/app/ui/components/rounded_gradient_btn.dart';
import 'package:six/r.g.dart';

import '../controllers/distribute_voucher_controller.dart';

class DistributeVoucherView extends GetView<DistributeVoucherController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(() => roundedButton(
            text: 'Confirm Now',
            isLoading: controller.voucherAssignLoading(),
            onTap: () {
              if (controller.vouchers.isNotEmpty) {
                logW(controller.vouchers[controller.voucherIndex()].voucherId);
                logW(controller.voucherIndex());
                var quantityZero = controller.initialVoucherCount
                    .every((element) => element == 0);
                if (quantityZero) {
                  appSnackbar(
                    message: 'Please increase quantity',
                    snackbarState: SnackbarState.warning,
                  );
                } else {
                  var voucherList =
                      List.generate(controller.vouchers.length, (index) {
                    if (controller.initialVoucherCount[index] != 0) {
                      return <String, dynamic>{
                        'quantity': double.tryParse(
                            controller.initialVoucherCount[index].toString()),
                        'amount': controller.vouchers[index].amount,
                        'familyUserId': controller.beneCtrl.beneficiary.id,
                        'name': controller.vouchers[index].name,
                        'voucherId': controller.vouchers[index].voucherId,
                      };
                    } else {
                      return 0;
                    }
                  });
                  voucherList.removeWhere((element) => element == 0);
                  logWTF(voucherList);
                  logI(voucherList.runtimeType);
                  if (voucherList.isNotEmpty) {
                    controller.voucherAssignLoading(true);
                    controller.assignNow(
                      vouchers: voucherList,
                    );
                  }
                }
                // controller.voucherAssigned(true);
                //Get.toNamed<void>(Routes.DISTRIBUTE_VOUCHER);
              } else {
                appSnackbar(
                  message: 'No Voucher Available',
                  snackbarState: SnackbarState.danger,
                );
              }
            },
            width: 452.w,
            height: 150.h,
            fontSize: 50.sp,
          )),
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
              Obx(() => Positioned(
                    bottom: -30,
                    left: -60,
                    right: 0,
                    top: 15,
                    child: Container(
                      child: controller.isLoading()
                          ? buildLoader()
                          : controller.categoryList.isEmpty
                              ? const Text('No Categories Found')
                              : ListView.builder(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(
                                    top: 0,
                                    left: 70,
                                    right: 10,
                                  ),
                                  itemCount: controller.categoryList.length,
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) => Obx(() =>
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              controller
                                                  .selectedCategory(index);
                                              controller.update();
                                              controller.categoryId(controller
                                                  .categoryList[index].id);
                                              controller.assignVoucherList(
                                                  controller
                                                      .categoryList[index].id);
                                            },
                                            child: Container(
                                              width: 380.w,
                                              height: 271.h,
                                              decoration: BoxDecoration(
                                                  color: AppColors.kffffff,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50.r),
                                                  gradient: controller
                                                              .selectedCategory
                                                              .value ==
                                                          index
                                                      ? const LinearGradient(
                                                          begin: Alignment(
                                                              -1, -2.8),
                                                          end: Alignment(1, 2),
                                                          colors: [
                                                              AppColors.k1FAF9E,
                                                              AppColors.k0087FF
                                                            ])
                                                      : const LinearGradient(
                                                          colors: [
                                                              AppColors.kffffff,
                                                              AppColors.kffffff
                                                            ]),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: AppColors.k000000
                                                            .withOpacity(0.04),
                                                        blurRadius: 50.r,
                                                        offset:
                                                            const Offset(0, 20))
                                                  ]),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 40.h,
                                                  ),
                                                  /*controller.selectedCategory
                                                          .value ==
                                                      index
                                                  ? Image.asset(
                                                      R
                                                          .image
                                                          .asset
                                                          .voucher_card_1
                                                          .assetName,
                                                      height: 113.h,
                                                      width: 104.w,
                                                    )
                                                  :*/
                                                  cacheImage(
                                                    height: 113.h,
                                                    width: 104.w,
                                                    url: controller
                                                        .categoryList[index]
                                                        .iconUrl,
                                                    placeholder: ImageIcon(
                                                      R.image.categories(),
                                                      color: AppColors.k033660,
                                                      size: 35,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 30.5.h,
                                                  ),
                                                  Text(
                                                    controller
                                                        .categoryList[index]
                                                        .name,
                                                    style: TextStyle(
                                                      fontFamily: 'Gilroy',
                                                      fontSize: 40.sp,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      color: controller
                                                                  .selectedCategory
                                                                  .value ==
                                                              index
                                                          ? AppColors.kffffff
                                                          : AppColors.k033660,
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                      )),
                                ),
                    ),
                  )),
              Positioned(
                top: 0,
                child: Container(
                  width: 985.w,
                  height: 160.h,
                  child: GetBuilder<DistributeVoucherController>(
                    builder: (_) => textField(
                      context: context,
                      onChanged: (value) {
                        controller.update();
                      },
                      height: 120.h,
                      width: 1005.w,
                      initialValue: '',
                      prefixText: '',
                      hintText: 'Search',
                      controller: controller.voucherSearch,
                      prefixImageName: R.image.asset.search.assetName,
                      onTap: () {},
                      textAction: TextInputAction.search,
                      contentPadding: const EdgeInsets.only(
                          //right: 50,
                          ),
                      textStyle: TextStyle(
                        fontSize: 35.sp,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                        color: AppColors.k6886A0,
                      ),
                      suffixIcon: controller.voucherSearch.text.trim().isEmpty
                          ? const SizedBox.shrink()
                          : IconButton(
                              color: AppColors.k6886A0,
                              //padding: const EdgeInsets.only(top: 15),
                              alignment: Alignment.center,
                              iconSize: 20,
                              tooltip: 'Clear Text',
                              splashRadius: 2,
                              icon: const Icon(
                                Icons.clear,
                              ),
                              onPressed: () {
                                controller.isSearched(false);
                                controller.voucherSearch.clear();
                                controller.update();
                                controller.assignVoucherList(controller
                                    .categoryList[controller.selectedCategory()]
                                    .id);
                              },
                            ),
                      hintStyle: TextStyle(
                        fontSize: 45.sp,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                        color: AppColors.k6886A0,
                      ),
                      keyBoardType: TextInputType.text,
                      onFieldSubmitted: (value) {
                        if (UserProvider.role == 'social_worker' &&
                            value.isNotEmpty) {
                          controller.isSearched(true);
                          logI(value.trim());
                          controller.assignSearchedVoucher(
                              controller
                                  .categoryList[controller.selectedCategory()]
                                  .id,
                              value.trim());
                          if (value.trim().isEmpty) {
                            controller.isSearched(false);
                          }
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Obx(() => controller.isVoucherLoading()
              ? Padding(
                  padding: EdgeInsets.only(top: 100.h),
                  child: buildLoader(),
                )
              : Expanded(
                  child: controller.vouchers().isEmpty
                      ? Padding(
                          padding: EdgeInsets.only(top: 0.20.sh),
                          child: Text(
                            'No Voucher Available',
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontSize: 50.sp,
                              fontStyle: FontStyle.normal,
                              color: AppColors.k033660,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      : controller.isLoading()
                          ? buildLoader()
                          : ListView.builder(
                              itemCount: controller.vouchers.length,
                              padding: const EdgeInsets.all(0),
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                // var date = controller.getDate(index);
                                return Row(
                                  children: [
                                    SizedBox(
                                      width: 60.w,
                                    ),
                                    voucherCard(
                                      title: controller.vouchers[index].name ??
                                          'NTUC Fairprice',
                                      // terms: controller.vouchers[index],
                                      amount: double.tryParse(controller
                                          .vouchers[index].amount
                                          .toString())!,
                                      date: '-',
                                      imgUrl: controller
                                                  .vouchers[index].iconUrl ==
                                              null
                                          ? 'https://picsum.photos/200/300'
                                          : controller
                                                  .vouchers[index].iconUrl ??
                                              'https://picsum.photos/id/1011/200/300',
                                      whichScreen: 'Social Worker',
                                      onTap: () {
                                        controller.voucherIndex(index);
                                      },
                                      terms:
                                          '${controller.vouchers[index].terms ?? '-'}',
                                      voucherCtrlSW: controller,
                                      voucherCode: '15015403',
                                      btnText: 'Redeem Now',
                                      dottedIsBlue: true,
                                      voucherState: VoucherState.active,
                                      isQRScreen: false,
                                      totalAvailable: double.tryParse(controller
                                          .vouchers[index].total
                                          .toString()),
                                      index: index,
                                    ), //Common Voucher Card
                                  ],
                                );
                              },
                            ),
                )),
        ],
      ),
    );
  }
}

//ON TAP CATEGORY IMAGE COLOR CHANGES
/*Image.asset(
                                        controller.selectedCategory
                                            .value ==
                                            index
                                            ? R
                                            .image
                                            .asset
                                            .voucher_card_1
                                            .assetName
                                            : R.image.asset.super_market
                                            .assetName,
                                        height: 113.h,
                                        width: 104.w,
                                      ),*/
