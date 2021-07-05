import 'package:get/get.dart';
import 'package:six/app/modules/charity/available_vendors/bindings/available_vendors_binding.dart';
import 'package:six/app/modules/charity/available_vendors/views/available_vendors_view.dart';
import 'package:six/app/modules/charity/charity_home/bindings/charity_home_binding.dart';
import 'package:six/app/modules/charity/charity_home/views/charity_home_view.dart';
import 'package:six/app/modules/charity/charity_onboarding/bindings/charity_onboarding_binding.dart';
import 'package:six/app/modules/charity/charity_onboarding/views/charity_onboarding_view.dart';
import 'package:six/app/modules/charity/purchase/bindings/purchase_binding.dart';
import 'package:six/app/modules/charity/purchase/views/purchase_view.dart';
import 'package:six/app/modules/needy_family/available_credits/bindings/available_credits_binding.dart';
import 'package:six/app/modules/needy_family/available_credits/views/available_credits_view.dart';
import 'package:six/app/modules/needy_family/home/bindings/home_binding.dart';
import 'package:six/app/modules/needy_family/home/views/home_view.dart';
import 'package:six/app/modules/needy_family/notification/bindings/notification_binding.dart';
import 'package:six/app/modules/needy_family/notification/views/notification_view.dart';
import 'package:six/app/modules/needy_family/onboarding_screen/bindings/onboarding_screen_binding.dart';
import 'package:six/app/modules/needy_family/onboarding_screen/views/onboarding_screen_view.dart';
import 'package:six/app/modules/needy_family/profile/bindings/profile_binding.dart';
import 'package:six/app/modules/needy_family/profile/views/profile_view.dart';
import 'package:six/app/modules/needy_family/sign_pass_verification/bindings/sign_pass_verification_binding.dart';
import 'package:six/app/modules/needy_family/sign_pass_verification/views/sign_pass_verification_view.dart';
import 'package:six/app/modules/needy_family/support/bindings/support_binding.dart';
import 'package:six/app/modules/needy_family/support/views/support_view.dart';
import 'package:six/app/modules/needy_family/voucher/bindings/voucher_binding.dart';
import 'package:six/app/modules/needy_family/voucher/views/voucher_view.dart';
import 'package:six/app/modules/needy_family/voucher_redemption/bindings/voucher_redemption_binding.dart';
import 'package:six/app/modules/needy_family/voucher_redemption/views/voucher_redemption_view.dart';
import 'package:six/app/modules/splash/bindings/splash_binding.dart';
import 'package:six/app/modules/splash/views/splash_view.dart';
import 'package:six/app/modules/vendor/onboarding_vendor/bindings/onboarding_vendor_binding.dart';
import 'package:six/app/modules/vendor/onboarding_vendor/views/onboarding_vendor_view.dart';
import 'package:six/app/modules/vendor/qr_screen/bindings/qr_screen_binding.dart';
import 'package:six/app/modules/vendor/qr_screen/views/qr_screen_view.dart';
import 'package:six/app/modules/vendor/vendor_home/bindings/vendor_home_binding.dart';
import 'package:six/app/modules/vendor/vendor_home/views/vendor_home_view.dart';
import 'package:six/app/modules/vendor/vendor_redeem/bindings/vendor_redeem_binding.dart';
import 'package:six/app/modules/vendor/vendor_redeem/views/vendor_redeem_view.dart';

// import 'package:get_x_starter_kit/app/modules/home/bindings/home_binding.dart';
// import 'package:get_x_starter_kit/app/modules/home/views/home_view.dart';
// import 'package:get_x_starter_kit/app/modules/socket_test/bindings/socket_test_binding.dart';
// import 'package:get_x_starter_kit/app/modules/socket_test/views/socket_test_view.dart';
// import 'package:get_x_starter_kit/app/modules/tinode_chat/bindings/tinode_chat_binding.dart';
// import 'package:get_x_starter_kit/app/modules/tinode_chat/views/tinode_chat_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  //OnboardingScreenController ctrl = Get.put(OnboardingScreenController());

  static const INITIAL = Routes.ONBOARDING_SCREEN;

  static final routes = [
    /* GetPage(
      name: _Paths.SOCKET_TEST,
      page: () => SocketTestView(),
      binding: SocketTestBinding(),
    ),*/
    /* GetPage(
      name: _Paths.TINODE_CHAT,
      page: () => TinodeChatView(),
      binding: TinodeChatBinding(),
    ),*/
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING_SCREEN,
      page: () => OnboardingScreenView(),
      binding: OnboardingScreenBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_PASS_VERIFICATION,
      page: () => SignPassVerificationView(),
      binding: SignPassVerificationBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AVAILABLE_CREDITS,
      page: () => AvailableCreditsView(
        whichRole: '',
      ),
      binding: AvailableCreditsBinding(),
    ),
    GetPage(
      name: _Paths.VOUCHER,
      page: () => VoucherView(),
      binding: VoucherBinding(),
    ),
    GetPage(
      name: _Paths.VOUCHER_REDEMPTION,
      page: () => VoucherRedemptionView(),
      binding: VoucherRedemptionBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(
        whichScreen: '',
      ),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SUPPORT,
      page: () => SupportView(),
      binding: SupportBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING_VENDOR,
      page: () => OnboardingVendorView(),
      binding: OnboardingVendorBinding(),
    ),
    GetPage(
      name: _Paths.VENDOR_HOME,
      page: () => VendorHomeView(),
      binding: VendorHomeBinding(),
    ),
    GetPage(
      name: _Paths.VENDOR_REDEEM,
      page: () => VendorRedeemView(),
      binding: VendorRedeemBinding(),
    ),
    GetPage(
      name: _Paths.QR_SCREEN,
      page: () => QrScreenView(),
      binding: QrScreenBinding(),
    ),
    GetPage(
      name: _Paths.CHARITY_HOME,
      page: () => CharityHomeView(),
      binding: CharityHomeBinding(),
    ),
    GetPage(
      name: _Paths.CHARITY_ONBOARDING,
      page: () => CharityOnboardingView(),
      binding: CharityOnboardingBinding(),
    ),
    GetPage(
      name: _Paths.PURCHASE,
      page: () => PurchaseView(),
      binding: PurchaseBinding(),
    ),
    GetPage(
      name: _Paths.AVAILABLE_VENDORS,
      page: () => AvailableVendorsView(),
      binding: AvailableVendorsBinding(),
    ),
  ];
}
