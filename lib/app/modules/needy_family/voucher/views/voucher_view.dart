import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/modules/needy_family/home/controllers/home_controller.dart';
import 'package:six/app/routes/app_pages.dart';
import 'package:six/app/ui/components/catched_image.dart';
import 'package:six/app/ui/components/circular_progress_indicator.dart';
import 'package:six/app/ui/components/common_voucher_card.dart';

import '../controllers/voucher_controller.dart';

class VoucherView extends GetView<VoucherController> {
  final VoucherController ctrl = Get.put(VoucherController());

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kffffff,
      body: VoucherContent(homeController: homeController),
    );
  }
}

class VoucherContent extends GetView<VoucherController> {
  const VoucherContent({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              color: Colors.transparent,
              width: 1.sw,
              height: 0.25.sh,
            ),
            Positioned(
              top: 0,
              child: Container(
                width: 1125.w,
                color: AppColors.kF2FEFF,
                height: 440.h,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Center(
                    child: Text(
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
                  ),
                ),
              ),
            ),
            Obx(() => Positioned(
                  bottom: -40,
                  left: -60,
                  right: 0,
                  top: 30,
                  child: Container(
                    height: 280.h,
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
                                itemBuilder: (context, index) => Obx(() => Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            controller.selectedCategory(index);
                                            controller.update();
                                            controller.categoryId(controller
                                                .categoryList[index].id);
                                            controller.assignVoucherList(
                                                controller
                                                    .categoryList[index].id!);
                                          },
                                          child: Container(
                                            width: 380.w,
                                            height: 271.h,
                                            decoration: BoxDecoration(
                                                color: AppColors.kffffff,
                                                borderRadius:
                                                    BorderRadius.circular(50.r),
                                                gradient: controller
                                                            .selectedCategory
                                                            .value ==
                                                        index
                                                    ? const LinearGradient(
                                                        begin:
                                                            Alignment(-1, -2.8),
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
                                                      .iconUrl
                                                      .toString(),
                                                ),
                                                SizedBox(
                                                  height: 30.5.h,
                                                ),
                                                Text(
                                                  controller.categoryList[index]
                                                          .name ??
                                                      'Super - Market',
                                                  style: TextStyle(
                                                    fontFamily: 'Gilroy',
                                                    fontSize: 40.sp,
                                                    fontStyle: FontStyle.normal,
                                                    color: controller
                                                                .selectedCategory
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
                                    )),
                              ),
                  ),
                )),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        Obx(() => Expanded(
              child: controller.isVoucherLoading()
                  ? buildLoader()
                  : controller.vouchers().isEmpty
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
                      : ListView.builder(
                          itemCount: controller.vouchers.length,
                          padding: const EdgeInsets.all(0),
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            var date = controller.getDate(
                                index: index,
                                isRedeemed:
                                    controller.vouchers[index].isRedeemed);
                            return Row(
                              children: [
                                SizedBox(
                                  width: 60.w,
                                ),
                                voucherCard(
                                  title: controller.vouchers[index].name ??
                                      'NTUC Fairprice',
                                  amount: double.tryParse(controller
                                      .vouchers[index].amount
                                      .toString())!,
                                  date: date ?? '-',
                                  isRedeemed:
                                      controller.vouchers[index].isRedeemed ??
                                          false,
                                  terms:
                                      '${controller.vouchers[index].voucher?['terms'] ?? '-'}',
                                  imgUrl: controller.vouchers[index]
                                              .voucher?['icon_url'] ==
                                          null
                                      ? 'https://picsum.photos/200/300'
                                      : controller.vouchers[index]
                                              .voucher?['icon_url']
                                              .toString() ??
                                          'https://picsum.photos/id/1011/200/300',
                                  whichScreen: 'Social Worker',
                                  voucherCode:
                                      '${controller.vouchers[index].voucherId ?? '-'}',
                                  btnText: controller.checkIsExpired(index)
                                      ? 'Expired Voucher'
                                      : (controller
                                                  .vouchers[index].isRedeemed ??
                                              false
                                          ? 'Already Redeemed'
                                          : 'Redeem Now'),
                                  onTap: () {
                                    if (controller.vouchers[index].isRedeemed ==
                                        false) {
                                      Get.toNamed<void>(
                                        Routes.VOUCHER_REDEMPTION,
                                        arguments:
                                            '${controller.vouchers[index]}',
                                      );
                                    }
                                  },
                                  voucherState: controller.checkIsExpired(index)
                                      ? VoucherState.expired
                                      : (controller.vouchers[index].isActive ??
                                              false
                                          ? VoucherState.redeemed
                                          : VoucherState.active),
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
    );
  }
}
