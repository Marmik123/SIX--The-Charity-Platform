import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/ui/components/catched_image.dart';
import 'package:six/app/ui/components/circular_progress_indicator.dart';
import 'package:six/app/ui/components/common_appbar.dart';
import 'package:six/app/utils/url_utils.dart';
import 'package:six/r.g.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

import '../controllers/support_controller.dart';

class SupportView extends GetView<SupportController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kffffff,
        appBar: appBar(
          title: 'Support',
          height: 200.h,
          disableBackIcon: false,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 60.h,
            ),
            Obx(
              () => controller.supportLoading()
                  ? Center(child: buildLoader())
                  : ListView.builder(
                      itemCount: controller.supportDetails().length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(
                          left: 12.0,
                          bottom: 10,
                          right: 12,
                        ),
                        child: Container(
                          height: 307.h,
                          width: 1005.w,
                          decoration: BoxDecoration(
                            color: AppColors.kffffff,
                            borderRadius: BorderRadius.circular(50.r),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 50.r,
                                offset: const Offset(0, 15),
                                color: AppColors.k00474E.withOpacity(0.04),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 38.w,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(70.r),
                                  child: cacheImage(
                                    height: 130.r,
                                    width: 130.r,
                                    url: controller
                                        .supportDetails[index].profileImageUrl,
                                    placeholder: const Icon(
                                      Icons.person,
                                      color: AppColors.k033660,
                                      size: 35,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 56.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '${controller.supportDetails[index].userMetadata?.principalName ?? '-'}',
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
                                          width: 15.w,
                                        ),
                                        Container(
                                          height: 64.h,
                                          // width: 256.w,
                                          decoration: BoxDecoration(
                                            color: AppColors.kFFF5F1,
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                            border: Border.all(
                                                color: AppColors.kE2E2E2,
                                                width: 1.w),
                                          ),
                                          padding: const EdgeInsets.only(
                                              left: 8, right: 8),
                                          child: Center(
                                            child: Text(
                                              '${controller.supportDetails[index].workerUser?[0].charityUser?.userMetadata?.entityName ?? '-'}',
                                              style: TextStyle(
                                                fontFamily: 'Gilroy',
                                                fontSize: 30.sp,
                                                fontStyle: FontStyle.normal,
                                                color: AppColors.kFF9871,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        sendMail(controller
                                            .supportDetails[index]
                                            .userMetadata
                                            ?.email);
                                      },
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            R.image.asset.email.assetName,
                                            width: 43.w,
                                            height: 34.h,
                                          ),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                          Text(
                                            '${controller.supportDetails[index].userMetadata?.email ?? '-'}',
                                            style: TextStyle(
                                              fontFamily: 'Gilroy',
                                              fontSize: 45.sp,
                                              fontStyle: FontStyle.normal,
                                              color: AppColors.k033660
                                                  .withOpacity(0.6),
                                              fontWeight: FontWeight.w400,
                                            ),
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25.h,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        url_launcher.launch(
                                            'tel://${controller.supportDetails[index].userMetadata?.mobileNumber ?? '-'}');
                                      },
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            R.image.asset.phone.assetName,
                                            width: 43.w,
                                            height: 34.h,
                                          ),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                          Text(
                                            '${controller.supportDetails[index].userMetadata?.mobileNumber ?? '-'}',
                                            style: TextStyle(
                                              fontFamily: 'Gilroy',
                                              fontSize: 45.sp,
                                              fontStyle: FontStyle.normal,
                                              color: AppColors.k033660
                                                  .withOpacity(0.6),
                                              fontWeight: FontWeight.w400,
                                            ),
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ));
  }
}
