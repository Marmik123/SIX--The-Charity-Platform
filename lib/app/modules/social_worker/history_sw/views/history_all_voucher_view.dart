import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/modules/social_worker/history_sw/controllers/history_sw_controller.dart';
import 'package:six/app/ui/components/common_voucher_card.dart';
import 'package:six/app/ui/components/sizedbox.dart';

class HistoryAllVoucherView extends GetView<HistorySwController> {
  @override
  Widget build(BuildContext context) {
    return controller.socialCtrl.historyVouchers.isEmpty
        ? Center(
            child: Text(
              'No Voucher Available',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 40.sp,
                fontStyle: FontStyle.normal,
                color: AppColors.k1FAF9E,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        : ListView.separated(
            physics: const ClampingScrollPhysics(),
            itemCount: controller.socialCtrl.historyVouchers.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) => h(10.h),
            itemBuilder: (context, index) {
              if (controller
                          .socialCtrl.historyVouchers[index].voucher?['user'] !=
                      null &&
                  controller.socialCtrl.historyVouchers[index].voucher?['user']
                          ['user_metadata'] !=
                      null &&
                  controller.socialCtrl.historyVouchers[index].voucher?['user']
                          ['user_metadata']['entity_name'] !=
                      null) {
                controller.name(controller.socialCtrl.historyVouchers[index]
                    .voucher?['user']['user_metadata']['entity_name']
                    .toString());
              }
              return voucherCard(
                title: controller.name(),
                imgUrl: controller.socialCtrl.historyVouchers[index]
                            .voucher!['icon_url'] ==
                        null
                    ? 'https://picsum.photos/id/1011/180'
                    : controller
                        .socialCtrl.historyVouchers[index].voucher!['icon_url']
                        .toString(),
                amount:
                    controller.socialCtrl.historyVouchers[index].amount ?? 0,
                voucherCode: '15015783',
                date: controller.socialCtrl.getDate(index) ?? 'NA',
                onTap: () {},
                voucherState: controller.socialCtrl.checkIsExpired(index)
                    ? VoucherState.expired
                    : controller.socialCtrl.historyVouchers[index].isActive ??
                            false
                        ? VoucherState.redeemed
                        : VoucherState.active,
                btnText: controller.socialCtrl.checkIsExpired(index)
                    ? 'Already Expired'
                    : controller.socialCtrl.historyVouchers[index].isActive ??
                            false
                        ? 'Already Redeemed'
                        : 'Already Assigned',
                whichScreen: 'History',
                isQRScreen: false,
                beneficiaryName: controller.socialCtrl.historyVouchers[index]
                            .userVoucherData?['first_name'] ==
                        null
                    ? 'NA'
                    : controller.socialCtrl.historyVouchers[index]
                            .userVoucherData?['first_name']
                            .toString() ??
                        'NA',
                beneProfileUrl: controller.socialCtrl.historyVouchers[index]
                            .userVoucherData?['profile_image_url'] ==
                        null
                    ? ''
                    : controller.socialCtrl.historyVouchers[index]
                        .userVoucherData?['profile_image_url']
                        .toString(),
              );
            },
          );
  }
}
