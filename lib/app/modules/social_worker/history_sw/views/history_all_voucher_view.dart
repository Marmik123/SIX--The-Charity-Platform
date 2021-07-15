import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/modules/social_worker/history_sw/controllers/history_sw_controller.dart';
import 'package:six/app/ui/components/common_voucher_card.dart';
import 'package:six/app/ui/components/sizedbox.dart';

class HistoryAllVoucherView extends GetView<HistorySwController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: 1005.w,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => Column(
          children: [
            voucherCard(
              title: 'Sheng Siong',
              imgUrl: 'imgUrl',
              amount: 20,
              voucherCode: '15015783',
              date: '1, Oct 2021',
              onTap: () {},
              voucherState: VoucherState.active,
              btnText: 'Already Assigned',
              whichScreen: 'History',
              isQRScreen: false,
            ),
            voucherCard(
              title: 'Sheng Siong',
              imgUrl: 'imgUrl',
              amount: 20,
              voucherCode: '15015783',
              date: '1, Oct 2021',
              onTap: () {},
              voucherState: VoucherState.active,
              btnText: 'Already Redeemed',
              whichScreen: 'History',
              isQRScreen: false,
            )
          ],
        ),
        separatorBuilder: (context, index) => h(10.h),
        itemCount: 1,
      ),
    );
  }
}
