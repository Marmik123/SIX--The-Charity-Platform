import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:six/app/data/local/storage_keys.dart';

class LocaleProvider {
  static Locale _currentLocale = const Locale('en_US');

  static Locale get currentLocale => _currentLocale;

  static void loadCurrentLocale() {
    _currentLocale = Locale(
        GetStorage().read<String>(StorageKeys.currentLocaleKey) ?? 'en_US');
  }

  static Future<void> changeLocale(Locale updatedLocale) async {
    _currentLocale = updatedLocale;
    await GetStorage()
        .write(StorageKeys.currentLocaleKey, updatedLocale.languageCode);
    Get.updateLocale(LocaleProvider.currentLocale);
  }
}
