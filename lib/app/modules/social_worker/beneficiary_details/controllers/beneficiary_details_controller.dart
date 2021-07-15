import 'package:get/get.dart';

class BeneficiaryDetailsController extends GetxController {
  //TODO: Implement BeneficiaryDetailsController
  RxInt? tabIndex = 0.obs;
  RxBool snap = true.obs;
  RxBool backColor = true.obs;
  RxDouble top = 0.0.obs;
  RxDouble opacity = 0.0.obs;
  final count = 0.obs;
  List<String> text = [
    'Note',
    'Connected',
    'Assigned',
  ];
  List<String> textNewLine = [
    'Details',
    'Organization',
    'Vouchers',
  ];
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
