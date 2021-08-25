import 'package:get/get.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/local/user_provider.dart';
import 'package:six/app/data/models/available_credits_sw.dart';
import 'package:six/app/data/models/graph_category_data.dart';
import 'package:six/app/data/remote/provider/available_credits.dart';

class AvailableCreditsController extends GetxController {
  //TODO: Implement AvailableCreditsController
  RxBool isLoading = false.obs;
  RxBool isNeedyLoading = false.obs;
  RxBool disableLeading = true.obs;
  RxList<GraphCategoryData> programCreditsAvailability =
      <GraphCategoryData>[].obs;
  RxList<GraphCategoryData> needyProgCredits = <GraphCategoryData>[].obs;
  RxList<AvailableCredits> availCreditsSW = <AvailableCredits>[].obs;
  RxInt skip = 0.obs;
  RxInt limit = 1000.obs;
  RxInt? programIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
    if (UserProvider.role == 'charity') {
      assignToAvailProgCredit();
    }
    if (UserProvider.role == 'needy_family') {
      disableLeading(false);
      assignToNeedyProgCredit();
    }
  }

  //Function for assigning the available credits of programs to the list "programCreditsAvailability".
  Future<void> assignToAvailProgCredit() async {
    isLoading(true);
    logI('availCreditsCalled');
    programCreditsAvailability(
        await AvailableCreditsProvider.getTotalAvailableCreditsData(
            skip: skip().toString(), limit: limit().toString()));
    isLoading(false);
  }

  //Function for assigning the available credits of programs to the list "programCreditsAvailability".
  Future<void> assignToNeedyProgCredit() async {
    isNeedyLoading(true);
    logI('availNeedyCreditsCalled');
    needyProgCredits(
        await AvailableCreditsProvider.getTotalAvailableCreditsNeedy());
    isNeedyLoading(false);
  }
}
