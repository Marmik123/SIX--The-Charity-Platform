import 'package:get/get.dart';

class NoteDetailsController extends GetxController {
  RxList<Map<String, Object?>> notesList = <Map<String, Object?>>[].obs;
  @override
  void onInit() {
    // controller.dbHelper.getNotes(beneficiaryId: beneficiaryId);

    super.onInit();
  }
}
