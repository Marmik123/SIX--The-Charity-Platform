import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/modules/static_pages/controllers/static_pages_controller.dart';
import 'package:six/app/ui/components/circular_progress_indicator.dart';
import 'package:six/app/ui/components/common_appbar.dart';

class TermsConditionsView extends GetView<StaticPagesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: 'Terms And Conditions',
        height: 200.h,
        disableBackIcon: false,
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(8),
          child: Obx(
            () => controller.isLoading()
                ? Center(child: buildLoader())
                : Text(
                    '${controller.staticPageData?['description'] ?? '-'}',
                    softWrap: true,
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 60.sp,
                      fontStyle: FontStyle.normal,
                      color: AppColors.k033660.withOpacity(0.5),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
          )),
    );
  }
}
