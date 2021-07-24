import 'package:get/get.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/models/graph_data.dart';
import 'package:six/app/data/remote/api_service/init_api_service.dart';

class AvailableCreditsProvider {
  //Helper Function to fetch the total available credits of different charity programs.
  static Future<List<GraphData>> getTotalAvailableCreditsData(
      {String skip = '', String limit = ''}) async {
    var response = await APIService.get(
      path: '/v1/auth/charity-program-list-available-credits/$skip/$limit',
    );
    if (response.statusCode == 200) {
      logI('######Avail Credits########');
      logI(response.data!['data']);
      var availCredits = response.data!['data'] as List<dynamic>;
      return List<GraphData>.from(availCredits.map<GraphData>(
          (dynamic e) => GraphData.fromJson(e as Map<String, dynamic>)));
    } else {
      Get.snackbar<void>('Error in Graph Data', 'Please Try Again.');
      return <GraphData>[];
    }
  }
}
