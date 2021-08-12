import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/modules/social_worker/beneficiary_details/controllers/beneficiary_details_controller.dart';
import 'package:six/app/routes/app_pages.dart';
import 'package:six/app/ui/components/rounded_gradient_btn.dart';
import 'package:six/app/ui/components/sizedbox.dart';
import 'package:six/app/utils/material_prop_ext.dart';
import 'package:six/r.g.dart';

class NoteDetailsView extends GetView<BeneficiaryDetailsController> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 80,
      ),
      physics: const ClampingScrollPhysics(),
      children: [
        h(25.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Note',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 18,
                fontStyle: FontStyle.normal,
                color: AppColors.k033660.withOpacity(0.5),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            roundedButton(
              text: 'New Note',
              onTap: () {
                Get.toNamed<void>(
                  Routes.ADD_NOTE,
                );
              },
              width: 264.w,
              height: 100.h,
              fontSize: 40.sp,
            ),
          ],
        ),
        h(25.h),
        Obx(() => ListView.separated(
              padding: const EdgeInsets.all(0),
              shrinkWrap: true,
              itemCount: controller.notesList().length,
              physics: const ClampingScrollPhysics(),
              separatorBuilder: (context, index) => h(15.h),
              itemBuilder: (context, index) => Container(
                width: 1005.w,
                height: 300.h,
                decoration: BoxDecoration(
                  color: AppColors.kffffff,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 20),
                      blurRadius: 50.r,
                      color: AppColors.k00474E.withOpacity(0.04),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 10,
                    top: 10,
                    bottom: 5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Row(
                          children: [
                            Image.asset(
                              R.image.asset.calendar.assetName,
                              height: 33.h,
                              width: 30.w,
                            ),
                            w(15.w),
                            Text(
                              DateTime.fromMillisecondsSinceEpoch(int.tryParse(
                                      controller
                                          .notesList()[index]['createdOn']
                                          .toString())!)
                                  .toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 38.sp,
                                fontStyle: FontStyle.normal,
                                color: AppColors.k6886A0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            w(460.w),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed<void>(
                                  Routes.EDIT_NOTE,
                                  arguments: index,
                                );
                              },
                              child: Container(
                                width: 80.r,
                                height: 80.r,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.kE3FCFF,
                                  border: Border.all(
                                    color: AppColors.kffffff,
                                    width: 1.w,
                                  ),
                                ),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Image.asset(
                                    R.image.asset.edit_icon.assetName,
                                    height: 40.r,
                                    width: 40.r,
                                  ),
                                ),
                              ),
                            ),
                            w(40.w),
                            GestureDetector(
                              onTap: () {
                                Get.defaultDialog<bool?>(
                                  title: 'Are you sure you want to delete?',
                                  titleStyle: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontSize: 50.sp,
                                    fontStyle: FontStyle.normal,
                                    color: AppColors.k033660,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  backgroundColor: AppColors.kE3FCFF,
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Get.back<void>(result: true);
                                        },
                                        style: ButtonStyle(
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          padding: EdgeInsets.zero.msp,
                                        ),
                                        child: Text(
                                          'Yes',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontFamily: 'Gilroy',
                                            fontSize: 40.sp,
                                            fontStyle: FontStyle.normal,
                                            color: AppColors.k033660,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      w(15.w),
                                      TextButton(
                                        onPressed: () {
                                          Get.back<void>(result: false);
                                        },
                                        child: Text(
                                          'No',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontFamily: 'Gilroy',
                                            fontSize: 40.sp,
                                            fontStyle: FontStyle.normal,
                                            color: AppColors.k033660,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ).then((value) {
                                  if (value ?? false) {
                                    controller.deleteNote(index);
                                  }
                                });
                              },
                              child: Container(
                                width: 80.r,
                                height: 80.r,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.kFFD7D7,
                                  border: Border.all(
                                    color: AppColors.kffffff,
                                    width: 1.w,
                                  ),
                                ),
                                child: const FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Icon(
                                      Icons.delete_outline,
                                      color: AppColors.kEF0404,
                                      size: 18,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      h(4.h),
                      SelectableText(
                        controller.notesList()[index]['note'].toString(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 42.sp,
                          fontStyle: FontStyle.normal,
                          color: AppColors.k033660,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
