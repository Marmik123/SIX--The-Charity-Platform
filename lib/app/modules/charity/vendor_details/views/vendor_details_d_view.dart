import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/modules/charity/vendor_details/controllers/vendor_details_controller.dart';
import 'package:six/app/modules/social_worker/assigned_voucher/views/voucher_details_view.dart';
import 'package:six/app/modules/social_worker/social_home/controllers/social_home_controller.dart';
import 'package:six/app/ui/components/catched_image.dart';
import 'package:six/app/ui/components/rounded_gradient_btn.dart';
import 'package:six/app/ui/components/sizedbox.dart';
import 'package:six/app/ui/components/tab_bar_social_worker.dart';
import 'package:six/r.g.dart';

class VendorDetailsView extends GetView<VendorDetailsController> {
  var socialCtrl = Get.put(SocialHomeController());
  var controller = Get.put(VendorDetailsController());
  final String whichScreen;

  VendorDetailsView({required this.whichScreen});
  @override
  Widget build(BuildContext context) {
    return Material(
        color: AppColors.kffffff,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                overflow: Overflow.visible,
                children: [
                  Container(
                    height: 1134.h,
                    width: 1125.w,
                    color: AppColors.kE3FCFF,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 170.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 60.w,
                            ),
                            Icon(
                              Icons.arrow_back,
                              color: AppColors.k033660,
                            ),
                            SizedBox(
                              width: 373.w,
                            ),
                            Text(
                              'Details',
                              maxLines: 1,
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 50.sp,
                                fontStyle: FontStyle.normal,
                                color: AppColors.k033660,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(200.r),
                              child: cacheImage(
                                height: 380.r,
                                width: 380.r,
                                url: 'https://picsum.photos/id/1011/180',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                        Text(
                          'NTUC Fairprice',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 65.sp,
                            fontStyle: FontStyle.normal,
                            color: AppColors.k033660,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          height: 64.h,
                          width: 226.w,
                          decoration: BoxDecoration(
                            color: AppColors.kffffff,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Center(
                            child: Text(
                              'Super Market',
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 30.sp,
                                fontStyle: FontStyle.normal,
                                color: AppColors.kFF007A,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 80.h,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 944.h,
                    child: Container(
                      width: 1005.w,
                      height: 384.h,
                      decoration: BoxDecoration(
                          color: AppColors.kffffff,
                          borderRadius: BorderRadius.circular(50.r),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.k00474E.withOpacity(0.04),
                              offset: Offset(0, 20),
                              blurRadius: 50.r,
                            )
                          ]),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 54.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 50.w,
                              ),
                              Image.asset(
                                R.image.asset.message.assetName,
                                height: 39.h,
                                width: 44.w,
                              ),
                              SizedBox(
                                width: 26.w,
                              ),
                              Text(
                                'contact@ntuc.com',
                                style: TextStyle(
                                  fontFamily: 'Gilroy',
                                  fontSize: 40.sp,
                                  fontStyle: FontStyle.normal,
                                  color: AppColors.k033660,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 50.w,
                              ),
                              Image.asset(
                                R.image.asset.call.assetName,
                                height: 39.h,
                                width: 44.w,
                              ),
                              SizedBox(
                                width: 26.w,
                              ),
                              Text(
                                '+1 987 654 3210',
                                style: TextStyle(
                                  fontFamily: 'Gilroy',
                                  fontSize: 40.sp,
                                  fontStyle: FontStyle.normal,
                                  color: AppColors.k033660,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 60.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 50.w,
                              ),
                              Image.asset(
                                R.image.asset.location.assetName,
                                height: 39.h,
                                width: 44.w,
                              ),
                              SizedBox(
                                width: 26.w,
                              ),
                              Text(
                                '1 Joo koon cir, 13-01 Fairprice hub, Singapore\n629117',
                                style: TextStyle(
                                  fontFamily: 'Gilroy',
                                  fontSize: 40.sp,
                                  fontStyle: FontStyle.normal,
                                  color: AppColors.k033660,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 269.h,
              ),
              whichScreen == 'Charity'
                  ? Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'About Us',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 60.sp,
                          fontStyle: FontStyle.normal,
                          color: AppColors.k033660.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : TabBar(
                      controller: controller.tabController!,
                      physics: NeverScrollableScrollPhysics(),
                      isScrollable: false,
                      indicator: UnderlineTabIndicator(
                        insets: EdgeInsets.only(left: 45.w, right: 45.w),
                        borderSide: BorderSide(
                          color: AppColors.k13A89E,
                          width: 2,
                        ),
                      ),
                      onTap: (index) {
                        socialCtrl.tabIndex!.value = index;
                      },
                      tabs: List.generate(
                        2,
                        (index) => Container(
                          //color: AppColors.kffffff,
                          height: 110.h,
                          width: 1.sw,
                          child: tabItem(
                            controller.text[index],
                            controller.textNewLine[index],
                            index,
                            whichScreen,
                          ),
                        ),
                      ),
                    ),
              SizedBox(
                height: 40.h,
              ),
              Container(
                width: 1.sw,
                height: 1.sh,
                child: Center(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: controller.tabController!,
                    children: [
                      Container(
                        height: 900.h,
                        width: 0.99.sw,
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing\nelit, sed do eiusmod tempor incididunt ut labore et\ndolore magna aliqua. Ut enim ad minim veniam,\nquis nostrud exercitation ullamco laboris nisi ut\naliquip ex ea commodo consequat. ',
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 42.sp,
                                fontStyle: FontStyle.normal,
                                color: AppColors.k6886A0,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 1.sw,
                        height: 0.7.sh,
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                            // bottom: 35,
                          ),
                          itemBuilder: (context, index) => Stack(
                            alignment: Alignment.bottomCenter,
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: 1005.w,
                                height: 458.h,
                                decoration: BoxDecoration(
                                  color: AppColors.kffffff,
                                  borderRadius: BorderRadius.circular(50.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          AppColors.k00474E.withOpacity(0.04),
                                      offset: Offset(0, 20),
                                      blurRadius: 50.r,
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 18.0),
                                  child: Container(
                                    width: 1005.w,
                                    height: 150.h,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 49.h,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 32.0),
                                          child: Stack(
                                            children: [
                                              Container(
                                                child: Center(
                                                  child: Text(
                                                    'NTUC Fairprice',
                                                    style: TextStyle(
                                                      fontFamily: 'Gilroy',
                                                      fontSize: 50.sp,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      color: AppColors.k033660,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                width: 515.w,
                                                height: 139.h,
                                                decoration: BoxDecoration(
                                                    color: AppColors.kF8FAFA,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.r)),
                                              ),
                                              Positioned(
                                                left: -15,
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    child: FittedBox(
                                                      fit: BoxFit.fill,
                                                      child: cacheImage(
                                                        height: 121.r,
                                                        width: 121.r,
                                                        url:
                                                            'https://picsum.photos/id/1011/180',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                            overflow: Overflow.visible,
                                            alignment: Alignment.centerLeft,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 40.h,
                                        ),
                                        FittedBox(
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 60.w,
                                              ),
                                              Text(
                                                '\$${10.toString()}',
                                                style: TextStyle(
                                                  fontFamily: 'Gilroy',
                                                  fontSize: 100.sp,
                                                  fontStyle: FontStyle.normal,
                                                  color: AppColors.k033660,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                width: 144.w,
                                              ),
                                              Container(
                                                height: 81.h,
                                                width: 3.w,
                                                color: AppColors.k6886A0
                                                    .withOpacity(0.5),
                                              ),
                                              SizedBox(
                                                width: 166.w,
                                              ),
                                              FittedBox(
                                                fit: BoxFit.contain,
                                                child: Column(
                                                  children: [
                                                    FittedBox(
                                                      child: RichText(
                                                        text:
                                                            TextSpan(children: <
                                                                TextSpan>[
                                                          TextSpan(
                                                            text:
                                                                'Expire Date : ',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Gilroy',
                                                              fontSize: 40.sp,
                                                              color: AppColors
                                                                  .k033660
                                                                  .withOpacity(
                                                                      0.6),
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: '1, Nov 2021',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Gilroy',
                                                              fontSize: 40.sp,
                                                              color: AppColors
                                                                  .k033660,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          )
                                                        ]),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -20,
                                child: roundedButton(
                                  text: 'View Details',
                                  onTap: () {
                                    Get.to<void>(() => VoucherDetailsView());
                                  },
                                  width: 925.w,
                                  height: 120.h,
                                  fontSize: 45.sp,
                                ),
                              )
                            ],
                          ),
                          separatorBuilder: (context, index) => h(150.h),
                          itemCount: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
