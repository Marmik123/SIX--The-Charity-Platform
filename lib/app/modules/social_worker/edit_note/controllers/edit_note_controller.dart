import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/local/note_details_helper.dart';
import 'package:six/app/modules/social_worker/note_details/controllers/note_details_controller.dart';
import 'package:six/app/modules/social_worker/social_home/controllers/social_home_controller.dart';

class EditNoteController extends GetxController {
  RxInt noteIndex = 0.obs;
  final dbHelper = DatabaseHelper.instance;
  final NoteDetailsController notesDetail = Get.find<NoteDetailsController>();
  SocialHomeController socialHomeController = Get.find<SocialHomeController>();
  TextEditingController editingController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      noteIndex(Get.arguments as int);
    }
    logW(noteIndex);
  }

  Future<void> updateNoteDetails() async {
    var beneficiaryId = socialHomeController
        .beneficiaryList()[socialHomeController.beneIndex!()]
        .userMetadata!
        .id
        .toString();
    editingController.clear();
    notesDetail
        .notesList(await dbHelper.getNotes(beneficiaryId: beneficiaryId));
    Get.back<void>();
  }

  Future<void> editNote() async {
    await dbHelper.editNote(
      noteId: notesDetail.notesList[noteIndex()]['id'] as int,
      note: editingController.text.trim(),
    );
    await updateNoteDetails();
  }
}
