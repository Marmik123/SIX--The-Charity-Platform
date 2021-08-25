import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/modules/needy_family/home/controllers/home_controller.dart';
import 'package:six/app/routes/app_pages.dart';
import 'package:six/app/ui/components/catched_image.dart';
import 'package:six/app/ui/components/circular_progress_indicator.dart';
import 'package:six/app/ui/components/common_voucher_card.dart';
import 'package:six/app/ui/components/sizedbox.dart';
import 'package:six/r.g.dart';

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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
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
                      w(249.w),
                      Padding(
                        padding: EdgeInsets.only(bottom: 30.h, right: 60.w),
                        child: PopupMenuButton<int>(
                          key: controller.key,
                          offset: const Offset(-2, 1),
                          elevation: 10,
                          onSelected: (index) {
                            controller.voucherFilterIndex(index);
                            var type = index == 0
                                ? 'all'
                                : index == 1
                                    ? 'assigned'
                                    : index == 2
                                        ? 'redeemed'
                                        : 'expired';
                            controller.getFilterAssignedVouchers(type);
                          },
                          shape: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.w,
                                color: AppColors.kD8FCFF,
                              ),
                              borderRadius: BorderRadius.circular(30.r)),
                          color: AppColors.kF2FEFF,
                          itemBuilder: (context) => List.generate(
                            controller.assignedVoucherFilter.length,
                            (index) => PopupMenuItem<int>(
                              value: index,
                              child: Container(
                                width: 525.w,
                                child: Text(
                                  controller.assignedVoucherFilter()[index],
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontSize: 35.sp,
                                    fontStyle: FontStyle.normal,
                                    color: AppColors.k13A89E,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          child: Container(
                            height: 160.r,
                            width: 160.r,
                            decoration: BoxDecoration(
                              color: AppColors.kffffff,
                              borderRadius: BorderRadius.circular(70.r),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.k00474E.withOpacity(0.04),
                                  offset: Offset(0, 20.h),
                                  blurRadius: 40.r,
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            padding: EdgeInsets.zero,
                            child: Image.asset(
                              R.image.voucher_filter().assetName,
                              height: 46.h,
                              fit: BoxFit.scaleDown,
                              width: 55.w,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Obx(() => Positioned(
                  // bottom: -40,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  top: 260.h,
                  child: controller.isLoading()
                      ? buildLoader()
                      : controller.categoryList.isEmpty
                          ? const Text('No Categories Found')
                          : ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.only(
                                top: 0,
                                left: 40.w,
                                right: 10.w,
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
                                                    offset: const Offset(0, 20))
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
                                                    .categoryList[index].iconUrl
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
                            if (controller.vouchers[index].voucher?['user'] !=
                                    null &&
                                controller.vouchers[index].voucher?['user']
                                        ['user_metadata'] !=
                                    null &&
                                controller.vouchers[index].voucher?['user']
                                        ['user_metadata']['entity_name'] !=
                                    null) {
                              controller.name(controller
                                  .vouchers[index]
                                  .voucher?['user']['user_metadata']
                                      ['entity_name']
                                  .toString());
                            }
                            return Row(
                              children: [
                                SizedBox(
                                  width: 60.w,
                                ),
                                voucherCard(
                                  title: controller.name(),
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
