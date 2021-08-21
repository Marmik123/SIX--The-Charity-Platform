import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/local/user_provider.dart';
import 'package:six/app/data/remote/provider/social_worker.dart';
import 'package:six/app/modules/charity/charity_home/controllers/charity_home_controller.dart';
import 'package:six/app/modules/needy_family/home/controllers/home_controller.dart';
import 'package:six/app/modules/social_worker/social_home/controllers/social_home_controller.dart';
import 'package:six/app/modules/vendor/vendor_home/controllers/vendor_home_controller.dart';
import 'package:six/app/ui/components/app_snackbar.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final count = 0.obs;
  late File profilePicture;
  RxBool isLoading = false.obs;
  CharityHomeController? charityCtrl;
  SocialHomeController? socialCtrl;
  HomeController? needyCtrl;
  //var needyCtrl = Get.find<HomeController>();
  VendorHomeController? vendorCtrl;
  dynamic foundController;

  @override
  void onInit() {
    super.onInit();
    foundController = findController();
    logWTF(foundController);
  }

/*
  final vendorCtrl = Get.find<VendorHomeController>();
  final charityCtrl = Get.find<CharityHomeController>();
  final socialCtrl = Get.find<SocialHomeController>();
  final homeCtrl = Get.find<HomeController>();*/

  dynamic findController() {
    switch (UserProvider.role) {
      case 'charity':
        logI('charity');
        charityCtrl = Get.find<CharityHomeController>();
        return charityCtrl;

      case 'social_worker':
        logI('social');
        socialCtrl = Get.find<SocialHomeController>();
        return socialCtrl;

      case 'needy_family':
        logI('needy');
        needyCtrl = Get.find<HomeController>();
        return needyCtrl;

      case 'vendor':
        logI('vendor');
        vendorCtrl = Get.find<VendorHomeController>();
        return vendorCtrl;
    }
  }

  void sendMailFeedback() {
    final mailOptions = MailOptions(
      body: 'Add Your FeedBack Here',
      subject: '[SIX App] ',
      recipients: ['jeremy@sixtech.org'],
    );
    FlutterMailer.send(mailOptions);
  }

  void supportMail() {
    final mailOptions = MailOptions(
      body: '',
      subject: '[SIX App] - Support ',
      recipients: ['jeremy@sixtech.org'],
    );
    FlutterMailer.send(mailOptions);
  }

  void askImageSource() {
    Get.defaultDialog<void>(
      title: 'Choose a Photo from',
      titleStyle: TextStyle(fontSize: 25.sp),
      backgroundColor: AppColors.kffffff,
      radius: 50.r,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: () {
              pickProfilePicture();
            },
            leading: const Icon(
              Icons.camera_alt,
              color: AppColors.k0087A1,
            ),
            title: Text('Camera',
                style: TextStyle(
                    fontFamily: 'Gilroy',
                    color: AppColors.k0087A1,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal)),
          ),
          ListTile(
            onTap: () {
              pickProfilePicture();
            },
            leading: const Icon(
              Icons.image_outlined,
              color: AppColors.k0087A1,
            ),
            title: const Text('Gallery',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.k0087A1,
                  fontWeight: FontWeight.w700,
                )),
          ),
        ],
      ),
    );
  }

  //Function for choosing picture
  Future<void> pickProfilePicture() async {
    final pickedFile = await FilePicker.platform.pickFiles(
      withData: true,
      type: FileType.image,
      allowCompression: true,
    );
    // profilePicture = File(pickedFile.path);
    if (pickedFile != null) {
      var file = pickedFile.files.first;
      //profilePicture = File(pickedFile.path);
      // logI(profilePicture);
      await uploadImg(
        file.name,
        file.bytes,
      );
    } else {
      logI('No image selected.');
    }
    update();
  }

  Future<void> uploadImg(String filename, dynamic fileBytes) async {
    var success = await SocialWorkerProvider.uploadProfileImg(
      filename: filename,
      finalImage: fileBytes,
    );
    logWTF(success);
    if (success != 'false') {
      await editProfilePicture(success);
    }
  }

  Future<void> editProfilePicture(String filename) async {
    isLoading(true);
    var success = await SocialWorkerProvider.editProfilePicture(
      profileImg: filename,
    );
    logWTF(success);
    if (success) {
      isLoading(false);
      appSnackbar(
        message: 'Image Uploaded Successfully',
        snackbarState: SnackbarState.success,
      );
    } else {
      isLoading(false);
      appSnackbar(
        message: 'Something Went Wrong,Please try again',
        snackbarState: SnackbarState.danger,
      );
    }
  }

  String? getUserName() {
    if (UserProvider.role == 'charity' || UserProvider.role == 'vendor') {
      return UserProvider.currentUser?.userMetadata?.entityName == null
          ? '-'
          : UserProvider.currentUser?.userMetadata?.entityName.toString() ??
              '-';
    } else if (UserProvider.role == 'social_worker' ||
        UserProvider.role == 'needy_family') {
      if (UserProvider.currentUser != null) {
        return UserProvider.currentUser?.userMetadata?.principalName == null
            ? '-'
            : UserProvider.currentUser?.userMetadata?.principalName
                    .toString() ??
                '-';
      } else {
        return '-';
      }
    }
  }
}
