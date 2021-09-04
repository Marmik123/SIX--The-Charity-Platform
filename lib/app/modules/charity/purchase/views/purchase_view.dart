import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/local/user_provider.dart';
import 'package:six/app/routes/app_pages.dart';
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
  @override
  final PurchaseController controller = Get.put(PurchaseController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          floatingActionButton: UserProvider.role == 'social_worker'
              ? const SizedBox.shrink()
              : roundedButton(
                  text: 'Purchase Credit',
                  isLoading: controller.paymentInProgress(),
                  onTap: () {
                    controller.amountController.clear();
                    purchaseBottomSheet(
                      category: controller
                          .voucherCategory[controller.selectCategory!()].name
                          .toString(),
                      categoryId: controller
                          .voucherCategory[controller.selectCategory!()].id
                          .toString(),
                      imgUrl: controller
                          .voucherCategory[controller.selectCategory!()]
                          .iconUrl,
                      background: HexColor.fromHex(controller
                          .voucherCategory[controller.selectCategory!()]
                          .background!),
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
            disableBackIcon:
                UserProvider.role == 'social_worker' ? true : false,
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
                controller.isLoading()
                    ? Center(child: buildLoader())
                    : Expanded(
                        child: GetBuilder<PurchaseController>(
                          builder: (_) => GridView.builder(
                              physics: const ClampingScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 34.w,
                                mainAxisSpacing: 34.w,
                                childAspectRatio: 638.w / 715.h,
                              ),
                              itemCount: controller.voucherCategory.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var backColor = HexColor.fromHex(controller
                                    .voucherCategory[index].background!);
                                var foreColor = HexColor.fromHex(controller
                                    .voucherCategory[index].forground!);
                                var accent = HexColor.fromHex(
                                    controller.voucherCategory[index].accent!);
                                return GestureDetector(
                                  onTap: () {
                                    controller.selectCategory!(index);
                                    logI(controller.selectCategory);
                                    controller.update();
                                    if (UserProvider.role == 'social_worker') {
                                      controller.selectCategory!(index);
                                      controller.update();
                                      Get.toNamed<void>(
                                        Routes.AVAILABLE_VENDORS,
                                        arguments: [
                                          controller.voucherCategory()[index],
                                          index,
                                        ],
                                      );
                                    }
                                  },
                                  child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      categoryCard(
                                        onTap: () {
                                          controller.selectCategory!(index);
                                          controller.update();
                                          if (UserProvider.role == 'charity' ||
                                              UserProvider.role ==
                                                  'social_worker') {
                                            Get.toNamed<void>(
                                              Routes.AVAILABLE_VENDORS,
                                              arguments: [
                                                controller
                                                    .voucherCategory()[index],
                                                index,
                                              ],
                                            );
                                          }
                                        },
                                        disableCheckBox: true,
                                        categoryName: controller
                                            .voucherCategory()[index]
                                            .name,
                                        creditsRemaining: 0,
                                        totalCredits: 14,
                                        imageUrl: controller
                                            .voucherCategory[index].iconUrl,
                                        background: backColor,
                                        foreground: foreColor,
                                        shadow:
                                            AppColors.kEED2E0.withOpacity(0.15),
                                        accent: accent,
                                        height: 522.h,
                                        width: 558.w,
                                        context: context,
                                        padding: const EdgeInsets.only(
                                            left: 20.0,
                                            right: 20,
                                            bottom: 35.0),
                                      ),
                                      UserProvider.role == 'social_worker'
                                          ? const SizedBox.shrink()
                                          : Positioned(
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
                                                child: controller
                                                            .selectCategory!() ==
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
        ));
  }
}
