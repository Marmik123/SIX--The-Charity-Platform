import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/ui/components/common_voucher_card.dart';
import 'package:six/app/ui/components/sizedbox.dart';

import '../controllers/assigned_voucher_controller.dart';

class AssignedVoucherView extends GetView<AssignedVoucherController> {
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
                    text: '(25)',
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
          itemBuilder: (context, index) => voucherCard(
            title: 'NTUC Fairprice',
            imgUrl: 'https://picsum.photos/id/1011/180',
            amount: 10,
            whichScreen: 'Assign Voucher',
            voucherCode: '15015403',
            date: '1, Nov 2021',
            onTap: () {},
            voucherState: VoucherState.active,
            btnText: 'Active Voucher',
            isQRScreen: false,
          ),
          separatorBuilder: (context, index) => h(1.h),
          itemCount: 10,
        ),
      ],
    );
  }
}
