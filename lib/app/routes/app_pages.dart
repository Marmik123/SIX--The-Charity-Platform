import 'package:get/get.dart';
import 'package:six/app/modules/charity/available_vendors/bindings/available_vendors_binding.dart';
import 'package:six/app/modules/charity/available_vendors/views/available_vendors_view.dart';
import 'package:six/app/modules/charity/charity_home/bindings/charity_home_binding.dart';
import 'package:six/app/modules/charity/charity_home/views/charity_home_view.dart';
import 'package:six/app/modules/charity/charity_onboarding/bindings/charity_onboarding_binding.dart';
import 'package:six/app/modules/charity/charity_onboarding/views/charity_onboarding_view.dart';
import 'package:six/app/modules/charity/purchase/bindings/purchase_binding.dart';
import 'package:six/app/modules/charity/purchase/views/purchase_view.dart';
import 'package:six/app/modules/charity/vendor_details/bindings/vendor_details_binding.dart';
import 'package:six/app/modules/charity/vendor_details/views/vendor_details__view.dart';
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
import 'package:six/app/modules/needy_family/sign_pass_verification/views/web_view.dart';
import 'package:six/app/modules/needy_family/support/bindings/support_binding.dart';
import 'package:six/app/modules/needy_family/support/views/support_view.dart';
import 'package:six/app/modules/needy_family/voucher/bindings/voucher_binding.dart';
import 'package:six/app/modules/needy_family/voucher/views/voucher_view.dart';
import 'package:six/app/modules/needy_family/voucher_redemption/bindings/voucher_redemption_binding.dart';
import 'package:six/app/modules/needy_family/voucher_redemption/views/voucher_redemption_view.dart';
import 'package:six/app/modules/purchase_social/bindings/purchase_social_binding.dart';
import 'package:six/app/modules/purchase_social/views/purchase_social_view.dart';
import 'package:six/app/modules/social_worker/add_note/views/add_note_view.dart';
import 'package:six/app/modules/social_worker/assigned_voucher/bindings/assigned_voucher_binding.dart';
import 'package:six/app/modules/social_worker/assigned_voucher/views/assigned_voucher_view.dart';
import 'package:six/app/modules/social_worker/available_credits_sw/bindings/available_credits_sw_binding.dart';
import 'package:six/app/modules/social_worker/available_credits_sw/views/available_credits_sw_view.dart';
import 'package:six/app/modules/social_worker/beneficiary_details/bindings/beneficiary_details_binding.dart';
import 'package:six/app/modules/social_worker/beneficiary_details/views/beneficiary_details_view.dart';
import 'package:six/app/modules/social_worker/connected_organization/bindings/connected_organization_binding.dart';
import 'package:six/app/modules/social_worker/connected_organization/views/connected_organization_view.dart';
import 'package:six/app/modules/social_worker/distribute_voucher/bindings/distribute_voucher_binding.dart';
import 'package:six/app/modules/social_worker/distribute_voucher/views/distribute_voucher_view.dart';
import 'package:six/app/modules/social_worker/edit_note/bindings/edit_note_binding.dart';
import 'package:six/app/modules/social_worker/edit_note/views/edit_note_view.dart';
import 'package:six/app/modules/social_worker/history_sw/bindings/history_sw_binding.dart';
import 'package:six/app/modules/social_worker/history_sw/views/history_sw_view.dart';
import 'package:six/app/modules/social_worker/social_home/bindings/social_home_binding.dart';
import 'package:six/app/modules/social_worker/social_home/views/social_home_view.dart';
import 'package:six/app/modules/social_worker/social_onboarding/bindings/social_onboarding_binding.dart';
import 'package:six/app/modules/social_worker/social_onboarding/views/social_onboarding_view.dart';
import 'package:six/app/modules/static_pages/bindings/static_pages_binding.dart';
import 'package:six/app/modules/static_pages/views/static_pages_view.dart';
import 'package:six/app/modules/terms_conditions/bindings/terms_conditions_binding.dart';
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

  static const INITIAL = Routes.SIGN_PASS_VERIFICATION;

  static final routes = [
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
      page: () => AvailableCreditsView(),
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
      page: () => ProfileView(),
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
    GetPage(
      name: _Paths.VENDOR_DETAILS,
      page: () => VendorDetailsView(),
      binding: VendorDetailsBinding(),
    ),
    GetPage(
      name: _Paths.SOCIAL_HOME,
      page: () => SocialHomeView(),
      binding: SocialHomeBinding(),
    ),
    GetPage(
      name: _Paths.SOCIAL_ONBOARDING,
      page: () => SocialOnboardingView(),
      binding: SocialOnboardingBinding(),
    ),
    GetPage(
      name: _Paths.ADD_NOTE,
      page: () => AddNoteView(),
      //binding: AddNoteBinding(),
    ),
    GetPage(
      name: _Paths.BENEFICIARY_DETAILS,
      page: () => BeneficiaryDetailsView(),
      binding: BeneficiaryDetailsBinding(),
    ),
    /* GetPage(
      name: _Paths.NOTE_DETAILS,
      page: () => NoteDetailsView(),
      binding: NoteDetailsBinding(),
    ),*/
    GetPage(
      name: _Paths.EDIT_NOTE,
      page: () => EditNoteView(),
      binding: EditNoteBinding(),
    ),
    GetPage(
      name: _Paths.CONNECTED_ORGANIZATION,
      page: () => ConnectedOrganizationView(),
      binding: ConnectedOrganizationBinding(),
    ),
    GetPage(
      name: _Paths.ASSIGNED_VOUCHER,
      page: () => AssignedVoucherView(),
      binding: AssignedVoucherBinding(),
    ),
    GetPage(
      name: _Paths.DISTRIBUTE_VOUCHER,
      page: () => DistributeVoucherView(),
      binding: DistributeVoucherBinding(),
    ),
    GetPage(
      name: _Paths.PURCHASE_SOCIAL,
      page: () => PurchaseSocialView(),
      binding: PurchaseSocialBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY_SW,
      page: () => HistorySwView(),
      binding: HistorySwBinding(),
    ),
    GetPage(
      name: _Paths.WEB_VIEW,
      page: () => WebViewScreen(),
      binding: SignPassVerificationBinding(),
    ),
    GetPage(
      name: _Paths.AVAILABLE_CREDITS_SW,
      page: () => AvailableCreditsViewSW(),
      binding: AvailableCreditsSwBinding(),
    ),
    GetPage(
      name: _Paths.STATIC_PAGES,
      page: () => StaticPagesView(),
      binding: StaticPagesBinding(),
    ),
  ];
}
