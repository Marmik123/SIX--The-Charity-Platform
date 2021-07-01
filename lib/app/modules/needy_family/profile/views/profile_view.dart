import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/routes/app_pages.dart';
import 'package:six/app/ui/components/double_shaded_container.dart';
import 'package:six/app/ui/components/profile_options.dart';
import 'package:six/app/ui/components/rounded_gradient_btn.dart';
import 'package:six/r.g.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kffffff,
        body: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              overflow: Overflow.visible,
              children: [
                Container(
                  color: Colors.transparent,
                  width: 1.sw,
                  height: 0.91.sh,
                ),
                Positioned(
                  top: 0,
                  child: Container(
                    color: AppColors.kE3FCFF,
                    height: 1423.h,
                    width: 1125.w,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 170.h,
                        ),
                        Text(
                          'Profile',
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
                          height: 93.h,
                        ),
                        doubleShadedCont('https://picsum.photos/id/1027/400'),
                        SizedBox(
                          height: 83.h,
                        ),
                        Text(
                          'Peter Lim',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 65.sp,
                            fontStyle: FontStyle.normal,
                            color: AppColors.k033660,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          'peterlim@gmail.com',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 40.sp,
                            fontStyle: FontStyle.normal,
                            color: AppColors.k033660,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 1130.h,
                  child: Container(
                    width: 1005.w,
                    height: 1011.h,
                    decoration: BoxDecoration(
                      color: AppColors.kffffff,
                      borderRadius: BorderRadius.circular(50.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.k00474E.withOpacity(0.04),
                          blurRadius: 50.r,
                          offset: Offset(0, 20),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 75.h,
                        ),
                        profileMenuItem(R.image.asset.request.assetName,
                            'Make a Request', () {}),
                        profileMenuItem(R.image.asset.term_c.assetName,
                            'My Previous Request', () {}),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          child: profileMenuItem(
                              R.image.asset.support.assetName, 'Support', () {
                            Get.toNamed<void>(Routes.SUPPORT);
                          }),
                        ),
                        GestureDetector(
                          child: profileMenuItem(
                              R.image.asset.feedback.assetName, 'Feedback', () {
                            Get.toNamed<void>(Routes.ONBOARDING_VENDOR);
                          }),
                        ),
                        profileMenuItem(R.image.asset.term_c.assetName,
                            'Term & Condition', () {}),
                        profileMenuItem(R.image.asset.privacy.assetName,
                            'Privacy Policy', () {}),
                      ],
                    )
                    /*Container(
                    height: 1011.h,
                    width: 1005.w,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 27.0),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) => ListTile(
                                title: Row(
                                  children: [
                                    Image.asset(
                                      R.image.asset.request.assetName,
                                      height: 55.h,
                                      width: 47.w,
                                    ),
                                    SizedBox(
                                      width: 51.w,
                                    ),
                                    Text(
                                      'My Previous Requests',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Gilroy',
                                        fontSize: 45.sp,
                                        fontStyle: FontStyle.normal,
                                        color: AppColors.k033660,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                                //minLeadingWidth: 47.w,
                                //minVerticalPadding: 18.h,
                                trailing: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_forward_ios),
                                  color: AppColors.k033660,
                                  iconSize: 14,
                                ),
                              )
                          */
                    /*Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 61.w,
                                  ),
                                  Image.asset(
                                    R.image.asset.request.assetName,
                                    height: 55.h,
                                    width: 47.w,
                                  ),
                                  SizedBox(
                                    width: 51.w,
                                  ),
                                  Text(
                                    'Make a Request',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize: 45.sp,
                                      fontStyle: FontStyle.normal,
                                      color: AppColors.k033660,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 351.w,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios),
                                    color: AppColors.k033660,
                                    iconSize: 14,
                                  )
                                ],
                              )*/ /*
                          ),
                    ),
                  )*/
                    ,
                  ),
                ),
                Positioned(top: 2050.h, child: roundedButton('Logout', () {}))
              ],
            ),
          ],
        ));
  }
}
