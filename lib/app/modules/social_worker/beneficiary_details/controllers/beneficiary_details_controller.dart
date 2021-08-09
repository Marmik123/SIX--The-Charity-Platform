import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/local/note_details_helper.dart';
import 'package:six/app/data/models/user_entity.dart';
import 'package:six/app/modules/social_worker/social_home/controllers/social_home_controller.dart';

class BeneficiaryDetailsController extends GetxController {
  RxInt tabIndex = 0.obs;
  RxBool snap = true.obs;
  late UserEntity beneficiary;
  RxBool tabBarVisibility = true.obs;
  RxBool titleVisible = true.obs;
  RxDouble top = 0.0.obs;
  RxDouble opacity = 0.0.obs;
  SocialHomeController socialHome = Get.find<SocialHomeController>();
  ScrollController scrollViewController = ScrollController();

  RxList<Map<String, Object?>> notesList = <Map<String, Object?>>[].obs;
  final dbHelper = DatabaseHelper.instance;

  List<String> text = [
    'Note',
    'Connected',
    'Assigned',
  ];
  List<String> textNewLine = [
    'Details',
    'Organization',
    'Vouchers',
  ];
  @override
  void onInit() {
    super.onInit();
    titleVisible(false);
    scrollViewController.addListener(dataScrollController);
    if (Get.arguments != null) {
      beneficiary = Get.arguments as UserEntity;
    }
    getNotes();
    logWTF(beneficiary.toJson());
  }

  Future<void> deleteNote(int index) async {
    await dbHelper.deleteNote(noteId: notesList[index]['id'] as int);
    await updateNoteDetails();
  }

  Future<void> updateNoteDetails() async {
    notesList(await dbHelper.getNotes(beneficiaryId: beneficiary.id));
  }

  void dataScrollController() {
    if (scrollViewController.offset > 150) {
      if (titleVisible.isFalse) {
        titleVisible(true);
      }
    } else {
      if (titleVisible.isTrue) {
        titleVisible(false);
      }
    }
  }

  @override
  void onClose() {
    scrollViewController.removeListener(dataScrollController);
  }

  Future<void> getNotes() async {
    notesList(await dbHelper.getNotes(beneficiaryId: beneficiary.id));
  }
}
