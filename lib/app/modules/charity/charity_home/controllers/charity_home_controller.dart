import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/graph_data.dart';

class CharityHomeController extends GetxController {
  //TODO: Implement CharityHomeController
  RxInt? tabIndex = 0.obs;
  RxInt? currentIndex = 0.obs;

  final List<GraphData> chartData = [
    GraphData(
      yLabel: '\$60k',
      xLabel: 'Support\nBeneficiary Fund',
      value: 60000,
      columnColor: AppColors.kFF9871,
    ),
    GraphData(
      yLabel: '\$20k',
      xLabel: 'Covid19\nRelief Fund',
      value: 20000,
      columnColor: AppColors.kFF007A,
    ),
    GraphData(
      yLabel: '\$15k',
      xLabel: 'Serving\nthe Elderly',
      value: 15000,
      columnColor: AppColors.kFFD85E,
    ),
  ];
  final List<GraphData> secondChart = [
    GraphData(
      yLabel: '\$60k',
      xLabel: 'Food &\nbeverage',
      value: 15000,
      columnColor: AppColors.kFF9871,
    ),
    GraphData(
      yLabel: '\$20k',
      xLabel: 'Delivery',
      value: 5000,
      columnColor: AppColors.kFF007A,
    ),
    GraphData(
      yLabel: '\$15k',
      xLabel: 'Supermarket',
      value: 30000,
      columnColor: AppColors.k13A89E,
    ),
    GraphData(
      yLabel: '\$15k',
      xLabel: 'Transportation',
      value: 10000,
      columnColor: AppColors.kFFD85E,
    ),
  ];
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }
}
