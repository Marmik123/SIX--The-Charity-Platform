import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/ui/components/common_appbar.dart';

import '../controllers/terms_conditions_controller.dart';

class TermsConditionsView extends GetView<TermsConditionsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: 'Terms & Conditions',
        height: 200.h,
        disableBackIcon: false,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(8),
        child: Text(
          'Lorem Ipsum is simply dummy text of the printing and typesetting Lorem Ipsum is simply dummy text of the printing and typesetting Lorem Ipsum is simply dummy text of the printing and typesetting Lorem Ipsum is simply dummy text of the printing and typesetting Lorem Ipsum is simply dummy text of the printing and typesetting Lorem Ipsum is simply dummy text of the printing and typesetting Lorem Ipsum is simply dummy text of the printing and typesetting Lorem Ipsum is simply dummy text of the printing and typesetting Lorem Ipsum is simply dummy text of the printing and typesetting Lorem Ipsum is simply dummy text of the printing and typesetting Lorem Ipsum is simply dummy text of the printing and typesetting Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\nIt has survived not only five centuries,\nbut also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
          softWrap: true,
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 60.sp,
            fontStyle: FontStyle.normal,
            color: AppColors.k033660.withOpacity(0.5),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
