import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/ui/components/common_appbar.dart';
import 'package:six/app/ui/components/rounded_gradient_btn.dart';
import 'package:six/app/ui/components/sizedbox.dart';

import '../controllers/add_note_controller.dart';

class AddNoteView extends GetView<AddNoteController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kffffff,
      appBar: appBar(
        title: 'Add Note',
        height: 200.h,
        disableBackIcon: false,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              h(60.h),
              Container(
                width: 1005.w,
                height: 1125.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    color: AppColors.kffffff,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.k00474E.withOpacity(0.04),
                        offset: const Offset(0, 20),
                        blurRadius: 50.r,
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    scrollPhysics: const BouncingScrollPhysics(),
                    enabled: true,
                    autofocus: true,
                    onEditingComplete: () {
                      var currentFocus = FocusScope.of(context);
                      currentFocus.unfocus();
                    },
                    cursorColor: AppColors.k033660,
                    controller: controller.textCtrl,
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 45.sp,
                      color: AppColors.k033660,
                      fontWeight: FontWeight.w500,
                    ),
                    keyboardType: TextInputType.multiline,
                    onTap: () {},
                    maxLines: null,
                    decoration: InputDecoration(
                      fillColor: AppColors.kffffff,
                      contentPadding: const EdgeInsets.all(2),
                      filled: true,
                      hintText: 'Type here your note....',
                      enabled: true,
                      hintStyle: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 45.sp,
                        color: AppColors.k033660.withOpacity(0.5),
                        fontWeight: FontWeight.w500,
                      ),
                      prefixText: '',
                      prefixStyle: TextStyle(
                        color: AppColors.k13A89E,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Gilroy',
                        fontSize: 65.sp,
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
              ),
              h(491.h),
              roundedButton(
                text: 'Save',
                onTap: () {
                  var beneficiaryId = controller.socialHomeController
                      .beneficiaryList()[
                          controller.socialHomeController.beneIndex!()]
                      .familyUserForWorker!
                      .userMetadata!
                      .id
                      .toString();
                  var response = controller.dbHelper.createNote(
                    beneficiaryId: beneficiaryId,
                    note: controller.textCtrl.text.trim(),
                  );
                  logI(response.toString());
                  controller.textCtrl.clear();
                  controller.dbHelper.getNotes(beneficiaryId: beneficiaryId);
                  Get.back<void>();
                },
                width: 452.w,
                height: 150.h,
                fontSize: 50.sp,
              )
            ],
          ),
        ),
      ),
    );
  }
}
