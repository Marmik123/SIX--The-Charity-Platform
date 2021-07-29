import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/modules/charity/purchase/controllers/purchase_controller.dart';
import 'package:six/app/routes/app_pages.dart';
import 'package:six/app/ui/components/catched_image.dart';
import 'package:six/app/ui/components/circular_progress_indicator.dart';
import 'package:six/app/ui/components/common_textfield.dart';
import 'package:six/app/ui/components/rounded_gradient_btn.dart';
import 'package:six/app/ui/components/sizedbox.dart';
import 'package:six/r.g.dart';

import '../controllers/available_vendors_controller.dart';

class AvailableVendorsView extends GetView<AvailableVendorsController> {
  String whichScreen;
  int? categoryIndex;
  final PurchaseController purchaseController = Get.put(PurchaseController());
  @override
  final AvailableVendorsController controller =
      Get.put(AvailableVendorsController());

  AvailableVendorsView({required this.whichScreen, this.categoryIndex});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kffffff,
        /* appBar: appBar(
          title: 'Available Vendors',
          height: 200.h,
        ),*/
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  color: AppColors.kffffff,
                  height: 460.h,
                  width: 1125.w,
                ),
                Positioned(
                  top: 0,
                  child: Container(
                      width: 1125.w,
                      height: 375.h,
                      color: AppColors.kF2FEFF,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 40.w,
                          ),
                          IconButton(
                            icon: const Icon(Icons.arrow_back),
                            color: AppColors.k033660,
                            onPressed: () {
                              Get.back<void>();
                            },
                          ),
                          SizedBox(
                            width: 177.w,
                          ),
                          whichScreen == 'Charity'
                              ? Text(
                                  'Available Vendors',
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontSize: 50.sp,
                                    fontStyle: FontStyle.normal,
                                    color: AppColors.k033660,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              : Text(
                                  'Voucher List',
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontSize: 50.sp,
                                    fontStyle: FontStyle.normal,
                                    color: AppColors.k033660,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                        ],
                      )),
                ),
                Positioned(
                  left: 60.w,
                  top: 290.h,
                  child: Center(
                    child: textField(
                      initialValue: '',
                      controller: controller.txtCtrl,
                      prefixText: '',
                      formKey: availVendorCtrl.formKey,
                      hintText: 'Search',
                      prefixImageName: R.image.asset.search.assetName,
                      onTap: () {},
                      context: context,
                      height: 160.h,
                      width: 1005.w,
                      suffixIcon: IconButton(
                        color: AppColors.k6886A0,
                        //padding: const EdgeInsets.only(top: 15),
                        alignment: Alignment.center,
                        iconSize: 20,
                        tooltip: 'Clear Text',
                        splashRadius: 2,
                        icon: const Icon(
                          Icons.clear,
                        ),
                        onPressed: () {
                          controller.txtCtrl.clear();
                          availVendorCtrl.assignVendorList(purchaseController
                              .voucherCategory[categoryIndex??0]
                              .id
                              .toString());
                        },
                      ),
                      keyBoardType: TextInputType.text,
                      textStyle: TextStyle(
                        color: AppColors.k6886A0,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Gilroy',
                        fontSize: 45.sp,
                      ),
                      hintStyle: TextStyle(
                        color: AppColors.k6886A0,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Gilroy',
                        fontSize: 45.sp,
                      ),
                      contentPadding: EdgeInsets.zero,
                      whichScreen: 'VendorDetails',
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 100.h,
            ),
            Obx(() => purchaseController.isLoading() ||
                    availVendorCtrl.isLoading()
                ? buildLoader()
                : (availVendorCtrl.isSearched()
                        ? availVendorCtrl.searchedVendorList().isEmpty
                        : availVendorCtrl.vendorList().isEmpty)
                    ? const Text('No Vendor available')
                    : Expanded(
                        child: ListView.separated(
                            itemCount: availVendorCtrl.isSearched()
                                ? availVendorCtrl.searchedVendorList().length
                                : availVendorCtrl.vendorList().length,
                            physics: const BouncingScrollPhysics(),
                            separatorBuilder: (context, index) => h(25.h),
                            padding: const EdgeInsets.only(top: 0),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 5),
                                child: Container(
                                  width: 1005.w,
                                  height: 240.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.r),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            AppColors.k00474E.withOpacity(0.04),
                                        blurRadius: 50.r,
                                        offset: const Offset(0, 20),
                                      ),
                                    ],
                                    color: AppColors.kffffff,
                                  ),
                                  child: Center(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 30.w,
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.kffffff,
                                          ),
                                          child: Center(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100.r),
                                              child: cacheImage(
                                                height: 180.r,
                                                width: 180.r,
                                                url: availVendorCtrl
                                                        .isSearched()
                                                    ? availVendorCtrl
                                                        .searchedVendorList()[
                                                            index]
                                                        .profileImageUrl
                                                        .toString()
                                                    : availVendorCtrl
                                                        .vendorList()[index]
                                                        .profileImageUrl
                                                        .toString(),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 54.h,
                                            ),
                                            Text(
                                              availVendorCtrl.isSearched()
                                                  ? availVendorCtrl
                                                      .searchedVendorList()[
                                                          index]
                                                      .firstName
                                                      .toString()
                                                  : availVendorCtrl
                                                      .vendorList()[index]
                                                      .firstName
                                                      .toString(),
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
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Container(
                                              height: 64.h,
                                              width: 226.w,
                                              decoration: BoxDecoration(
                                                color: AppColors.kFFEFF7,
                                                borderRadius:
                                                    BorderRadius.circular(20.r),
                                                border: Border.all(
                                                    color: AppColors.kE2E2E2,
                                                    width: 1.w),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  availVendorCtrl.isSearched()
                                                      ? purchaseController
                                                          .voucherCategory[
                                                              categoryIndex!]
                                                          .name
                                                          .toString()
                                                      : purchaseController
                                                          .voucherCategory[
                                                              categoryIndex!]
                                                          .name
                                                          .toString(),
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
                                          ],
                                        ),
                                        SizedBox(
                                          width: 147.w,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12.0),
                                          child: roundedButton(
                                            text: 'View Details',
                                            onTap: () {
                                              controller
                                                  .categoryIndex(categoryIndex);
                                              controller.assignVendorDetails(
                                                  availVendorCtrl
                                                      .vendorList[index].id
                                                      .toString());
                                              whichScreen == 'Social'
                                                  ? Get.toNamed<void>(
                                                      Routes.VENDOR_DETAILS,
                                                      arguments: 'Social')
                                                  : Get.toNamed<void>(
                                                      Routes.VENDOR_DETAILS,
                                                      arguments: 'Charity');
                                            },
                                            width: 281.w,
                                            height: 100.h,
                                            fontSize: 35.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )),
          ],
        ));
  }
}
