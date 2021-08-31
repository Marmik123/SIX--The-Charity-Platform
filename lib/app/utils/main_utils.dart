import 'package:get/get.dart';

void hideKeyboard() {
  Get.focusScope?.unfocus();
}

bool isVoucherExpired(dynamic dateTime) {
  if (dateTime == null) {
    return false;
  }

  if (dateTime is DateTime) {
    return (dateTime.difference(DateTime.now()).inDays) < 0;
  }

  return (DateTime.tryParse(dateTime as String)
              ?.difference(DateTime.now())
              .inDays ??
          1) <
      0;
}
