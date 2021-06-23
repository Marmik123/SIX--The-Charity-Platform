import 'package:catcher/core/catcher.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:six/app/data/config/encryption.dart';
import 'package:six/app/data/local/locale_provider.dart';
import 'package:six/app/data/local/theme_provider.dart';
import 'package:six/app/data/models/menu_option_model.dart';
import 'package:six/app/data/remote/api_service/init_api_service.dart';
import 'package:six/app/data/remote/api_service/service.dart';
import 'package:six/app/ui/components/custom_paint.dart';
import 'package:six/app/ui/components/segmented_controls.dart';
import 'package:six/app/ui/components/voucher_card.dart';
import 'package:six/generated/locales.g.dart';
import 'package:six/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          //Generated using [https://fluttershapemaker.com/]
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomPaint(
              size: Size(
                  Get.width,
                  (Get.width * 0.6029850746268657)
                      .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: VoucherCard(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomPaint(
              size: Size(
                  Get.width,
                  (Get.width * 0.21890547263681592)
                      .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: RPSCustomPainter(),
            ),
          ),
          Text(
            LocaleKeys.home_view.tr,
            style: const TextStyle(fontSize: 20),
          ),
          const Divider(),
          const Text(
            'Test API',
            style: TextStyle(fontSize: 20),
          ),
          ElevatedButton(
            onPressed: () {
              APIService.apiClient.getTask('19');
              APIService.apiClient.createTask(TaskEntity(
                id: '10',
                name: 'Dummy Task',
              ));
            },
            child: const Text('Create Fake Task'),
          ),
          const Divider(),
          const Text(
            'Test Error',
            style: TextStyle(fontSize: 20),
          ),
          ElevatedButton(
            onPressed: () {
              Catcher.sendTestException();
            },
            child: const Text('Throw error'),
          ),
          const Divider(),
          const Text(
            'Test Encryption',
            style: TextStyle(fontSize: 20),
          ),
          ElevatedButton(
            onPressed: () {
              /*logI(AppEncryption.encrypt(
                plainText: jsonEncode({
                  'name': '',
                  'username': 'test',
                  'email': '',
                  'phone': '',
                  'country': '',
                  'city': '',
                  'bio': '',
                  'current_location': '',
                  'first_name': '',
                  'last_name': '',
                  'address_line1': '',
                  'address_line2': '',
                  'is_verified': false,
                  'job_post': '',
                  'password':
                      'passwordpasswordpasswordpasswordpasswordpasswordpasswordpasswordpasswordpassword',
                }),
              ));*/
              AppEncryption.testEncryption();
            },
            child: const Text('Encrypt Data'),
          ),
          const Divider(),
          const Text(
            'Test Socket.IO',
            style: TextStyle(fontSize: 20),
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed<void>(Routes.SOCKET_TEST);
            },
            child: const Text('Socket Panel'),
          ),
          const Divider(),
          const Text(
            'Test Tinode Chat',
            style: TextStyle(fontSize: 20),
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed<void>(Routes.TINODE_CHAT);
            },
            child: const Text('Tinode Chat'),
          ),
          const Divider(),
          const Text(
            'Test Theme Modes',
            style: TextStyle(fontSize: 20),
          ),
          Container(
            width: Get.width,
            height: 100,
            alignment: Alignment.center,
            child: themeListTile(),
          ),
          const Divider(),
          const Text(
            'Test Change Language',
            style: TextStyle(fontSize: 20),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  LocaleProvider.changeLocale(const Locale('en_US'));
                },
                child: const Text('Change to en_US'),
              ),
              ElevatedButton(
                onPressed: () {
                  LocaleProvider.changeLocale(const Locale('hi_IN'));
                },
                child: const Text('Change to hi_IN'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget themeListTile() {
    final themeOptions = <MenuOptionsModel>[
      MenuOptionsModel(
        key: ThemeMode.system,
        value: 'settings_system'.tr,
        icon: Icons.brightness_4,
      ),
      MenuOptionsModel(
        key: ThemeMode.light,
        value: 'settings_light'.tr,
        icon: Icons.brightness_low,
      ),
      MenuOptionsModel(
        key: ThemeMode.dark,
        value: 'settings_dark'.tr,
        icon: Icons.brightness_3,
      ),
    ];
    return GetBuilder<HomeController>(
      builder: (controller) => SegmentedSelector(
        selectedOption: ThemeProvider.currentTheme,
        menuOptions: themeOptions,
        onValueChanged: (value) {
          ThemeProvider.setThemeMode(value!);
        },
      ),
    );
  }
}
