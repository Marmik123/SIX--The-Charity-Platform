import 'package:get/get.dart';
import 'package:get_x_starter_kit/app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:get_x_starter_kit/app/modules/onboarding/views/onboarding_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    /*GetPage(
      name: _Paths.HOME,
      page: () => Home(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SOCKET_TEST,
      page: () => SocketTestView(),
      binding: SocketTestBinding(),
    ),
    GetPage(
      name: _Paths.TINODE_CHAT,
      page: () => TinodeChatView(),
      binding: TinodeChatBinding(),
    ),*/
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
  ];
}
