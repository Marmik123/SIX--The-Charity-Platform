import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/routes/app_pages.dart';
import 'package:six/app/ui/components/rounded_gradient_btn.dart';
import 'package:six/app/ui/components/sizedbox.dart';
import 'package:six/r.g.dart';

import '../controllers/note_details_controller.dart';

class NoteDetailsView extends GetView<NoteDetailsController> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 0,
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
                Get.toNamed<void>(Routes.ADD_NOTE);
              },
              width: 264.w,
              height: 100.h,
              fontSize: 40.sp,
            ),
          ],
        ),
        h(25.h),
        ListView.separated(
          padding: const EdgeInsets.all(0),
          shrinkWrap: true,
          itemCount: 15,
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
                  Row(
                    children: [
                      Image.asset(
                        R.image.asset.calendar.assetName,
                        height: 33.h,
                        width: 30.w,
                      ),
                      w(15.w),
                      Text(
                        '12 Apr, 2021 06:32pm',
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
                          Get.toNamed<void>(Routes.EDIT_NOTE);
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
                    ],
                  ),
                  h(4.h),
                  Text(
                    'It is a long established fact that a reader will\nbe distracted by the readable content of a\npage when looking at its layout.',
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
        ),
      ],
    );
  }
}
