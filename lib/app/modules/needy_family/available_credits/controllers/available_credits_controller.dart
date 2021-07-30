import 'package:get/get.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/models/graph_data.dart';
import 'package:six/app/data/remote/provider/available_credits.dart';

class AvailableCreditsController extends GetxController {
  //TODO: Implement AvailableCreditsController
  RxBool isLoading = false.obs;
  RxBool disableLeading = true.obs;
  RxList<GraphData> programCreditsAvailability = <GraphData>[].obs;
  RxInt skip = 0.obs;
  RxInt limit = 1000.obs;
  final count = 0.obs;
  String whichScreen = 'screenName';
  RxInt? programIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
    logW(Get.arguments);
    if (Get.arguments != null) {
      whichScreen = Get.arguments as String;
    }

    logI(whichScreen);

    /*Checking whichScreen as this screen is used in multiple module the functions
    in init method will get called according to which screen else error will come.*/
    switch (whichScreen) {
      case 'Charity':
        assignToAvailProgCredit();
        break;

      default:
        logI('Default Case');
        break;
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
}
