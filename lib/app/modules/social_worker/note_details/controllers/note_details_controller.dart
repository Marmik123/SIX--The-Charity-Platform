import 'package:get/get.dart';
import 'package:six/app/data/local/note_details_helper.dart';
import 'package:six/app/modules/social_worker/social_home/controllers/social_home_controller.dart';

class NoteDetailsController extends GetxController {
  SocialHomeController socialHomeCtrl = Get.find<SocialHomeController>();
  RxList<Map<String, Object?>> notesList = <Map<String, Object?>>[].obs;
  final dbHelper = DatabaseHelper.instance;

  @override
  void onInit() {
    // controller.dbHelper.getNotes(beneficiaryId: beneficiaryId);

    super.onInit();
  }

  Future<void> deleteNote(int index) async {
    await dbHelper.deleteNote(noteId: notesList[index]['id'] as int);
    await updateNoteDetails();
  }

  Future<void> updateNoteDetails() async {}
}
