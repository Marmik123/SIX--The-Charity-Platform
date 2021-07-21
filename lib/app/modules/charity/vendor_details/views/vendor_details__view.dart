import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/data/models/sliver_persistent_header.dart';
import 'package:six/app/modules/charity/vendor_details/controllers/vendor_details_controller.dart';
import 'package:six/app/modules/social_worker/assigned_voucher/views/voucher_details_view.dart';
import 'package:six/app/ui/components/catched_image.dart';
import 'package:six/app/ui/components/indexed_stack_tab_item.dart';
import 'package:six/app/ui/components/rounded_gradient_btn.dart';
import 'package:six/app/ui/components/sizedbox.dart';
import 'package:six/r.g.dart';

class VendorDetailsView extends GetView<VendorDetailsController> {
  VendorDetailsView({required String whichScreen});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: Get.width,
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowGlow();
            return false;
          },
          child: CustomScrollView(
            shrinkWrap: true,
            // clipBehavior: Clip.none,
            physics: const ClampingScrollPhysics(),
            controller: controller.scrollController,
            slivers: [
              SliverAppBar(
                pinned: true,
                floating: true,
                titleSpacing: 0.0,
                centerTitle: true,
                elevation: 5,
                expandedHeight: 600.h,
                toolbarHeight: 200.h,
                backgroundColor: AppColors.kE3FCFF,
                shadowColor: AppColors.k00474E.withOpacity(0.14),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: AppColors.k033660,
                  onPressed: () {
                    Get.back<void>();
                  },
                ),
                title: Text(
                  'Details',
                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 50.sp,
                    fontStyle: FontStyle.normal,
                    color: AppColors.k033660,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 58.0),
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
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          color: AppColors.kE3FCFF,
                          width: Get.width,
                          height: 400.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
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
                              h(40.h),
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
                              h(60.h),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 204.h,
                          child: Container(
                            width: 1005.w,
                            height: 384.h,
                            decoration: BoxDecoration(
                              color: AppColors.kffffff,
                              borderRadius: BorderRadius.circular(50.r),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.k00474E.withOpacity(0.04),
                                  offset: const Offset(0, 20),
                                  blurRadius: 50.r,
                                ),
                              ],
                            ),
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
                                    ),
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
                                    ),
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
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    h(190.h),
                  ],
                ),
              ),
              controller.whichScreen == 'Charity'
                  ? SliverPersistentHeader(
                      pinned: true,
                      delegate: SliverAppBarDelegate(
                          minHeight: 100.h,
                          maxHeight: 100.h,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 22, top: 5),
                            child: Text(
                              'About Us',
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 60.sp,
                                fontStyle: FontStyle.normal,
                                color: AppColors.k033660.withOpacity(0.5),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          )),
                    )
                  : SliverPersistentHeader(
                      pinned: true,
                      delegate: SliverAppBarDelegate(
                        minHeight: 190.h,
                        maxHeight: 190.h,
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  //padding: const EdgeInsets.only(left: 20, right: 20),
                                  width: 1.sw,
                                  color: AppColors.kffffff,
                                  child: Obx(
                                    () => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: List.generate(
                                        2,
                                        (index) => TextButton(
                                          onPressed: () {
                                            controller.tabIndex(index);
                                          },
                                          child: indexedStackTabItem(
                                            controller.text[index],
                                            controller.textNewLine[index],
                                            index,
                                            'Details',
                                            controller.tabIndex(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 8,
                                  child: Container(
                                    width: 935.w,
                                    height: 2.h,
                                    color: AppColors.kB4C3D0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    controller.whichScreen == 'Charity'
                        ? Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              '\nLorem ipsum dolor sit amet, consectetur adipiscing\nelit, sed do eiusmod tempor incididunt ut labore et\ndolore magna aliqua. Ut enim ad minim veniam, \nquis nostrud exercitation ullamco laboris nisi ut\naliquip ex ea commodo consequat.\n\nLorem ipsum dolor sit amet, consectetur adipiscing\nelit, sed do eiusmod tempor incididunt ut labore et\ndolore magna aliqua. Ut enim ad minim veniam,\nquis nostrud exercitation ullamco laboris nisi ut\naliquip ex ea commodo consequat.  ',
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 42.sp,
                                fontStyle: FontStyle.normal,
                                color: AppColors.k033660.withOpacity(0.5),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          )
                        : Container(
                            width: 1.sw,
                            child: Obx(() => IndexedStack(
                                  index: controller.tabIndex(),
                                  children: <Widget>[
                                    controller.tabIndex() == 0
                                        ? Container(
                                            height: 900.h,
                                            width: 0.99.sw,
                                            child: SingleChildScrollView(
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20.0),
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
                                          )
                                        : const SizedBox.shrink(),
                                    controller.tabIndex() == 1
                                        ? Container(
                                            width: 1.sw,
                                            child: ListView.separated(
                                              shrinkWrap: true,
                                              physics:
                                                  const ClampingScrollPhysics(),
                                              padding: const EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                bottom: 35,
                                              ),
                                              itemBuilder: (context, index) =>
                                                  Stack(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                clipBehavior: Clip.none,
                                                children: [
                                                  Container(
                                                    width: 1005.w,
                                                    height: 458.h,
                                                    decoration: BoxDecoration(
                                                      color: AppColors.kffffff,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.r),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: AppColors
                                                              .k00474E
                                                              .withOpacity(
                                                                  0.04),
                                                          offset: const Offset(
                                                              0, 20),
                                                          blurRadius: 50.r,
                                                        )
                                                      ],
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 18.0),
                                                      child: Container(
                                                        width: 1005.w,
                                                        height: 150.h,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                              height: 49.h,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          32.0),
                                                              child: Stack(
                                                                clipBehavior:
                                                                    Clip.none,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                children: [
                                                                  Container(
                                                                    width:
                                                                        515.w,
                                                                    height:
                                                                        139.h,
                                                                    decoration: BoxDecoration(
                                                                        color: AppColors
                                                                            .kF8FAFA,
                                                                        borderRadius:
                                                                            BorderRadius.circular(50.r)),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        'NTUC Fairprice',
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              'Gilroy',
                                                                          fontSize:
                                                                              50.sp,
                                                                          fontStyle:
                                                                              FontStyle.normal,
                                                                          color:
                                                                              AppColors.k033660,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    left: -15,
                                                                    child:
                                                                        CircleAvatar(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(30),
                                                                        child:
                                                                            FittedBox(
                                                                          fit: BoxFit
                                                                              .fill,
                                                                          child:
                                                                              cacheImage(
                                                                            height:
                                                                                121.r,
                                                                            width:
                                                                                121.r,
                                                                            url:
                                                                                'https://picsum.photos/id/1011/180',
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
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
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Gilroy',
                                                                      fontSize:
                                                                          100.sp,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .normal,
                                                                      color: AppColors
                                                                          .k033660,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        144.w,
                                                                  ),
                                                                  Container(
                                                                    height:
                                                                        81.h,
                                                                    width: 3.w,
                                                                    color: AppColors
                                                                        .k6886A0
                                                                        .withOpacity(
                                                                            0.5),
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        166.w,
                                                                  ),
                                                                  FittedBox(
                                                                    fit: BoxFit
                                                                        .contain,
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        FittedBox(
                                                                          child:
                                                                              RichText(
                                                                            text:
                                                                                TextSpan(children: <TextSpan>[
                                                                              TextSpan(
                                                                                text: 'Expire Date : ',
                                                                                style: TextStyle(
                                                                                  fontFamily: 'Gilroy',
                                                                                  fontSize: 40.sp,
                                                                                  color: AppColors.k033660.withOpacity(0.6),
                                                                                  fontStyle: FontStyle.normal,
                                                                                  fontWeight: FontWeight.w400,
                                                                                ),
                                                                              ),
                                                                              TextSpan(
                                                                                text: '1, Nov 2021',
                                                                                style: TextStyle(
                                                                                  fontFamily: 'Gilroy',
                                                                                  fontSize: 40.sp,
                                                                                  color: AppColors.k033660,
                                                                                  fontStyle: FontStyle.normal,
                                                                                  fontWeight: FontWeight.w500,
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
                                                        Get.to<void>(() =>
                                                            VoucherDetailsView());
                                                      },
                                                      width: 925.w,
                                                      height: 120.h,
                                                      fontSize: 45.sp,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              separatorBuilder:
                                                  (context, index) => h(150.h),
                                              itemCount: 15,
                                            ),
                                          )
                                        : const SizedBox.shrink(),
                                  ],
                                )),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
