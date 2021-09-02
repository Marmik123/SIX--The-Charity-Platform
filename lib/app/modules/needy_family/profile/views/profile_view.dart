import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/data/local/user_provider.dart';
import 'package:six/app/modules/static_pages/controllers/static_pages_controller.dart';
import 'package:six/app/modules/static_pages/privacy_policy_view.dart';
import 'package:six/app/modules/static_pages/terms_conditions_view.dart';
import 'package:six/app/routes/app_pages.dart';
import 'package:six/app/ui/components/circular_progress_indicator.dart';
import 'package:six/app/ui/components/double_shaded_container.dart';
import 'package:six/app/ui/components/profile_options.dart';
import 'package:six/app/ui/components/rounded_gradient_btn.dart';
import 'package:six/app/ui/components/sizedbox.dart';
import 'package:six/r.g.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  final ProfileController controller = Get.put(ProfileController());
  final StaticPagesController staticPage = Get.put(StaticPagesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kffffff,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
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
                      Obx(() => controller.isLoading()
                          ? buildLoader()
                          : Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (UserProvider.role != 'charity' &&
                                        UserProvider.role != 'vendor') {
                                      controller.pickProfilePicture();
                                    }
                                  },
                                  onLongPress: () {},
                                  child: doubleShadedCont(
                                    UserProvider.currentUser?.profileImageUrl ==
                                            null
                                        ? 'https://picsum.photos/200/300'
                                        : UserProvider
                                            .currentUser!.profileImageUrl
                                            .toString(),
                                  ),
                                ),
                                UserProvider.role == 'charity' ||
                                        UserProvider.role == 'vendor'
                                    ? const SizedBox.shrink()
                                    : Positioned(
                                        right: 385.w,
                                        top: 355.h,
                                        child: GestureDetector(
                                          onTap: () {
                                            controller.pickProfilePicture();
                                          },
                                          child: Image.asset(
                                            R.image.asset.image_picker
                                                .assetName,
                                            height: 105.h,
                                            width: 104.w,
                                          ),
                                        ),
                                      ),
                              ],
                            )),
                      h(83.h),
                      Text(
                        controller.getUserName() ?? '-',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 65.sp,
                          fontStyle: FontStyle.normal,
                          color: AppColors.k033660,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      h(20.h),
                      UserProvider.role == 'needy_family' ||
                              UserProvider.role == 'social_worker'
                          ? Text(
                              UserProvider.currentUser?.userMetadata?.email ==
                                      null
                                  ? '-'
                                  : UserProvider
                                          .currentUser?.userMetadata?.email
                                          .toString() ??
                                      '-',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 40.sp,
                                fontStyle: FontStyle.normal,
                                color: AppColors.k033660,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 1108.h,
                child: Container(
                  width: 1005.w,
                  height: UserProvider.role == 'social_worker' ? 869.h : 719.h,
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
                  child: Column(
                    children: [
                      SizedBox(
                        height: 75.h,
                      ),
                      UserProvider.role == 'social_worker'
                          ? profileMenuItem(
                              R.image.asset.history.assetName,
                              'History',
                              () {
                                Get.toNamed<void>(Routes.HISTORY_SW);
                              },
                            )
                          : const SizedBox.shrink(),
                      /*profileMenuItem(R.image.asset.term_c.assetName,
                            'My Previous Request', () {}),
                        */
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        child: profileMenuItem(
                            R.image.asset.support.assetName, 'Support', () {
                          UserProvider.role == 'needy_family'
                              ? Get.toNamed<void>(Routes.SUPPORT)
                              : controller.supportMail();
                          //.toNamed<void>(Routes.SUPPORT);
                        }),
                      ),
                      profileMenuItem(
                          R.image.asset.feedback.assetName, 'Feedback', () {
                        controller.sendMailFeedback();
                      }),
                      profileMenuItem(
                          R.image.asset.term_c.assetName, 'Terms & Conditions',
                          () {
                        staticPage.getStaticPageData('terms');
                        Get.to<void>(() => TermsConditionsView());
                      }),
                      profileMenuItem(
                          R.image.asset.privacy.assetName, 'Privacy Policy',
                          () {
                        staticPage.getStaticPageData('privacy');
                        Get.to<void>(() => PrivacyPolicyView());
                      }),
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
                              )*/

                  ,
                ),
              ),
              Positioned(
                top: UserProvider.role == 'social_worker' ? 1890.h : 1740.h,
                child: roundedButton(
                    text: 'Logout',
                    onTap: () {
                      controller.needyCtrl?.currentIndex(0);
                      // logI(controller.foundController.currentIndex!(0));

                      UserProvider.onLogout();
                      Get.offAllNamed<void>(Routes.SIGN_PASS_VERIFICATION);
                    },
                    width: 452.w,
                    height: 150.h,
                    fontSize: 50.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
