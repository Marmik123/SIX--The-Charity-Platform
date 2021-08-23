import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/modules/social_worker/beneficiary_details/controllers/beneficiary_details_controller.dart';
import 'package:six/app/ui/components/circular_progress_indicator.dart';
import 'package:six/app/ui/components/common_voucher_card.dart';
import 'package:six/app/ui/components/sizedbox.dart';

import '../controllers/assigned_voucher_controller.dart';

class AssignedVoucherView extends GetView<AssignedVoucherController> {
  final BeneficiaryDetailsController ctrl =
      Get.put(BeneficiaryDetailsController());
  @override
  final AssignedVoucherController controller =
      Get.put(AssignedVoucherController());
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
            Obx(() => RichText(
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
                )),
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
              child: Obx(() => PopupMenuButton<int>(
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
                      ctrl.getFilterAssignedVouchers(type);
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
                        /*value: monthPicker(
                                color: AppColors.kF2FEFF,
                                borderColor: AppColors.kD8FCFF,

                                height: 90.h,
                                shadowColor: AppColors.kffffff,
                                textContent: Text(
                                  ctrl
                                      .graphDetails()[index]
                                      .title
                                      .toString(),
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontSize: 35.sp,
                                    fontStyle: FontStyle.normal,
                                    color: AppColors.k13A89E,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                width: 627.w,
                                onTapArrow: () {},
                              ),*/
                        value: index,
                        child: Container(
                          width: 525.w,
                          child: Text(
                            controller.assignedVoucherFilter()[index],
//'Support Beneficiary Fund',
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
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          controller.assignedVoucherFilter()[
                              controller.voucherFilterIndex()],
//'Support Beneficiary Fund',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 35.sp,
                            fontStyle: FontStyle.normal,
                            color: AppColors.k13A89E,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          size: 15,
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
        h(50.h),
        Obx(() => ctrl.filterLoading()
            ? buildLoader()
            : ListView.separated(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.only(left: 15),
                itemBuilder: (context, index) {
                  var expiryDate = ctrl.getDate(index);
                  return voucherCard(
                    title:
                        ctrl.assignedVouchers[index].name ?? 'NTUC Fairprice',
                    imgUrl: ctrl.assignedVouchers[index].voucher!['icon_url'] ==
                            null
                        ? 'https://picsum.photos/200/300'
                        : ctrl.assignedVouchers[index].voucher?['icon_url']
                                .toString() ??
                            'https://picsum.photos/200/300',
                    terms:
                        '${ctrl.assignedVouchers[index].voucher?['terms'] ?? '-'}',
                    amount: ctrl.assignedVouchers[index].amount ?? 0,
                    whichScreen: 'Assign Voucher',
                    voucherCode:
                        ctrl.assignedVouchers[index].voucherId ?? '15015403',
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
              )),
      ],
    );
  }
}
