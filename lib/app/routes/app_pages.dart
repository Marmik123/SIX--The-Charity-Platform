import 'package:get/get.dart';

import 'package:get_x_starter_kit/app/modules/home/bindings/home_binding.dart';
import 'package:get_x_starter_kit/app/modules/home/views/home_view.dart';
import 'package:get_x_starter_kit/app/modules/socket_test/bindings/socket_test_binding.dart';
import 'package:get_x_starter_kit/app/modules/socket_test/views/socket_test_view.dart';
import 'package:get_x_starter_kit/app/modules/tinode_chat/bindings/tinode_chat_binding.dart';
import 'package:get_x_starter_kit/app/modules/tinode_chat/views/tinode_chat_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
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
    ),
  ];
}
