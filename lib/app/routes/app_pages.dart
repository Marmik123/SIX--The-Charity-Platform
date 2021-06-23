import 'package:get/get.dart';
import 'package:get_x_starter_kit/app/modules/home/bindings/home_binding _Paths.HOME,
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
