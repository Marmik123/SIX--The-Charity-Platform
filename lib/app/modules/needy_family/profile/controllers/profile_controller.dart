import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:six/app/data/config/app_colors.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final count = 0.obs;
  late File profilePicture;
  final picker = ImagePicker();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

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
              pickProfilePicture(ImageSource.camera);
            },
            leading: Icon(
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
              pickProfilePicture(ImageSource.gallery);
            },
            leading: Icon(
              Icons.image_outlined,
              color: AppColors.k0087A1,
            ),
            title: Text('Gallery',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.k0087A1,
                  fontWeight: FontWeight.w700,
                )),
          ),
        ],
      ),
    );
    print("called image source");
  }

  //Function for choosing picture
  Future<void> pickProfilePicture(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source, imageQuality: 50);
    // profilePicture = File(pickedFile.path);
    if (pickedFile != null) {
      profilePicture = File(pickedFile.path);
      print(profilePicture);
    } else {
      print('No image selected.');
    }
    update();
  }
}