import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/data/local/user_provider.dart';
import 'package:six/app/modules/needy_family/profile/views/profile_view.dart';
import 'package:six/app/modules/needy_family/voucher/views/voucher_view.dart';
import 'package:six/app/routes/app_pages.dart';
import 'package:six/app/ui/components/bottom_nav_bar.dart';
import 'package:six/app/ui/components/category_card.dart';
import 'package:six/app/ui/components/circular_progress_indicator.dart';
import 'package:six/app/ui/components/double_shaded_container.dart';
import 'package:six/app/utils/color_ext.dart';
import 'package:six/r.g.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  //final VoucherController ctrl = Get.put(VoucherController());
  final List<Widget> bottomNavScreen = <Widget>[
    HomeContent(),
    VoucherView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.kffffff,
        bottomNavigationBar: bottomNavBar(
          onTap: (index) {
            controller.currentIndex(index);
          },
          currentIndex: controller.currentIndex(),
        ),
        //extendBodyBehindAppBar: true,
        body: bottomNavScreen.elementAt(controller.currentIndex()),
      ),
    );
  }
}

// HomeController controller = Get.put(HomeController());

class HomeContent extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.dashDataLoading()
        ? Center(child: buildLoader())
        : RefreshIndicator(
            onRefresh: () {
              return controller.assignDash();
            },
            child: ListView(
              padding: EdgeInsets.zero,

              // crossAxisAlignment: CrossAxisAlignment.start,
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      width: 1125.w,
                      height: 1380.h,
                      color: Colors.transparent,
                    ),
                    Positioned(
                      top: 0,
                      child: Container(
                        width: 1125.w,
                        height: 1265.h,
                        color: AppColors.kE3FCFF,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 120.h,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 66.w,
                                ),
                                Image.asset(
                                  R.image.six_logo().assetName,
                                  height: 77.h,
                                  width: 170.w,
                                ),
                                SizedBox(
                                  width: 669.w,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed<void>(Routes.NOTIFICATION);
                                  },
                                  child: Container(
                                    width: 160.w,
                                    height: 160.h,
                                    decoration: BoxDecoration(
                                        color: AppColors.kffffff,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 40.sp,
                                            color: AppColors.kD1EFF2
                                                .withOpacity(0.8),
                                            offset: const Offset(0, 20),
                                          )
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(70.r))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Image.asset(
                                        R.image.bell().assetName,
                                        height: 20,
                                        width: 20,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 57.h,
                            ),
                            Obx(() => Column(
                                  children: [
                                    controller.dashDataLoading()
                                        ? buildLoader()
                                        : doubleShadedCont(UserProvider
                                                    .currentUser
                                                    ?.profileImageUrl ==
                                                null
                                            ? 'https://picsum.photos/id/1027/400'
                                            : UserProvider.currentUser
                                                    ?.profileImageUrl
                                                    .toString() ??
                                                'https://picsum.photos/id/1027/400'), //double shaded profile container
                                    SizedBox(
                                      height: 45.h,
                                    ),
                                    Text(
                                      'Hi, ${UserProvider.currentUser?.userMetadata?.principalName ?? '-'}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Gilroy',
                                        fontSize: 65.sp,
                                        fontStyle: FontStyle.normal,
                                        color: AppColors.k033660,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              'Welcome back!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 40.sp,
                                fontStyle: FontStyle.normal,
                                color: AppColors.k033660,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 70.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10.h,
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed<void>(Routes.AVAILABLE_CREDITS);
                        },
                        child: Container(
                          width: 1005.w,
                          height: 220.h,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                begin: Alignment(-1, -2.8),
                                end: Alignment(1, 10),
                                colors: [AppColors.k1FAF9E, AppColors.k0087FF]),
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 60.w,
                                ),
                                Text(
                                  'Total Credits Available',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontSize: 50.sp,
                                    fontStyle: FontStyle.normal,
                                    color: AppColors.kffffff,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  width: 134.w,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '\$',
                                      style: TextStyle(
                                        fontFamily: 'Gilroy',
                                        fontSize: 60.sp,
                                        fontStyle: FontStyle.normal,
                                        color: AppColors.kffffff,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      '${controller.beneDash?['totalCreditAmount'] ?? ' -'}',
                                      style: TextStyle(
                                        fontFamily: 'Gilroy',
                                        fontSize: 60.sp,
                                        fontStyle: FontStyle.normal,
                                        color: AppColors.kffffff,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
/*                                      Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 2.0),
                                      child: Text(
                                        '/500',
                                        style: TextStyle(
                                          fontFamily: 'Gilroy',
                                          fontSize: 40.sp,
                                          fontStyle: FontStyle.normal,
                                          color: AppColors.kffffff,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    )*/
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed<void>('/available-credits',
                                        arguments: 'needy_family');
                                  },
                                  child: const Icon(
                                    Icons.keyboard_arrow_right_sharp,
                                    color: AppColors.kffffff,
                                    size: 25,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 75.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    'Your Available Credits',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 60.sp,
                      fontStyle: FontStyle.normal,
                      color: AppColors.k033660.withOpacity(0.5),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ((controller.beneDash?['categoryAmount'].length ?? 0)
                              as int) ==
                          0
                      ? const Text('No Data Available')
                      : Container(
                          height: 580.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: (controller
                                    .beneDash?['categoryAmount'].length ??
                                0) as int,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: categoryCard(
                                index: index,
                                context: context,
                                imageUrl: controller.beneDash?['categoryAmount']
                                            [index]['icon_url'] ==
                                        null
                                    ? 'https://picsum.photos/200/300/?blur=2'
                                    : controller.beneDash?['categoryAmount']
                                                [index]['icon_url']
                                            .toString() ??
                                        'https://picsum.photos/200/300/?blur=2',
                                background: HexColor.fromHex(
                                    controller.beneDash?['categoryAmount']
                                                [index]['background'] ==
                                            null
                                        ? '#000000'
                                        : controller.beneDash?['categoryAmount']
                                                    [index]['background']
                                                .toString() ??
                                            '-'),
                                categoryName:
                                    controller.beneDash?['categoryAmount']
                                                [index]['name'] ==
                                            null
                                        ? '-'
                                        : controller.beneDash?['categoryAmount']
                                                    [index]['name']
                                                .toString() ??
                                            '-',
                                creditsRemaining: double.tryParse(controller
                                                    .beneDash?['categoryAmount']
                                                [index]['total_available'] ==
                                            null
                                        ? '0'
                                        : controller.beneDash?['categoryAmount']
                                                    [index]['total_available']
                                                .toString() ??
                                            '-') ??
                                    0.0,
                                totalCredits: double.tryParse(controller
                                                    .beneDash?['categoryAmount']
                                                [index]['total'] ==
                                            null
                                        ? '0'
                                        : controller.beneDash?['categoryAmount']
                                                    [index]['total']
                                                .toString() ??
                                            '-') ??
                                    0.0,
                                accent: HexColor.fromHex(
                                    controller.beneDash?['categoryAmount']
                                                [index]['accent'] ==
                                            null
                                        ? '#000000'
                                        : controller.beneDash?['categoryAmount']
                                                    [index]['accent']
                                                .toString() ??
                                            '-'),
                                shadow: AppColors.kEED2E0,
                                foreground: HexColor.fromHex(
                                    controller.beneDash?['categoryAmount']
                                                [index]['forground'] ==
                                            null
                                        ? '#000000'
                                        : controller.beneDash?['categoryAmount']
                                                    [index]['forground']
                                                .toString() ??
                                            '-'),
                                width: 420.w,
                                height: 580.h,
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15, bottom: 5.0),
                              ),
                            ),
                          ),
                        ),
                )
              ],
            ),
          ));
  }
}
