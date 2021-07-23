import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/local/user_provider.dart';
import 'package:six/app/data/models/user_entity.dart';
import 'package:six/app/data/remote/api_service/init_api_service.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SignPassVerificationController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isVerified = false.obs;
  RxBool successLogin = false.obs;
  String userId = '18c7089f-0d80-4374-97b6-e266ae722d5e';
  RxString role = 'charity'.obs;
  RxInt? tabIndex = 0.obs;
  final count = 0.obs;

  final Completer<WebViewController> webController =
      Completer<WebViewController>();
  late String authorizeUrl;
  Map<String, dynamic> envResponse = <String, dynamic>{};

  @override
  void onInit() {
    super.onInit();
    getEnvData();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  Future<void> getEnvData() async {
    //isLoading = false;
    var response = await APIService.get(path: '/v1/getEnv');
    if (response.statusCode == 200) {
      logI('Data########');
      envResponse.clear();
      envResponse = response.data as Map<String, dynamic>;
    } else {
      Get.snackbar<void>('Error in Env Data', 'Please Try Again.');
    }
  }

  void callAuthorizeData() {
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

  Future<void> getUserDetailToLogin() async {
    var response = await APIService.get(
        path: '/v1/get-user-login-detail-to-login/$userId/${role()}');
    if (response.statusCode == 200) {
      logI('UserDetails########');

      await UserProvider.onLogin(
          UserEntity.fromMap(response.data!['data'] as Map<String, dynamic>),
          response.data!['authToken'] as String);
      logI(response.data);
      //envResponse = response.data as Map<String, dynamic>;
    } else {
      Get.snackbar<void>('Error in Env Data', 'Please Try Again.');
    }
  }
}
