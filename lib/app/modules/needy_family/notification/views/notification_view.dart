import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/ui/components/catched_image.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kffffff,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 200.h,
          backgroundColor: AppColors.kF2FEFF,
          title: Text(
            'Notification',
            style: TextStyle(
              fontFamily: 'Gilroy',
              fontSize: 50.sp,
              fontStyle: FontStyle.normal,
              color: AppColors.k033660,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Get.back<void>();
            },
            child: Icon(
              Icons.arrow_back_sharp,
              color: AppColors.k033660,
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 60.h,
            ),
            ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(
                  left: 12.0,
                  bottom: 10,
                  right: 12,
                ),
                child: Container(
                  height: 255.h,
                  width: 1005.w,
                  decoration: BoxDecoration(
                    color: AppColors.kffffff,
                    borderRadius: BorderRadius.circular(50.r),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 50.r,
                        offset: Offset(0, 15),
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
                          width: 40.w,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(70.r),
                          child: cacheImage(
                              height: 130.r,
                              width: 130.r,
                              url: 'https://picsum.photos/id/1027/400'),
                        ),
                        SizedBox(
                          width: 35.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text:
                                      'Hey, Peter you have been assigned new\nvoucher from',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontSize: 42.sp,
                                    fontStyle: FontStyle.normal,
                                    color: AppColors.k6886A0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: ' NTUC Fairprice.',
                                      style: TextStyle(
                                        fontFamily: 'Gilroy',
                                        fontSize: 42.sp,
                                        fontStyle: FontStyle.normal,
                                        color: AppColors.k033660,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ]),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              '12min ago',
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 30.sp,
                                fontStyle: FontStyle.normal,
                                color: AppColors.k6886A0,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
