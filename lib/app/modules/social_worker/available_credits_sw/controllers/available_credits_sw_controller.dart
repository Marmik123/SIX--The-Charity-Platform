import 'package:get/get.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/models/available_credits_sw.dart';
import 'package:six/app/data/remote/provider/social_worker.dart';

class AvailableCreditsSwController extends GetxController {
  RxList<AvailableCredits> availCreditsSW = <AvailableCredits>[].obs;
  RxBool isLoading = false.obs;
  RxInt skip = 0.obs;
  RxInt limit = 1000.obs;
  RxBool disableLeading = true.obs;

  @override
  void onInit() {
    super.onInit();
    assignSWAvailCredits();
  }

  //Function for assigning the available credits of category for the Social Worker".
  Future<void> assignSWAvailCredits() async {
    isLoading(true);
    logI('SW AVAIL CREDITS');
    availCreditsSW(await SocialWorkerProvider.availableCreditsCategory(
        skip: skip().toString(), limit: limit().toString()));
    isLoading(false);
  }
}
