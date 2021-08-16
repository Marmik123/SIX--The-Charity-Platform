import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/modules/social_worker/beneficiary_details/controllers/beneficiary_details_controller.dart';
import 'package:six/app/ui/components/catched_image.dart';
import 'package:six/app/ui/components/sizedbox.dart';
import 'package:six/r.g.dart';

import '../controllers/connected_organization_controller.dart';

class ConnectedOrganizationView
    extends GetView<ConnectedOrganizationController> {
  final BeneficiaryDetailsController ctrl =
      Get.put(BeneficiaryDetailsController());
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(
        top: 0.0,
        left: 20,
        right: 20,
      ),
      itemCount: ctrl.connectedOrg.length,
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) => h(25.h),
      itemBuilder: (context, index) {
        return Container(
          height: 380.h,
          width: 1005.w,
          decoration: BoxDecoration(
            color: AppColors.kffffff,
            borderRadius: BorderRadius.circular(50.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.k00474E.withOpacity(0.04),
                blurRadius: 50.r,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              top: 8,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(90.r),
                  child: cacheImage(
                    height: 180.r,
                    width: 180.r,
                    url: ctrl.connectedOrg[index].profileImageUrl.toString(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ctrl.connectedOrg[index].userMetadata?.entityName ??
                            'Entity Name',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 50.sp,
                          fontStyle: FontStyle.normal,
                          color: AppColors.k033660,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      h(15.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            R.image.asset.location.assetName,
                            height: 37.h,
                            width: 31.w,
                          ),
                          w(15.w),
                          Container(
                            height: 100.h,
                            width: 700.w,
                            child: Text(
                              ctrl.connectedOrg[index].userMetadata
                                      ?.displayAddress
                                      .toString() ??
                                  'display address',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 40.sp,
                                fontStyle: FontStyle.normal,
                                color: AppColors.k033660.withOpacity(0.7),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      h(15.h),
                      /* roundedButton(
                        text: 'View Details',
                        onTap: () {},
                        width: 281.w,
                        height: 100.h,
                        fontSize: 35.sp,
                      ),*/
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
