import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/ui/components/common_textfield.dart';
import 'package:six/app/ui/components/rounded_gradient_btn.dart';
import 'package:six/r.g.dart';

import '../controllers/available_vendors_controller.dart';

class AvailableVendorsView extends GetView<AvailableVendorsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kffffff,
        /* appBar: appBar(
          title: 'Available Vendors',
          height: 200.h,
        ),*/
        body: Column(
          children: [
            Stack(
              overflow: Overflow.visible,
              children: [
                Container(
                    width: 1125.w,
                    height: 375.h,
                    color: AppColors.kF2FEFF,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 60.w,
                        ),
                        Icon(
                          Icons.arrow_back,
                          color: AppColors.k033660,
                        ),
                        SizedBox(
                          width: 247.w,
                        ),
                        Text(
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
                      ],
                    )),
                Positioned(
                  left: 60.w,
                  top: 290.h,
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.r),
                      child: textField(
                        '',
                        '',
                        'Search',
                        Icon(Icons.search_sharp),
                        () {},
                        context: context,
                        height: 160.h,
                        width: 1005.w,
                        keyBoardType: TextInputType.text,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 100.h,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Column(
                        children: [
                          Container(
                            width: 1005.w,
                            height: 240.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.r),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.k00474E.withOpacity(0.04),
                                  blurRadius: 50.r,
                                  offset: Offset(0, 20),
                                ),
                              ],
                              color: AppColors.kffffff,
                            ),
                            child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 30.w,
                                  ),
                                  Container(
                                    child: Center(
                                      child: Image.asset(
                                        R.image.asset.six_logo.assetName,
                                        height: 180.r,
                                        width: 180.r,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 54.h,
                                      ),
                                      Text(
                                        'NTUC Fairprice',
                                        maxLines: 1,
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
                                        height: 20.h,
                                      ),
                                      Container(
                                        height: 64.h,
                                        width: 226.w,
                                        decoration: BoxDecoration(
                                          color: AppColors.kFFEFF7,
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                          border: Border.all(
                                              color: AppColors.kE2E2E2,
                                              width: 1.w),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Super Market',
                                            style: TextStyle(
                                              fontFamily: 'Gilroy',
                                              fontSize: 30.sp,
                                              fontStyle: FontStyle.normal,
                                              color: AppColors.kFF007A,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 57.w,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12.0),
                                    child: roundedButton(
                                        'View Details', () {}, 380.w),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}
