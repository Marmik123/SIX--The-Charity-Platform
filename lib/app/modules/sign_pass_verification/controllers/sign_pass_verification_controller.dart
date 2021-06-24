import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignPassVerificationController extends GetxController {
  //TODO: Implement SignPassVerificationController

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isVerified = false.obs;
  RxInt? tabIndex = 0.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
