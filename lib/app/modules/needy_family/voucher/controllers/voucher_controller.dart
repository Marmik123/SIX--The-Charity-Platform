import 'package:get/get.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/models/available_vouchers.dart';
import 'package:six/app/data/models/voucher_category.dart';
import 'package:six/app/data/remote/provider/needy_family.dart';
import 'package:six/app/data/remote/provider/voucher_category.dart';
import 'package:six/app/utils/get_month_name.dart';

class VoucherController extends GetxController {
  RxInt selectedCategory = 0.obs;
  RxList<VoucherCategory> categoryList = <VoucherCategory>[].obs;
  RxList<AvailableVouchers> vouchers = <AvailableVouchers>[].obs;
  RxInt skip = 0.obs;
  RxInt limit = 1000.obs;
  RxBool isLoading = false.obs;
  RxString categoryId = ''.obs;
  RxBool isVoucherLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    assignVoucherCatList();
  }

  String? getDate(int index) {
    var formattedDate = DateTime.parse(vouchers[index].endDate.toString());
    var date = formattedDate.day;
    var year = formattedDate.year;
    var month = assignMonth(formattedDate.month);
    var finalDate = '$date,$month $year';
    return finalDate;
  }

  Future<void> assignVoucherCatList() async {
    isLoading(true);
    categoryList(await VoucherCategoryProvider.getVoucherCategoryList(
      limit: limit().toString(),
      skip: skip().toString(),
      type: 'vendor',
    ));
    logI(categoryList);
    isLoading(false);
    await assignVoucherList(categoryList[0].id!);
  }

  bool checkIsExpired(int index) {
    var isAfter = DateTime.now().compareTo(vouchers[index].endDate!);
    if (isAfter > 0) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> assignVoucherList(String categoryId) async {
    isVoucherLoading(true);
    // initialVoucherCount.fillRange(0, initialVoucherCount.length, 0);
    // logI(initialVoucherCount);
    vouchers(
      await NeedyProvider.getVoucherList(
        limit: limit().toString(),
        skip: skip().toString(),
        categoryId: categoryId,
      ),
    );
    // initialVoucherCount.clear();
    /*vouchers.forEach((element) {
      initialVoucherCount.add(0);
    });
    logWTF(initialVoucherCount);*/
    logI(categoryList);
    isVoucherLoading(false);
  }
}
