import 'package:flutter/material.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

Future<int> monthPickerDialog({
  required BuildContext? context,
  required DateTime? selectedDate,
}) {
  return showMonthPicker(
    context: context!,
    firstDate: DateTime(DateTime.now().year - 1, 1),
    lastDate: DateTime(DateTime.now().year + 1, 12),
    initialDate: DateTime.now(),
    locale: Locale("en"),
  ).then((date) {
    if (date != null) {
      selectedDate = date;
    }
    return selectedDate!.month;
  });
}
