import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/modules/charity/available_vendors/views/available_vendors_view.dart';
import 'package:six/app/ui/components/category_curved_container.dart';

Widget categoryCard({
  required int index,
  required String categoryName,
  required String whichScreen,
  required double creditsRemaining,
  required double totalCredits,
  required double width,
  required double height,
  required Image image,
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
        image, // Category Icon
        CustomPaint(
          child: Padding(
            padding: padding,
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
                whichScreen == 'Needy Family'
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
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbColor: Colors.transparent,
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 0.0),
                              /*rangeTrackShape:
                                  RoundedRectRangeSliderTrackShape(),
                             */
                              trackShape: RoundedRectSliderTrackShape(),
                              disabledThumbColor: Colors.transparent,
                              overlayColor: Colors.transparent,
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 0),
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
                          SizedBox(
                            height: 33.h,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
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
/*                    Padding(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: Text(
                        '/\$${totalCredits.toInt()}',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 40.sp,
                          fontStyle: FontStyle.normal,
                          color: AppColors.k033660,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )*/
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              whichScreen == 'Charity'
                                  ? Get.to<void>(() => AvailableVendorsView(
                                      whichScreen: 'Charity'))
                                  : Get.to<void>(() => AvailableVendorsView(
                                      whichScreen: 'Social'));
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
                        ],
                      ),
              ],
            ),
          ),
          size: Size(
              410.w,
              (410.w * 0.8622222222222222)
                  .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
          painter: CategoryContainer(),
        ),
      ],
    ),
  );
}
