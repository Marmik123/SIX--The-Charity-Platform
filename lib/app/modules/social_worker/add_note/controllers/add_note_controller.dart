import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:six/app/data/local/note_details_helper.dart';
import 'package:six/app/modules/social_worker/note_details/controllers/note_details_controller.dart';
import 'package:six/app/modules/social_worker/social_home/controllers/social_home_controller.dart';

class AddNoteController extends GetxController {
  TextEditingController textCtrl = TextEditingController();
  static SocialHomeController socialHomeController =
      Get.find<SocialHomeController>();
  NoteDetailsController noteDetailsController =
      Get.find<NoteDetailsController>();
  final dbHelper = DatabaseHelper.instance;
  String beneficiaryId = socialHomeController
      .beneficiaryList()[socialHomeController.beneIndex!()]
      .userMetadata!
      .id
      .toString();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> updateNoteDetails() async {
    textCtrl.clear();
    noteDetailsController
        .notesList(await dbHelper.getNotes(beneficiaryId: beneficiaryId));
    Get.back<void>();
  }

  Future<void> addNote() async {
    await dbHelper.createNote(
      beneficiaryId: beneficiaryId,
      note: textCtrl.text.trim(),
    );
    await updateNoteDetails();
  }
}
