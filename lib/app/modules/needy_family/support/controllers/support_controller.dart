import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportController extends GetxController {
  //TODO: Implement SupportController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void launchURL() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'raymondwong@gmail.com',
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
