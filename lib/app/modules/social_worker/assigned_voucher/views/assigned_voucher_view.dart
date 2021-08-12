import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/modules/social_worker/beneficiary_details/controllers/beneficiary_details_controller.dart';
import 'package:six/app/ui/components/common_voucher_card.dart';
import 'package:six/app/ui/components/sizedbox.dart';

import '../controllers/assigned_voucher_controller.dart';

class AssignedVoucherView extends GetView<AssignedVoucherController> {
  final BeneficiaryDetailsController ctrl =
      Get.put(BeneficiaryDetailsController());
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const ClampingScrollPhysics(),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RichText(
              text: TextSpan(
                text: 'Available Voucher',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 60.sp,
                  fontStyle: FontStyle.normal,
                  color: AppColors.k033660.withOpacity(0.5),
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(
                    text: ' (${ctrl.assignedVouchers.length.toString()})',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 60.sp,
                      fontStyle: FontStyle.normal,
                      color: AppColors.k13A89E,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            w(50.w),
            Container(
              width: 296.w,
              height: 100.h,
              decoration: BoxDecoration(
                color: AppColors.kffffff,
                border: Border.all(
                  color: AppColors.k033660.withOpacity(0.06),
                  width: 5.w,
                ),
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'All',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 40.sp,
                      fontStyle: FontStyle.normal,
                      color: AppColors.k1FAF9E.withOpacity(0.5),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    size: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
        h(50.h),
        ListView.separated(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.only(left: 15),
          itemBuilder: (context, index) {
            var expiryDate = ctrl.getDate(index);

            return voucherCard(
              title: ctrl.assignedVouchers[index].name ?? 'NTUC Fairprice',
              imgUrl: ctrl.assignedVouchers[index].voucher!['icon_url'] == null
                  ? 'https://picsum.photos/200/300'
                  : ctrl.assignedVouchers[index].voucher?['icon_url']
                          .toString() ??
                      'https://picsum.photos/200/300',
              amount: ctrl.assignedVouchers[index].amount ?? 0,
              whichScreen: 'Assign Voucher',
              voucherCode: ctrl.assignedVouchers[index].voucherId ?? '15015403',
              date: expiryDate ?? '1, Nov 2021',
              onTap: () {},
              voucherState: ctrl.checkIsExpired(index)
                  ? VoucherState.expired
                  : (ctrl.assignedVouchers[index].isActive ?? false
                      ? VoucherState.redeemed
                      : VoucherState.active),
              btnText: ctrl.checkIsExpired(index)
                  ? 'Expired Voucher'
                  : (ctrl.assignedVouchers[index].isActive ?? false
                      ? 'Already Redeemed'
                      : 'Active Voucher'),
              isQRScreen: false,
            );
          },
          separatorBuilder: (context, index) => h(1.h),
          itemCount: ctrl.assignedVouchers.length,
        ),
      ],
    );
  }
}
