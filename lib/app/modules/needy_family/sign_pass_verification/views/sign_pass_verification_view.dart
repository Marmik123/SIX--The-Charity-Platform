import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/routes/app_pages.dart';
import 'package:six/app/ui/components/common_textfield.dart';
import 'package:six/app/ui/components/rounded_gradient_btn.dart';

import '../controllers/sign_pass_verification_controller.dart';

class SignPassVerificationView extends GetView<SignPassVerificationController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          resizeToAvoidBottomInset: false,
          extendBody: true,
          extendBodyBehindAppBar: true,
          backgroundColor: AppColors.kffffff,
          body: Column(
            children: [
              Container(
                width: 1125.w,
                height: 784.h,
                color: AppColors.kF2FEFF,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 242.h,
                    ),
                    Center(
                      child: Image.asset(
                        'assets/images/six_logo.png',
                        height: 240.h,
                        width: 530.w,
                      ),
                    ),
                    SizedBox(
                      height: 120.h,
                    ),
                    DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          TabBar(
                            tabs: [
                              Tab(
                                child: Text(
                                  'SingPass',
                                  style: TextStyle(
                                    color: controller.tabIndex!.value == 0
                                        ? AppColors.k13A89E
                                        : AppColors.k033660,
                                    fontSize: 60.sp,
                                    fontWeight: controller.tabIndex!.value == 0
                                        ? FontWeight.w700
                                        : FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'CorPass',
                                  style: TextStyle(
                                    color: controller.tabIndex!.value == 1
                                        ? AppColors.k13A89E
                                        : AppColors.k033660,
                                    fontSize: 60.sp,
                                    fontWeight: controller.tabIndex!.value == 1
                                        ? FontWeight.bold
                                        : FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              )
                            ],
                            indicatorColor: AppColors.k13A89E,
                            indicator: UnderlineTabIndicator(
                                insets:
                                    EdgeInsets.only(left: 95.w, right: 95.w),
                                borderSide: const BorderSide(
                                  color: AppColors.k13A89E,
                                  width: 1,
                                )),
                            onTap: (index) {
                              controller.tabIndex!.value = index;
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 171.h,
              ),
              controller.isVerified.value
                  ? Column(
                      children: [
                        Text(
                          'Hi, Peter Lim',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 55.sp,
                            fontStyle: FontStyle.normal,
                            color: AppColors.k033660,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 70.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Material(
                            elevation: 10,
                            shadowColor: AppColors.k00474E.withOpacity(0.04),
                            borderRadius: BorderRadius.circular(50.r),
                            child: Form(
                              key: controller.formKey,
                              child: textField(
                                initialValue: '',
                                prefixText: '',
                                hintText: 'Enter Password',
                                prefixImageName: '',
                                onTap: () {},
                                context: context,
                                height: 170.h,
                                width: 1005.w,
                                keyBoardType: TextInputType.text,
                                contentPadding:
                                    const EdgeInsets.only(bottom: 5),
                                hintStyle: TextStyle(
                                  color: AppColors.k6886A0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'Gilroy',
                                  fontSize: 45.sp,
                                ),
                                textStyle: TextStyle(
                                  fontSize: 45.sp,
                                  color: AppColors.k6886A0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                ),
                              )
/*                              TextFormField(
                                style: TextStyle(
                                  fontSize: 45.sp,
                                  color: AppColors.k6886A0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                ),
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50.r),
                                      borderSide: BorderSide(
                                        color: AppColors.kE2E2E2,
                                        width: 1,
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50.r),
                                      borderSide: BorderSide(
                                        color: AppColors.kE2E2E2,
                                        width: 1,
                                      )),
                                  filled: true,
                                  fillColor: AppColors.kffffff,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50.r),
                                      borderSide: BorderSide(
                                        color: AppColors.kE2E2E2,
                                        width: 1,
                                      )),
                                  hintText: 'Enter password',
                                  hintStyle: TextStyle(
                                    fontSize: 45.sp,
                                    color: AppColors.k6886A0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )*/
                              ,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100.h,
                        ),
                        roundedButton(
                          text: 'Login',
                          onTap: () {
                            Get.offAndToNamed<void>('/home');
                          },
                          width: 452.w,
                          height: 150.h,
                          fontSize: 50.sp,
                        ),
                        roundedButton(
                          text: 'Charity',
                          onTap: () {
                            controller.getUserDetailToLogin();
                            Get.offAndToNamed<void>(Routes.CHARITY_ONBOARDING);
                          },
                          width: 452.w,
                          height: 150.h,
                          fontSize: 50.sp,
                        ),
                        roundedButton(
                          text: 'Vendor',
                          onTap: () {
                            Get.offAndToNamed<void>(Routes.ONBOARDING_VENDOR);
                          },
                          width: 452.w,
                          height: 150.h,
                          fontSize: 50.sp,
                        ),
                        roundedButton(
                          text: 'Social',
                          onTap: () {
                            Get.offAndToNamed<void>(Routes.SOCIAL_ONBOARDING);
                          },
                          width: 452.w,
                          height: 150.h,
                          fontSize: 50.sp,
                        ),
                        roundedButton(
                          text: 'Web View Login',
                          onTap: () {
                            Get.toNamed<void>(Routes.WEB_VIEW)?.then<void>(
                              (value) {
                                controller.successLogin()
                                    ? Get.snackbar<void>(
                                        'Login Successful',
                                        'Redirecting',
                                      )
                                    : Get.snackbar<void>(
                                        'Login Error', 'Try Again');
                                Future<void>.delayed(const Duration(seconds: 3),
                                    () {
                                  Get.offAllNamed<void>(Routes.CHARITY_HOME);
                                });
                              },
                            );
                          },
                          width: 300.w,
                          height: 200.h,
                          fontSize: 35.sp,
                        )
                      ],
                    )
                  : Column(
                      children: [
                        Text(
                          'Scan with Singpass App',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 55.sp,
                            fontStyle: FontStyle.normal,
                            color: AppColors.k033660,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 34.h,
                        ),
                        Text(
                          'to log in',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 45.sp,
                            fontStyle: FontStyle.normal,
                            color: AppColors.k033660.withOpacity(0.6),
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
              SizedBox(
                height: 171.h,
              ),
              controller.isVerified.value
                  ? const SizedBox.shrink()
                  : TextButton(
                      onPressed: () {
                        controller.callAuthorizeData();
                        controller.getUserDetailToLogin();
                        controller.isVerified.value = true;
                      },
                      child: const Text('Next'),
                    ),
            ],
          ),
        ));
  }
}
