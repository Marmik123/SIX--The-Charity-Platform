import 'package:flutter/services.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/ui/components/app_snackbar.dart';

void copyText(String text) {
  Clipboard.setData(ClipboardData(text: text));
  logI('Text copied');
  appSnackbar(message: 'Code Copied', snackbarState: SnackbarState.success);
}
