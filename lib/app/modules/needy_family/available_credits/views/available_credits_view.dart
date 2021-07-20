import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/ui/components/catched_image.dart';

import '../controllers/available_credits_controller.dart';

class AvailableCreditsView extends GetView<AvailableCreditsController> {
  final String whichRole;

  AvailableCreditsView({required this.whichRole});
  @override
  Widget build(BuildContext context) {
    //var theme = Theme.of(context);
    return Scaffold(
        backgroundColor: AppColors.kffffff,
        body: Column(
          children: [
            Container(
              width: 1125.w,
              color: AppColors.kF2FEFF,
              height: 300.h,
              child: Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 60.w,
                    ),
                    InkWell(
                      onTap: () {
                        Get.back<void>();
                      },
                      child: const Icon(
                        Icons.arrow_back_sharp,
                        color: AppColors.k033660,
                      ),
                    ),
                    SizedBox(
                      width: 255.w,
                    ),
                    Text(
                      'Available Credits',
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
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 16,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 20, left: 50),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      children: [
                        Container(
                            height: 260.h,
                            width: 916.w,
                            decoration: BoxDecoration(
                                color: AppColors.kffffff,
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          AppColors.k00474E.withOpacity(0.04),
                                      blurRadius: 50.r,
                                      offset: const Offset(0, 20))
                                ],
                                borderRadius: BorderRadius.circular(50.r)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 40.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 66.h,
                                  ),
                                  Text(
                                    'South East CDC',
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
                                    height: 19.h,
                                  ),
                                  Text(
                                    '\$300',
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize: 60.sp,
                                      fontStyle: FontStyle.normal,
                                      color: AppColors.k14A1BE,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 25.h,
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 15,
                      right: 0.78.sw,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.kffffff,
                              width: 8.w,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.k001F22.withOpacity(0.03),
                                blurRadius: 25.r,
                                offset: Offset(10.sp, 25.sp),
                              ),
                            ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: cacheImage(
                              height: 180.r,
                              width: 180.r,
                              url: 'https://picsum.photos/id/1011/180'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
