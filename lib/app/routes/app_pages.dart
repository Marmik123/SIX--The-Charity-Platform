import 'package:get/get.dart';

import 'package:six/app/modules/home/bindings/home_binding.dart';
import 'package:six/app/modules/home/views/home_view.dart';
import 'package:six/app/modules/onboarding_screen/bindings/onboarding_screen_binding.dart';
import 'package:six/app/modules/onboarding_screen/views/onboarding_screen_view.dart';
import 'package:six/app/modules/sign_pass_verification/bindings/sign_pass_verification_binding.dart';
import 'package:six/app/modules/sign_pass_verification/views/sign_pass_verification_view.dart';
import 'package:six/app/modules/splash/bindings/splash_binding.dart';
import 'package:six/app/modules/splash/views/splash_view.dart';

// import 'package:get_x_starter_kit/app/modules/home/bindings/home_binding.dart';
// import 'package:get_x_starter_kit/app/modules/home/views/home_view.dart';
// import 'package:get_x_starter_kit/app/modules/socket_test/bindings/socket_test_binding.dart';
// import 'package:get_x_starter_kit/app/modules/socket_test/views/socket_test_view.dart';
// import 'package:get_x_starter_kit/app/modules/tinode_chat/bindings/tinode_chat_binding.dart';
// import 'package:get_x_starter_kit/app/modules/tinode_chat/views/tinode_chat_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

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
  ];
}
