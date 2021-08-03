import 'package:dio/dio.dart' show DioError;
import 'package:six/app/ui/components/app_snackbar.dart';

import 'logger.dart';

void letMeHandleAllErrors(Object error, StackTrace? trace) {
  // logE(trace);
  logI('ERROR FROM letMeHandleAllErrors\nERROR TYPE : ${error.runtimeType}');
  switch (error.runtimeType) {
    case DioError:
      final res = (error as DioError).response;
      logE('Got error : ${res!.statusCode} -> ${res.data['message']}');
      appSnackbar(
          message: 'Got error : ${res.statusCode} -> ${res.data['message']}');
      break;
    default:
      // Get.snackbar<void>('Oops!', 'Something went wrong');
      logE(error.toString());
      logE(trace);
      break;
  }
}
