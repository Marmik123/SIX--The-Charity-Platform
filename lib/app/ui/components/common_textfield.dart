import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/local/user_provider.dart';
import 'package:six/app/modules/charity/available_vendors/controllers/available_vendors_controller.dart';
import 'package:six/app/modules/charity/purchase/controllers/purchase_controller.dart';
import 'package:six/app/modules/social_worker/distribute_voucher/controllers/distribute_voucher_controller.dart';

AvailableVendorsController availVendorCtrl =
    Get.put(AvailableVendorsController());
PurchaseController purchaseController = Get.put(PurchaseController());
DistributeVoucherController distriCtrl = Get.put(DistributeVoucherController());
Widget textField({
  required BuildContext context,
  required double height,
  required double width,
  String? initialValue,
  bool? enableInitialValue = false,
  bool? readOnly = false,
  required String prefixText,
  required String hintText,
  required String prefixImageName,
  required VoidCallback onTap,
  VoidCallback? onSubmit,
  required EdgeInsetsGeometry contentPadding,
  required TextStyle textStyle,
  required TextStyle hintStyle,
  required TextInputType keyBoardType,
  TextEditingController? controller,
  GlobalKey<FormState>? formKey,
  bool autofocus = false,
  TextInputAction textAction = TextInputAction.none,
  Widget? suffixIcon,
  ValueChanged<String>? onChanged,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(50.r),
    child: Container(
      height: height, //170.h,
      width: width, //1005.w,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(50.r),
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
        ],
      ),

      child: Container(
        width: 825.w,
        height: 125.h,
        alignment: Alignment.centerLeft,
        child: Form(
          key: formKey,
          child: TextFormField(
            onChanged: onChanged,
            textAlignVertical: TextAlignVertical.center,
            controller: enableInitialValue! ? null : controller,
            enabled: true,
            readOnly: readOnly!,
            initialValue: enableInitialValue ? initialValue : null,
            autofocus: autofocus,
            textInputAction: textAction,
            validator: (value) {
              if (GetUtils.isNull(value)) {
                return 'Please enter a value';
              }
            },
            onFieldSubmitted: (value) {
              if (value.isNotEmpty &&
                  textAction == TextInputAction.search &&
                  UserProvider.role == 'charity') {
                availVendorCtrl.isSearched(true);
                availVendorCtrl.isLoading(true);
                availVendorCtrl.assignSearchedVendor(
                    purchaseController
                        .voucherCategory[purchaseController.selectCategory!()]
                        .id
                        .toString(),
                    value.trim());
                if (controller!.text.trim().isEmpty) {
                  availVendorCtrl.isSearched(false);
                }
              } else if (UserProvider.role == 'social_worker' &&
                  value.isNotEmpty &&
                  textAction == TextInputAction.search) {
                distriCtrl.isSearched(true);
                logI(value.trim());
                distriCtrl.assignSearchedVoucher(
                    distriCtrl.categoryList[distriCtrl.selectedCategory()].id
                        .toString(),
                    value.trim());
                if (controller!.text.trim().isEmpty) {
                  distriCtrl.isSearched(false);
                }
              } else if (UserProvider.role == 'social_worker' &&
                  value.isNotEmpty &&
                  textAction == TextInputAction.done) {
                availVendorCtrl.isSearched(true);
                availVendorCtrl.isLoading(true);
                availVendorCtrl.assignSearchedVendor(
                    purchaseController
                        .voucherCategory[purchaseController.selectCategory!()]
                        .id
                        .toString(),
                    value.trim());
                if (controller!.text.trim().isEmpty) {
                  availVendorCtrl.isSearched(false);
                }
              }
            },
            onEditingComplete: () {
              var currentFocus = FocusScope.of(context);
              currentFocus.unfocus();
            },
            textAlign: TextAlign.center,
            cursorColor: AppColors.k033660,
            style: textStyle,
            keyboardType: keyBoardType,
            decoration: InputDecoration(
              fillColor: AppColors.kffffff,
              contentPadding: contentPadding,
              suffixIcon: suffixIcon,
              filled: true,
              hintText: hintText,
              enabled: true,
              prefixIcon: prefixImageName != ''
                  ? FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Image.asset(
                        prefixImageName,
                        width: 50.w,
                        height: 50.h,
                      ),
                    )
                  : const SizedBox.shrink(),
              hintStyle: hintStyle,
              //prefixText: prefixText,
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
    ),
  );
}
