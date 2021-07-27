import 'package:get/get.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/models/graph_data.dart';
import 'package:six/app/data/provider/available_credits.dart';

class AvailableCreditsController extends GetxController {
  //TODO: Implement AvailableCreditsController
  RxBool isLoading = false.obs;
  RxBool disableLeading = true.obs;
  RxList<GraphData> programCreditsAvailability = <GraphData>[].obs;
  RxInt skip = 0.obs;
  RxInt limit = 1000.obs;
  final count = 0.obs;
  RxInt? programIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
    assignToAvailProgCredit();
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
