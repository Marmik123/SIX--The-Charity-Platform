import 'package:get/get.dart';
import 'package:six/app/data/local/user_provider.dart';
import 'package:six/app/data/remote/provider/needy_family.dart';

class HomeController extends GetxController {
  Map<String, dynamic>? beneDash;
  RxInt? currentIndex = 0.obs;
  RxBool dashDataLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    if (UserProvider.role == 'needy_family') {
      assignDash();
    }
  }

  Future<void> assignDash() async {
    dashDataLoading(true);
    beneDash = await NeedyProvider.getDashboardData();
    dashDataLoading(false);
  }
}
