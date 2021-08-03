import 'dart:async';

import 'package:get/get.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/local/user_provider.dart';
import 'package:six/app/data/models/user_entity.dart';
import 'package:six/app/data/remote/api_service/init_api_service.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginProvider {
  final Completer<WebViewController> webController =
      Completer<WebViewController>();

  static late String authorizeUrl;
  static Map<String, dynamic> envResponse = <String, dynamic>{};
  static Future<void> getEnvData() async {
    //isLoading = false;
    var response = await APIService.get(path: '/v1/getEnv');
    if (response?.statusCode == 200) {
      logI('Data########');
      envResponse.clear();
      envResponse = response?.data as Map<String, dynamic>;
    } else {
      Get.snackbar<void>('Error in Env Data', 'Please Try Again.');
    }
  }

  static void callAuthorizeData() {
    authorizeUrl = envResponse['authApiUrl'].toString() +
        '?client_id=' +
        envResponse['clientId'].toString() +
        '&attributes=' +
        envResponse['attributes'].toString() +
        '&purpose=demonstratingMyInfoAPIs' +
        '&state=' +
        Uri.encodeComponent('123') +
        '&redirect_uri=' +
        envResponse['redirectUrl'].toString();

    logI('This is Generated URL');
    logI(authorizeUrl);
  }

  static Future<int?> getUserDetailToLogin(
      {required String userId, required String role}) async {
    var response = await APIService.get(
        path: '/v1/get-user-login-detail-to-login/$userId/$role');
    if (response?.statusCode == 200) {
      logI('UserDetails########');

      await UserProvider.onLogin(
          UserEntity.fromMap(response?.data!['data'] as Map<String, dynamic>),
          response?.data!['authToken'] as String);
      logI(response?.data);
      //envResponse = response?.data as Map<String, dynamic>;
    } else {
      Get.snackbar<void>('Error in Env Data', 'Please Try Again.');
    }
    return response?.statusCode;
  }
}
