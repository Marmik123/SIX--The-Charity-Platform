import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:six/app/data/local/note_details_helper.dart';
import 'package:six/app/modules/social_worker/social_home/controllers/social_home_controller.dart';

class AddNoteController extends GetxController {
  TextEditingController textCtrl = TextEditingController();
  SocialHomeController socialHomeController = Get.find<SocialHomeController>();
  final dbHelper = DatabaseHelper.instance;
  @override
  void onInit() {
    super.onInit();
  }
}
