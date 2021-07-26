import 'package:get/get.dart';
import 'package:six/app/data/models/voucher_category.dart';
import 'package:six/app/data/provider/voucher_category.dart';

class PurchaseController extends GetxController {
  late RxInt? selectCategory = 0.obs;
  RxBool purchasePressed = false.obs;
  RxList<VoucherCategory> voucherCategory = <VoucherCategory>[].obs;
  RxBool paid = false.obs;
  RxBool isLoading = false.obs;
  String? paymentStatus;
  RxInt skip = 0.obs;
  RxInt limit = 1000.obs;
  @override
  void onInit() {
    super.onInit();
    assignVoucherCatList();
  }

  //Function for assigning voucher category list.
  Future<void> assignVoucherCatList() async {
    isLoading(true);
    voucherCategory(
      await VoucherCategoryProvider.getVoucherCategoryList(
        limit: limit().toString(),
        skip: skip().toString(),
        type: 'vendor',
      ),
    );
    isLoading(false);
  }

  //Function for purchasing voucher category.
  Future<void> purchaseVoucherCat(
      {
      String? programId,
      double? amount,
      }
      ) async {
    isLoading(true);
    paymentStatus = await VoucherCategoryProvider.purchaseVoucherCategory(
       categoryId: ,
        programId: programId ?? '',
        amount:amount! ,
      );
    isLoading(false);
  }
}
