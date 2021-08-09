import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/local/note_details_helper.dart';
import 'package:six/app/data/models/user_entity.dart';
import 'package:six/app/data/remote/provider/social_worker.dart';
import 'package:six/app/modules/social_worker/social_home/controllers/social_home_controller.dart';

class BeneficiaryDetailsController extends GetxController {
  RxInt tabIndex = 0.obs;
  RxInt beneIndex = 0.obs;
  RxBool snap = true.obs;
  RxBool isLoading = false.obs;
  late UserEntity beneficiary;
  RxBool tabBarVisibility = true.obs;
  RxBool titleVisible = true.obs;
  RxDouble top = 0.0.obs;
  RxInt skip = 0.obs;
  RxInt limit = 1000.obs;
  RxDouble opacity = 0.0.obs;
  SocialHomeController socialHome = Get.find<SocialHomeController>();
  ScrollController scrollViewController = ScrollController();
  TextEditingController addNoteCtrl = TextEditingController();
  TextEditingController editNoteCtrl = TextEditingController();
  RxList<Map<String, Object?>> notesList = <Map<String, Object?>>[].obs;
  RxList<UserEntity> connectedOrg = <UserEntity>[].obs;
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
      beneficiary = Get.arguments[0] as UserEntity;
      beneIndex(Get.arguments[1] as int);
    }
    getNotes();
    logWTF(beneficiary.toJson());
    assignConnectedOrg();
  }

  Future<void> addNote() async {
    await dbHelper.createNote(
      beneficiaryId: beneficiary.id,
      note: addNoteCtrl.text.trim(),
    );
    await updateNoteDetails();
    Get.back<void>();
  }

  Future<void> editNote(int index) async {
    await dbHelper.editNote(
      noteId: notesList[index]['id'] as int,
      note: editNoteCtrl.text.trim(),
    );
    await updateNoteDetails();
    Get.back<void>();
  }

  Future<void> deleteNote(int index) async {
    await dbHelper.deleteNote(noteId: notesList[index]['id'] as int);
    await updateNoteDetails();
  }

  Future<void> updateNoteDetails() async {
    notesList(await dbHelper.getNotes(beneficiaryId: beneficiary.id));
  }

  Future<void> assignConnectedOrg() async {
    isLoading(true);
    connectedOrg(await SocialWorkerProvider.getBeneficiaryOrganization(
      needyFamilyId: beneficiary.id,
      skip: skip().toString(),
      limit: limit().toString(),
    ));
    isLoading(false);
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
