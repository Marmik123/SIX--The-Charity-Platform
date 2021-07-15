import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/ui/components/circular_arrow_btn.dart';

Widget onBoardingNavigation({
  required int itemCount,
  required VoidCallback onTapArrow,
  required VoidCallback onTapSkip,
  required double screenIndex,
  required double onChangedPadding,
  required bool isVendor,
}) {
  return Row(
    children: [
      SizedBox(
        width: 60.w,
      ),
      Container(
        width: isVendor ? 84.w : 90.w,
        height: 150.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: ClampingScrollPhysics(),
                itemCount: itemCount,
                separatorBuilder: (context, index) => SizedBox(
                      width: isVendor ? 6.w : 15.w,
                    ),
                itemBuilder: (context, index) => Container(
                      width: 20.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.k6886A0,
                          width: 3.w,
                        ),
                        shape: BoxShape.circle,
                        color: AppColors.kffffff,
                      ),
                    )),
            AnimatedPositioned(
              left: screenIndex * onChangedPadding,
              duration: Duration(
                milliseconds: 300,
              ),
              child: AnimatedContainer(
                curve: Curves.easeInQuint,
                padding: EdgeInsets.only(
                  left: 5,
                ),
                width: 20.w,
                height: 20.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.k14A1BE,
                ),
                duration: Duration(
                  milliseconds: 300,
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        width: 337.w,
      ),
      circularArrowButton(onTapArrow),
      SizedBox(
        width: 346.w,
      ),
      GestureDetector(
        onTap: onTapSkip,
        child: Text(
          'Skip',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 42.sp,
            fontStyle: FontStyle.normal,
            color: AppColors.k585858,
            fontWeight: FontWeight.w500,
          ),
        ),
      )
    ],
  );
}
