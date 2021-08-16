import 'package:flutter/material.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

Future<DateTime> monthPickerDialog({
  required BuildContext context,
  required DateTime selectedDate,
}) async {
  return await showMonthPicker(
        context: context,
        firstDate: DateTime(2021, 6),
        lastDate: DateTime(DateTime.now().year, DateTime.now().month),
        initialDate: selectedDate,
        locale: const Locale('en'),
      ) ??
      selectedDate;
}
