import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:six/app/data/api/api_routes.dart';
import 'package:six/app/data/models/env_data.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SignPassVerificationController extends GetxController {
  //TODO: Implement SignPassVerificationController

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isVerified = false.obs;
  RxInt? tabIndex = 0.obs;
  final count = 0.obs;
  WebViewController? webController;

  @override
  void onInit() {
    super.onInit();
    var envData = API.getEnvData();
    EnvData.fromMap(envData);
    print('This is envData$envData');
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }
}
