import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/ui/components/common_appbar.dart';
import 'package:six/app/ui/components/rounded_gradient_btn.dart';
import 'package:six/app/ui/components/sizedbox.dart';
import 'package:six/r.g.dart';

import '../controllers/edit_note_controller.dart';

class EditNoteView extends GetView<EditNoteController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kffffff,
      appBar: appBar(
        title: 'Edit Note',
        height: 200.h,
        disableBackIcon: false,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              h(100.h),
              Container(
                width: 1005.w,
                height: 300.h,
                decoration: BoxDecoration(
                  color: AppColors.kffffff,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 20),
                      blurRadius: 50.r,
                      color: AppColors.k00474E.withOpacity(0.04),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 10,
                    top: 10,
                    bottom: 5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            R.image.asset.calendar.assetName,
                            height: 33.h,
                            width: 30.w,
                          ),
                          w(15.w),
                          Text(
                            DateTime.fromMillisecondsSinceEpoch(int.tryParse(
                                    controller.notesDetail
                                        .notesList()[controller.noteIndex()]
                                            ['createdOn']
                                        .toString())!)
                                .toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontSize: 38.sp,
                              fontStyle: FontStyle.normal,
                              color: AppColors.k6886A0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          w(460.w),
                        ],
                      ),
                      h(4.h),
                      SelectableText(
                        controller.notesDetail
                            .notesList()[controller.noteIndex()]['note']
                            .toString(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 42.sp,
                          fontStyle: FontStyle.normal,
                          color: AppColors.k033660,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              h(25.h),
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
                    textInputAction: TextInputAction.done,
                    controller: controller.editingController,
                    onEditingComplete: () {
                      var currentFocus = FocusScope.of(context);
                      currentFocus.unfocus();
                      controller.editNote();
                    },
                    cursorColor: AppColors.k033660,
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
              h(405.h),
              roundedButton(
                  text: 'Save',
                  onTap: () {
                    controller.editNote();
                  },
                  width: 452.w,
                  height: 150.h,
                  fontSize: 50.sp)
            ],
          ),
        ),
      ),
    );
  }
}
