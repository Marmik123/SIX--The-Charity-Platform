import 'package:get/get.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/models/graph_category_data.dart';
import 'package:six/app/data/models/graph_data.dart';
import 'package:six/app/data/remote/api_service/init_api_service.dart';

class GraphDataProvider {
  //Helper Function to fetch the graph data of CREDITS BY PROGRAMS charity module.
  static Future<List<GraphData>> getGraphProgramData() async {
    var response = await APIService.get(
      path: '/v1/auth/available-credits-program-graph',
    );
    if (response?.statusCode == 200) {
      logI('######GraphDetails########');
      logI(response?.data!['data']);
      var graphData = response?.data!['data'] as List<dynamic>;
      return List<GraphData>.from(graphData.map<GraphData>(
          (dynamic e) => GraphData.fromJson(e as Map<String, dynamic>)));
    } else {
      Get.snackbar<void>('Error in Graph Data', 'Please Try Again.');
      return <GraphData>[];
    }
  }

  //Helper Function to fetch the graph data of CREDITS BY CATEGORY charity module.
  static Future<List<GraphCategoryData>> getGraphCategoryData(
      String programId) async {
    var response = await APIService.get(
      path: '/v1/auth/available-credits-program-category-graph/$programId',
    );
    if (response?.statusCode == 200) {
      logI('######GraphCategory Details########');
      logI(response?.data!['data']);
      var graphCategoryData = response?.data!['data'] as List<dynamic>;
      return List<GraphCategoryData>.from(graphCategoryData
          .map<GraphCategoryData>((dynamic e) => GraphCategoryData.fromJson(
                e as Map<String, dynamic>,
              )));
    } else {
      Get.snackbar<void>('Error in Graph Data', 'Please Try Again.');
      return <GraphCategoryData>[];
    }
  }

  //Helper Function to fetch the dashboard stats of charity module.
  static Future<Map<String, dynamic>?> getDashboardData() async {
    var response = await APIService.get(
      path: '/v1/auth/charity-dashboard-data',
    );
    if (response?.statusCode == 200) {
      logI('######DashboardDetails########');
      logI(response?.data!['data']);
      return response?.data!['data'] as Map<String, dynamic>;
    }
  }
}
