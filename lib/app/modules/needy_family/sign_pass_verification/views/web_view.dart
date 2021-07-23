import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/modules/needy_family/sign_pass_verification/controllers/sign_pass_verification_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends GetView<SignPassVerificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kE3FCFF,
        title: Text(
          'SingPass Login',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 55.sp,
            fontStyle: FontStyle.normal,
            color: AppColors.k033660,
            fontWeight: FontWeight.w500,
          ),
        ),
        iconTheme: const IconThemeData(
          color: AppColors.k033660,
        ),
        centerTitle: true,
      ),
      body: GetBuilder<SignPassVerificationController>(
        builder: (_) => WebView(
          initialUrl: controller.authorizeUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (c) {
            //logI(url);
            logI('WEb VIew Created');
            c.canGoForward().then<void>((value) {
              if (value) {
                c.goForward();
              } else {
                controller.webController.complete(c);
              }
            });
          },
          onProgress: (progress) {
            logI('WebView is loading (progress : $progress%)');
            controller.update();
          },
          onPageStarted: (url) {
            logI('Page started loading: $url');
          },
          onPageFinished: (url) {
            logI('Page finished loading: $url');
            if (url.contains(
                'https://test.api.myinfo.gov.sg/serviceauth/myinfo-biz')) {
              logI('UserExist');
              controller.successLogin(true);
              Get.back<void>(result: controller.successLogin());
            } else {
              controller.successLogin(false);
              //Get.back<void>(result: controller.successLogin());
            }
          },
        ),
      ),
    );
  }
}
