import 'package:dio/dio.dart' show DioError;
import 'package:get/get.dart';

import 'logger.dart';

void letMeHandleAllErrors(Object error, StackTrace? trace) {
  // logE(trace);
  // logI('ERROR FROM letMeHandleAllErrors\nERROR TYPE : ${error.runtimeType}');
  switch (error.runtimeType) {
    case DioError:
      final res = (error as DioError).response;
      logE('Got error : ${res!.statusCode} -> ${res.statusMessage}');
      Get.snackbar<void>(
          'Oops!', 'Got error : ${res.statusCode} -> ${res.statusMessage}');
      break;
    default:
      Get.snackbar<void>('Oops!', 'Something went wrong');
      logE(error.toString());
      logE(trace);
      break;
  }
}
