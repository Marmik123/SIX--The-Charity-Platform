import 'package:get/get.dart';
import 'package:six/app/data/config/logger.dart';
import '../controllers/qr_screen_controller.dart';

class QrScreenBinding extends Bindings {
  @override
  void dependencies() {
    logWTF('!!!!!!Binding start!!!!!!!!');
    Get.lazyPut<QrScreenController>(
      () => QrScreenController(),
    );
  }
}
