import 'package:get/get.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/local/user_provider.dart';
import 'package:six/app/data/remote/provider/vendor_provider.dart';

class StaticPagesController extends GetxController {
  Map<String, dynamic>? staticPageData;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getStaticPageData(String slugName) async {
    isLoading(true);
    switch (UserProvider.role) {
      case 'charity':
        staticPageData = await VendorProvider.getStaticPages(
          slugName: 'organization_' + slugName,
        );
        isLoading(false);
        break;
      case 'social_worker':
        staticPageData = await VendorProvider.getStaticPages(
          slugName: 'social_worker_' + slugName,
        );
        isLoading(false);
        break;
      case 'needy_family':
        staticPageData = await VendorProvider.getStaticPages(
          slugName: 'beneficiary_' + slugName,
        );
        isLoading(false);
        break;
      case 'vendor':
        staticPageData = await VendorProvider.getStaticPages(
          slugName: 'vendor_' + slugName,
        );
        isLoading(false);
        break;
    }
    logI(staticPageData);
  }
}
