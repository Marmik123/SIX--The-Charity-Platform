import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/local/user_provider.dart';
import 'package:six/app/data/models/voucher_category.dart';
import 'package:six/app/modules/charity/purchase/controllers/purchase_controller.dart';
import 'package:six/app/routes/app_pages.dart';
import 'package:six/app/ui/components/catched_image.dart';
import 'package:six/app/ui/components/circular_progress_indicator.dart';
import 'package:six/app/ui/components/common_textfield.dart';
import 'package:six/app/ui/components/sizedbox.dart';
import 'package:six/r.g.dart';

import '../controllers/available_vendors_controller.dart';

class AvailableVendorsView extends GetView<AvailableVendorsController> {
  // final VoucherCategory category;
  // final PurchaseController purchaseController = Get.put(PurchaseController());

  final currentFocus = FocusScope.of(Get.context!);

  // final int? categoryIndex;

  /*AvailableVendorsView({
    this.category,
    this.categoryIndex,
  });*/

  /*@override
  final AvailableVendorsController controller = Get.put(AvailableVendorsController());*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kffffff,
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
                            controller.txtCtrl.clear();
                            Get.back<void>();
                          },
                        ),
                        SizedBox(
                          width: 177.w,
                        ),
                        UserProvider.role == 'charity' ||
                                UserProvider.role == 'social_worker'
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
                  child: GetBuilder<AvailableVendorsController>(
                    builder: (_) => textField(
                      onChanged: (value) {
                        controller.update();
                      },
                      initialValue: '',
                      controller: controller.txtCtrl,
                      prefixText: '',
                      formKey: controller.formKey,
                      hintText: 'Search',
                      prefixImageName: R.image.asset.search.assetName,
                      onTap: () {},
                      context: context,
                      height: 160.h,
                      width: 1005.w,
                      suffixIcon: controller.txtCtrl.text.trim().isEmpty
                          ? const SizedBox.shrink()
                          : IconButton(
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
                                controller.update();
                                controller.assignVendorList(
                                    controller.voucherCategory.id);
                              },
                            ),
                      textAction: TextInputAction.search,
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
                      onFieldSubmitted: (value) {
                        if (value.isNotEmpty &&
                            UserProvider.role == 'charity') {
                          logW('message from view');
                          controller.isSearched(true);
                          controller.isLoading(true);
                          controller.assignSearchedVendor(
                              controller.voucherCategory.id, value.trim());
                          if (value.trim().isEmpty) {
                            controller.isSearched(false);
                          }
                        } else if (UserProvider.role == 'social_worker' &&
                            value.isNotEmpty) {
                          logW('message from common textfield 2nd condition');
                          controller.isSearched(true);
                          controller.isLoading(true);
                          controller.assignSearchedVendor(
                              controller.voucherCategory.id, value.trim());
                          if (value.trim().isEmpty) {
                            controller.isSearched(false);
                          }
                        }
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 100.h,
          ),
          Obx(() => controller.isLoading()
              ? buildLoader()
              : (controller.isSearched()
                      ? controller.searchedVendorList().isEmpty
                      : controller.vendorList().isEmpty)
                  ? const Text('No Vendor available')
                  : Expanded(
                      child: ListView.separated(
                        itemCount: controller.isSearched()
                            ? controller.searchedVendorList().length
                            : controller.vendorList().length,
                        physics: const BouncingScrollPhysics(),
                        separatorBuilder: (context, index) => h(25.h),
                        padding:
                            const EdgeInsets.only(top: 0, left: 10, right: 5),
                        itemBuilder: (context, index) {
                          return (controller.isSearched()
                                      ? controller
                                              .searchedVendorList()[index]
                                              .firstName ==
                                          null
                                      : controller
                                              .vendorList()[index]
                                              .firstName ==
                                          null) &&
                                  (controller.isSearched()
                                      ? controller
                                          .searchedVendorList()
                                          .isNotEmpty
                                      : controller.vendorList().isNotEmpty) &&
                                  controller.vendorList().length != 1
                              ? const SizedBox.shrink()
                              : (controller.vendorList()[index].firstName ==
                                          null &&
                                      controller.vendorList().length == 1)
                                  ? const Center(
                                      child: Text('No Vendor available'),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        controller.categoryIndex(
                                            controller.voucherCategoryIndex);
                                        controller.assignVendorDetails(
                                            controller.vendorList[index].id);

                                        Get.toNamed<void>(
                                          Routes.VENDOR_DETAILS,
                                          arguments:
                                              controller.vendorList[index].id,
                                        );
                                      },
                                      child: Container(
                                        width: 1005.w,
                                        height: 240.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50.r),
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.k00474E
                                                  .withOpacity(0.04),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  w(30.w),
                                                  Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: AppColors.kffffff,
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Center(
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(90.r),
                                                        child: cacheImage(
                                                          height: 180.r,
                                                          width: 180.r,
                                                          url: controller
                                                                  .isSearched()
                                                              ? controller
                                                                  .searchedVendorList()[
                                                                      index]
                                                                  .profileImageUrl
                                                                  .toString()
                                                              : controller
                                                                  .vendorList()[
                                                                      index]
                                                                  .profileImageUrl
                                                                  .toString(),
                                                          placeholder: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: ImageIcon(
                                                              R.image.vendors(),
                                                              color: AppColors
                                                                  .k033660,
                                                              size: 130.r,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  w(30.w),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        height: 54.h,
                                                      ),
                                                      Text(
                                                        controller.isSearched()
                                                            ? controller
                                                                .searchedVendorList()[
                                                                    index]
                                                                .firstName
                                                                .toString()
                                                            : controller
                                                                .vendorList()[
                                                                    index]
                                                                .firstName
                                                                .toString(),
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                          fontFamily: 'Gilroy',
                                                          fontSize: 50.sp,
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
                                                      h(20.h),
                                                      Container(
                                                        height: 64.h,
                                                        width: 226.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              AppColors.kFFEFF7,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.r),
                                                          border: Border.all(
                                                              color: AppColors
                                                                  .kE2E2E2,
                                                              width: 1.w),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            controller
                                                                .voucherCategory
                                                                .name,
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Gilroy',
                                                              fontSize: 30.sp,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              color: AppColors
                                                                  .kFF007A,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
/*                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 12.0, right: 20),
                                                child: roundedButton(
                                                  text: 'View Details',
                                                  onTap: () {
                                                    controller.categoryIndex(
                                                        categoryIndex);
                                                    controller
                                                        .assignVendorDetails(
                                                            controller
                                                                .vendorList[index]
                                                                .id
                                                                .toString());
                                                    Get.toNamed<void>(
                                                      Routes.VENDOR_DETAILS,
                                                      arguments: controller
                                                          .vendorList[index].id,
                                                    );
                                                  },
                                                  width: 281.w,
                                                  height: 100.h,
                                                  fontSize: 35.sp,
                                                ),
                                              ),*/
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                        },
                      ),
                    )),
        ],
      ),
    );
  }
}
