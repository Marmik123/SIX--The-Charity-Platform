import 'package:get/get.dart';
import 'package:six/app/data/models/support_details.dart';
import 'package:six/app/data/remote/provider/needy_family.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportController extends GetxController {
  RxBool supportLoading = false.obs;
  RxList<SupportDetails> supportDetails = <SupportDetails>[].obs;

  @override
  void onInit() {
    super.onInit();
    getSupportDetails();
  }

  Future<void> getSupportDetails() async {
    supportLoading(true);
    supportDetails(
        await NeedyProvider.getSupportDetails(skip: '0', limit: '1000'));
    supportLoading(false);
  }
}
