import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/modules/charity/available_vendors/controllers/available_vendors_controller.dart';
import 'package:six/app/modules/charity/purchase/controllers/purchase_controller.dart';

AvailableVendorsController availVendorCtrl =
    Get.put(AvailableVendorsController());
PurchaseController purchaseController = Get.put(PurchaseController());

Widget textField({
  required BuildContext context,
  required double height,
  required double width,
  required String initialValue,
  required String prefixText,
  required String hintText,
  required String prefixImageName,
  required VoidCallback onTap,
  required EdgeInsetsGeometry contentPadding,
  required TextStyle textStyle,
  required TextStyle hintStyle,
  required TextInputType keyBoardType,
  TextEditingController? controller,
  GlobalKey<FormState>? formKey,
  String? whichScreen,
}) {
  return Container(
    height: height, //170.h,
    width: width, //1005.w,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.r),
        color: AppColors.kffffff,
        border: Border.all(
          color: AppColors.kE2E2E2,
          width: 1.w,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.k00474E.withOpacity(0.04),
            offset: const Offset(0, 20),
            blurRadius: 50.r,
          ),
        ]),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 60.w,
        ),
        prefixImageName != ''
            ? Image.asset(
                prefixImageName,
                width: 50.w,
                height: 50.h,
              )
            : const SizedBox.shrink(),
        prefixImageName != ''
            ? SizedBox(
                width: 41.w,
              )
            : const SizedBox.shrink(),
        Container(
          width: 825.w,
          height: 125.h,
          alignment: Alignment.centerLeft,
          child: Form(
            key: formKey,
            child: TextFormField(
              controller: controller,
              enabled: true,
              autofocus: whichScreen == 'PurchaseSheet' ? true : false,
              textInputAction: whichScreen == 'VendorDetails'
                  ? TextInputAction.search
                  : TextInputAction.none,
              validator: (value) {
                if (GetUtils.isNull(value)) {
                  return 'Please enter a value';
                }
              },
              onFieldSubmitted: (value) {
                if (value.isNotEmpty) {
                  availVendorCtrl.isSearched(true);
                  availVendorCtrl.isLoading(true);
                  availVendorCtrl.assignSearchedVendor(
                      purchaseController
                          .voucherCategory[availVendorCtrl.categoryIndex()].id
                          .toString(),
                      value);
                  if (controller!.text.trim().isEmpty) {
                    availVendorCtrl.isSearched(false);
                  }
                }
              },
              onEditingComplete: () {
                var currentFocus = FocusScope.of(context);
                currentFocus.unfocus();
              },
              cursorColor: AppColors.k033660,
              style: textStyle,
              keyboardType: keyBoardType,
              decoration: InputDecoration(
                fillColor: AppColors.kffffff,
                contentPadding: contentPadding,
                filled: true,
                hintText: hintText,
                enabled: true,
                hintStyle: hintStyle,
                prefixText: prefixText,
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
      ],
    ),
  );
}
