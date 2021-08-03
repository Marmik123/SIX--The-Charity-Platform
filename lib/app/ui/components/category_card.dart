import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/data/local/user_provider.dart';
import 'package:six/app/modules/charity/available_vendors/views/available_vendors_view.dart';
import 'package:six/app/modules/charity/purchase/controllers/purchase_controller.dart';
import 'package:six/app/ui/components/catched_image.dart';
import 'package:six/app/ui/components/category_curved_container.dart';
import 'package:six/app/ui/components/common_textfield.dart';

PurchaseController purchaseController = Get.put(PurchaseController());
Widget categoryCard({
  required int index,
  required String categoryName,
  //required String whichScreen,
  required double creditsRemaining,
  required double totalCredits,
  required double width,
  required double height,
  required String imageUrl,
  required Color background,
  required Color foreground,
  required Color shadow,
  required Color accent,
  required EdgeInsetsGeometry padding,
  required BuildContext context,
}) {
  return Container(
    width: width, //420.w,
    height: height, //560.h,
    decoration: BoxDecoration(
      border: Border.all(
        color: AppColors.kE2E2E2,
        width: 1.sp,
      ),
      color: background,
      borderRadius: BorderRadius.circular(50.r),
    ),
    child: Column(
      children: [
        SizedBox(
          height: 56.h,
        ),
        cacheImage(
          height: 148.h,
          width: 139.w,
          url: imageUrl,
        ), // Category Icon
        CustomPaint(
          size: Size(
            410.w,
            (410.w * 0.8622222222222222).toDouble(),
          ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
          painter: CategoryContainer(),
          child: Column(
            children: [
              SizedBox(
                height: 85.h,
              ),
              Text(
                categoryName,
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 45.sp,
                  fontStyle: FontStyle.normal,
                  color: foreground,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              UserProvider.role == 'needy'
                  ? Column(
                      children: [
                        SizedBox(
                          height: 75.h,
                        ),
                        /* Stack(
                          alignment: Alignment.topRight,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: LinearProgressIndicator(
                                value: (creditsRemaining / totalCredits),
                                color: foreground,
                                backgroundColor: accent,
                                minHeight: 6,
                              ),
                            ),
                            Positioned(
                              bottom: 4.5,
                              right: 1,
                              child: Container(
                                //alignment: Alignment.centerRight,
                                color: AppColors.kffffff,
                                height: 12.h,
                                width:
                                    totalCredits.w - creditsRemaining.w + 1.w,
                              ),
                            ),
                            Positioned(
                              bottom: -2,
                              right: 1,
                              child: Container(
                                //alignment: Alignment.centerRight,
                                color: AppColors.kffffff,
                                height: 12.h,
                                width:
                                    totalCredits.w - creditsRemaining.w + 1.w,
                              ),
                            )
                          ],
                        ),*/ //STACK CUSTOM SLIDER
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15, bottom: 3),
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbColor: Colors.transparent,
                              thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 0.0),
                              /*rangeTrackShape:
                                  RoundedRectRangeSliderTrackShape(),
                             */
                              trackShape: const RoundedRectSliderTrackShape(),
                              disabledThumbColor: Colors.transparent,
                              overlayColor: Colors.transparent,
                              overlayShape: const RoundSliderOverlayShape(
                                  overlayRadius: 0),
                              trackHeight: 6,
                            ),
                            child: FittedBox(
                              fit: BoxFit.fitHeight,
                              child: Slider(
                                value: creditsRemaining,
                                max: totalCredits,
                                min: 0,
                                onChanged: (value) {},
                                activeColor: foreground,
                                inactiveColor: accent,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 33.h,
                        ),
                        Text(
                          '\$${creditsRemaining.toInt()}',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 60.sp,
                            fontStyle: FontStyle.normal,
                            color: AppColors.k033660,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.only(
                          left: 38.0, right: 38, bottom: 27),
                      child: TextButton(
                        onPressed: () {
                          availVendorCtrl.assignVendorList(purchaseController
                              .voucherCategory[index].id
                              .toString());
                          UserProvider.role == 'charity' ||
                                  UserProvider.role == 'social_worker'
                              ? Get.to<void>(() => AvailableVendorsView(
                                    categoryIndex: index,
                                  ))
                              : Get.to<void>(() => AvailableVendorsView());
                        },
                        child: Text(
                          'View Vendors',
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 30.sp,
                            fontStyle: FontStyle.normal,
                            color: AppColors.k033660,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ],
    ),
  );
}
