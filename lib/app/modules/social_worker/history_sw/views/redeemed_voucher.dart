import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/modules/social_worker/history_sw/controllers/history_sw_controller.dart';
import 'package:six/app/ui/components/common_voucher_card.dart';
import 'package:six/app/ui/components/sizedbox.dart';

class RedeemedView extends GetView<HistorySwController> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const ClampingScrollPhysics(),
      itemCount: 15,
      separatorBuilder: (context, index) => h(10.h),
      itemBuilder: (context, index) => voucherCard(
        title: 'Sheng Siong',
        imgUrl: 'https://picsum.photos/id/1011/180',
        amount: 20,
        voucherCode: '15015783',
        date: '1, Oct 2021',
        onTap: () {},
        voucherState: VoucherState.active,
        btnText: 'Already Redeemed',
        whichScreen: 'History',
        isQRScreen: false,
      ),
    );
  }
}
