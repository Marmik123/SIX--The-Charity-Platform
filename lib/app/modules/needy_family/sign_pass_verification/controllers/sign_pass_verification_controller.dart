import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:six/app/data/remote/provider/login_webview_process.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SignPassVerificationController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isVerified = false.obs;
  RxBool successLogin = false.obs;
  RxInt? tabIndex = 0.obs;

  final Completer<WebViewController> webController =
      Completer<WebViewController>();

  @override
  void onInit() {
    super.onInit();
    LoginProvider.getEnvData();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }
}
