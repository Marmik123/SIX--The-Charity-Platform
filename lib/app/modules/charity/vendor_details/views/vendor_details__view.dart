import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/data/local/user_provider.dart';
import 'package:six/app/data/models/sliver_persistent_header.dart';
import 'package:six/app/modules/charity/available_vendors/controllers/available_vendors_controller.dart';
import 'package:six/app/modules/charity/purchase/controllers/purchase_controller.dart';
import 'package:six/app/modules/charity/vendor_details/controllers/vendor_details_controller.dart';
import 'package:six/app/modules/social_worker/assigned_voucher/views/voucher_details_view.dart';
import 'package:six/app/ui/components/catched_image.dart';
import 'package:six/app/ui/components/circular_progress_indicator.dart';
import 'package:six/app/ui/components/indexed_stack_tab_item.dart';
import 'package:six/app/ui/components/rounded_gradient_btn.dart';
import 'package:six/app/ui/components/sizedbox.dart';
import 'package:six/r.g.dart';

class VendorDetailsView extends GetView<VendorDetailsController> {
  final AvailableVendorsController availVendorCtrl = Get.find();
  final PurchaseController purchaseController = Get.put(PurchaseController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // width: Get.width,
      body: Obx(() => availVendorCtrl.isLoading()
          ? Center(child: buildLoader())
          : NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowGlow();
                return false;
              },
              child: RefreshIndicator(
                onRefresh: () async {
                  if (UserProvider.role == 'social_worker') {
                    return controller.assignAvailVouchers();
                  }
                  return;
                },
                child: CustomScrollView(
                  shrinkWrap: true,
                  // clipBehavior: Clip.none,
                  physics: const AlwaysScrollableScrollPhysics(),
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
                            padding: EdgeInsets.only(top: 300.h),
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(200.r),
                                child: cacheImage(
                                  height: 380.r,
                                  width: 380.r,
                                  url: availVendorCtrl
                                          .vendorDetails?['profile_image_url']
                                      as String?,
                                  placeholder: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ImageIcon(
                                      R.image.vendors(),
                                      color: AppColors.k033660,
                                      size: 200.r,
                                    ),
                                  ),
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
                                    availVendorCtrl
                                                .vendorDetails!['first_name'] ==
                                            null
                                        ? const SizedBox.shrink()
                                        : Text(
                                            availVendorCtrl.vendorDetails?[
                                                        'first_name']
                                                    .toString() ??
                                                'Vendor Name',
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
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                      ),
                                      child: Center(
                                        child: Text(
                                          purchaseController
                                              .voucherCategory[availVendorCtrl
                                                  .categoryIndex()]
                                              .name,
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
                                        color:
                                            AppColors.k00474E.withOpacity(0.04),
                                        offset: const Offset(0, 20),
                                        blurRadius: 50.r,
                                      ),
                                    ],
                                  ),
                                  child: availVendorCtrl.vendorDetails![
                                                      'user_metadata']
                                                  ['mobile_number'] ==
                                              null &&
                                          availVendorCtrl.vendorDetails?[
                                                  'user_metadata']['address'] ==
                                              null &&
                                          availVendorCtrl.vendorDetails![
                                                  'user_metadata']['email'] ==
                                              null
                                      ? const Center(
                                          child: Text('No Data Available'))
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            availVendorCtrl.vendorDetails![
                                                            'user_metadata']
                                                        ['email'] ==
                                                    null
                                                ? const SizedBox.shrink()
                                                : Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        width: 50.w,
                                                      ),
                                                      Image.asset(
                                                        R.image.asset.message
                                                            .assetName,
                                                        height: 39.h,
                                                        width: 44.w,
                                                      ),
                                                      SizedBox(
                                                        width: 26.w,
                                                      ),
                                                      Text(
                                                        availVendorCtrl
                                                                .vendorDetails?[
                                                                    'user_metadata']
                                                                    ['email']
                                                                .toString() ??
                                                            'contact@dh.com',
                                                        style: TextStyle(
                                                          fontFamily: 'Gilroy',
                                                          fontSize: 40.sp,
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
                                                    ],
                                                  ),
                                            availVendorCtrl.vendorDetails![
                                                            'user_metadata']
                                                        ['mobile_number'] ==
                                                    null
                                                ? const SizedBox.shrink()
                                                : Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        width: 50.w,
                                                      ),
                                                      Image.asset(
                                                        R.image.asset.call
                                                            .assetName,
                                                        height: 39.h,
                                                        width: 44.w,
                                                      ),
                                                      SizedBox(
                                                        width: 26.w,
                                                      ),
                                                      Text(
                                                        availVendorCtrl
                                                                .vendorDetails?[
                                                                    'user_metadata']
                                                                    [
                                                                    'mobile_number']
                                                                .toString() ??
                                                            '+1 987 654 3210',
                                                        style: TextStyle(
                                                          fontFamily: 'Gilroy',
                                                          fontSize: 40.sp,
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
                                                    ],
                                                  ),
                                            availVendorCtrl.vendorDetails?[
                                                            'user_metadata']
                                                        ['address'] ==
                                                    null
                                                ? const SizedBox.shrink()
                                                : Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        width: 50.w,
                                                      ),
                                                      Image.asset(
                                                        R.image.asset.location
                                                            .assetName,
                                                        height: 39.h,
                                                        width: 44.w,
                                                      ),
                                                      SizedBox(
                                                        width: 26.w,
                                                      ),
                                                      Text(
                                                        (availVendorCtrl.vendorDetails?[
                                                                        'user_metadata']
                                                                    ['address']
                                                                as String?) ??
                                                            '-',
                                                        style: TextStyle(
                                                          fontFamily: 'Gilroy',
                                                          fontSize: 40.sp,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          color:
                                                              AppColors.k033660,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
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
                    UserProvider.role == 'charity'
                        ? SliverPersistentHeader(
                            pinned: true,
                            delegate: SliverAppBarDelegate(
                              minHeight: 100.h,
                              maxHeight: 100.h,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 22,
                                  top: 5,
                                ),
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
                              ),
                            ),
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
                                                  /*if (index == 1) {
                                                    controller
                                                        .assignAvailVouchers();
                                                  }*/
                                                },
                                                child: indexedStackTabItem(
                                                  controller.text[index],
                                                  controller.textNewLine[index],
                                                  index,
                                                  controller.tabIndex(),
                                                  410.w,
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
                          UserProvider.role == 'charity'
                              ? Padding(
                                  padding:
                                      EdgeInsets.only(left: 20.0, top: 50.h),
                                  child: Text(
                                    (availVendorCtrl
                                                .vendorDetails?['user_metadata']
                                            ['about_us'] as String?) ??
                                        '-',
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
                                                      padding: EdgeInsets.only(
                                                          left: 60.w,
                                                          right: 77.w),
                                                      child: Text(
                                                        (availVendorCtrl.vendorDetails?[
                                                                        'user_metadata']
                                                                    ['about_us']
                                                                as String?) ??
                                                            '-',
                                                        style: TextStyle(
                                                          fontFamily: 'Gilroy',
                                                          fontSize: 42.sp,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          color:
                                                              AppColors.k6886A0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : const SizedBox.shrink(),
                                          controller.tabIndex() == 1
                                              ? controller.isLoading()
                                                  ? Center(child: buildLoader())
                                                  : Container(
                                                      width: 1.sw,
                                                      child: controller
                                                              .availableVouchers()
                                                              .isEmpty
                                                          ? Text(
                                                              'No Available Vouchers',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Gilroy',
                                                                fontSize: 42.sp,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                color: AppColors
                                                                    .k6886A0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            )
                                                          : ListView.separated(
                                                              shrinkWrap: true,
                                                              physics:
                                                                  const ClampingScrollPhysics(),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 10,
                                                                right: 10,
                                                                bottom: 35,
                                                              ),
                                                              itemBuilder:
                                                                  (context,
                                                                      index) {
                                                                var expiryDate =
                                                                    controller
                                                                        .getDate(
                                                                            index);
                                                                return Stack(
                                                                  alignment:
                                                                      Alignment
                                                                          .bottomCenter,
                                                                  clipBehavior:
                                                                      Clip.none,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          1005.w,
                                                                      height:
                                                                          458.h,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: AppColors
                                                                            .kffffff,
                                                                        borderRadius:
                                                                            BorderRadius.circular(50.r),
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            color:
                                                                                AppColors.k00474E.withOpacity(0.04),
                                                                            offset:
                                                                                const Offset(0, 20),
                                                                            blurRadius:
                                                                                50.r,
                                                                          )
                                                                        ],
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(right: 18.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              1005.w,
                                                                          height:
                                                                              150.h,
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              SizedBox(
                                                                                height: 49.h,
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsets.only(left: 32.0),
                                                                                child: Stack(
                                                                                  clipBehavior: Clip.none,
                                                                                  alignment: Alignment.centerLeft,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 515.w,
                                                                                      height: 139.h,
                                                                                      decoration: BoxDecoration(color: AppColors.kF8FAFA, borderRadius: BorderRadius.circular(50.r)),
                                                                                      child: Center(
                                                                                        child: Text(
                                                                                          controller.availableVouchers[index].name.toString(),
                                                                                          style: TextStyle(
                                                                                            fontFamily: 'Gilroy',
                                                                                            fontSize: 50.sp,
                                                                                            fontStyle: FontStyle.normal,
                                                                                            color: AppColors.k033660,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                          textAlign: TextAlign.center,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Positioned(
                                                                                      left: -15,
                                                                                      child: CircleAvatar(
                                                                                        backgroundColor: Colors.transparent,
                                                                                        child: ClipRRect(
                                                                                          borderRadius: BorderRadius.circular(30),
                                                                                          child: FittedBox(
                                                                                            fit: BoxFit.fill,
                                                                                            child: cacheImage(
                                                                                              height: 121.r,
                                                                                              width: 121.r,
                                                                                              url: controller.availableVouchers[index].iconUrl,
                                                                                              placeholder: ImageIcon(
                                                                                                R.image.vouchers(),
                                                                                                color: AppColors.k033660,
                                                                                                size: 35,
                                                                                              ),
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
                                                                                      '\$${controller.availableVouchers[index].amount}',
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
                                                                                      color: AppColors.k6886A0.withOpacity(0.5),
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
                                                                                              text: TextSpan(
                                                                                                children: <TextSpan>[
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
                                                                                                    text: expiryDate,
                                                                                                    style: TextStyle(
                                                                                                      fontFamily: 'Gilroy',
                                                                                                      fontSize: 40.sp,
                                                                                                      color: AppColors.k033660,
                                                                                                      fontStyle: FontStyle.normal,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
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
                                                                      bottom:
                                                                          -20,
                                                                      child:
                                                                          roundedButton(
                                                                        text:
                                                                            'View Details',
                                                                        onTap:
                                                                            () {
                                                                          Get.to<void>(() =>
                                                                              VoucherDetailsView(
                                                                                voucher: controller.availableVouchers[index],
                                                                              ));
                                                                        },
                                                                        width:
                                                                            925.w,
                                                                        height:
                                                                            120.h,
                                                                        fontSize:
                                                                            45.sp,
                                                                      ),
                                                                    )
                                                                  ],
                                                                );
                                                              },
                                                              separatorBuilder:
                                                                  (context,
                                                                          index) =>
                                                                      h(150.h),
                                                              itemCount: controller
                                                                  .availableVouchers()
                                                                  .length,
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
            )),
    );
  }
}
