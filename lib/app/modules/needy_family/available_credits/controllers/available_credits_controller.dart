import 'package:get/get.dart';
import 'package:six/app/data/models/graph_data.dart';
import 'package:six/app/data/provider/home_graph_provider.dart';

class AvailableCreditsController extends GetxController {
  //TODO: Implement AvailableCreditsController
  RxBool isLoading = false.obs;
  RxList<GraphData> graphDetails = <GraphData>[].obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

    assignToGraphDetails();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  Future<void> assignToGraphDetails() async {
    isLoading(true);
    graphDetails(await GraphDataProvider.getGraphProgramData());
    isLoading(false);
  }
}
