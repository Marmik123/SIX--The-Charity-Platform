import 'package:get/get.dart';
import 'package:six/generated/locales.g.dart';

class AppTranslations extends Translations {
  late Map<String, Map<String, String>> map;

  @override
  Map<String, Map<String, String>> get keys => map;
}

class TranslationApi {
  static void loadTranslations() {
    var map = AppTranslation.translations;
    Get.find<AppTranslations>().map = map;
  }
}
