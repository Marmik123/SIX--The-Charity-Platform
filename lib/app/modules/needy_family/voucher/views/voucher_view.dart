import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/modules/needy_family/home/controllers/home_controller.dart';
import 'package:six/app/routes/app_pages.dart';
import 'package:six/app/ui/components/common_voucher_card.dart';
import 'package:six/r.g.dart';

import '../controllers/voucher_controller.dart';

class VoucherView extends GetView<VoucherController> {
  VoucherController ctrl = Get.put(VoucherController());
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kffffff,
      body: VoucherContent(ctrl: ctrl, homeController: homeController),
    );
  }
}

class VoucherContent extends StatelessWidget {
  const VoucherContent({
    Key? key,
    required this.ctrl,
    required this.homeController,
  }) : super(key: key);

  final VoucherController ctrl;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          overflow: Overflow.visible,
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
                    children: [
                      SizedBox(
                        width: 467.w,
                      ),
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
                      SizedBox(
                        width: 247.w,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 160.w,
                          height: 160.h,
                          decoration: BoxDecoration(
                              color: AppColors.kffffff,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 40.r,
                                  color: AppColors.k00474E.withOpacity(0.08),
                                  offset: Offset(0, 20),
                                )
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(70.r))),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset(
                              R.image.voucher_filter().assetName,
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -40,
              left: -60,
              right: 0,
              top: 30,
              child: Container(
                height: 280.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 70,
                    right: 10,
                  ),
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) => Obx(() => Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              ctrl.selectedCategory.value = index;
                            },
                            child: Container(
                              width: 380.w,
                              height: 271.h,
                              decoration: BoxDecoration(
                                  color: AppColors.kffffff,
                                  borderRadius: BorderRadius.circular(50.r),
                                  gradient: ctrl.selectedCategory.value !=
                                              null &&
                                          ctrl.selectedCategory.value == index
                                      ? LinearGradient(
                                          begin: Alignment(-1, -2.8),
                                          end: Alignment(1, 2),
                                          colors: [
                                              AppColors.k1FAF9E,
                                              AppColors.k0087FF
                                            ])
                                      : LinearGradient(colors: [
                                          AppColors.kffffff,
                                          AppColors.kffffff
                                        ]),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            AppColors.k000000.withOpacity(0.04),
                                        blurRadius: 50.r,
                                        offset: Offset(0, 20))
                                  ]),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 40.h,
                                  ),
                                  Image.asset(
                                    ctrl.selectedCategory.value != null &&
                                            ctrl.selectedCategory.value == index
                                        ? R.image.asset.voucher_card_1.assetName
                                        : R.image.asset.super_market.assetName,
                                    height: 113.h,
                                    width: 104.w,
                                  ),
                                  SizedBox(
                                    height: 30.5.h,
                                  ),
                                  Text(
                                    'Super - Market',
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize: 40.sp,
                                      fontStyle: FontStyle.normal,
                                      color:
                                          ctrl.selectedCategory.value != null &&
                                                  ctrl.selectedCategory.value ==
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
            )
          ],
        ),
        Expanded(
          child: ListView(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 60.w,
                  ),
                  voucherCard(
                    title: 'NTUC Fairprice',
                    amount: 10,
                    date: '31,Nov 2021',
                    imgUrl: 'https://picsum.photos/id/1011/200/300',
                    onTap: () {
                      homeController.currentIndex!.value = 1;
                      Get.toNamed<void>(Routes.VOUCHER_REDEMPTION);
                    },
                    voucherCode: '15015403',
                    btnText: 'Redeem Now',
                    voucherState: VoucherState.active,
                    isQRScreen: false,
                  ), //Common Voucher Card
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 60.w,
                  ),
                  voucherCard(
                    title: 'Sheng Siong',
                    amount: 20,
                    date: '1,Oct 2021',
                    imgUrl: 'https://picsum.photos/id/1012/200/300',
                    onTap: () {},
                    voucherCode: '15015403',
                    btnText: 'Already Redeemed',
                    voucherState: VoucherState.redeemed,
                    isQRScreen: false,
                  ), //Common Voucher Card
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 60.w,
                  ),
                  voucherCard(
                    title: 'NTUC Fairprice',
                    amount: 15,
                    date: '1,Jan 2021',
                    imgUrl: 'https://picsum.photos/id/1013/200/300',
                    voucherCode: '15015403',
                    onTap: () {},
                    btnText: 'Expired Voucher',
                    voucherState: VoucherState.expired,
                    isQRScreen: false,
                  ), //Common Voucher Card
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
