import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/socket_test_controller.dart';

class SocketTestView extends GetView<SocketTestController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SocketTestView'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Obx(() => Text(
                'Socket Connection status : ${controller.socketStatus()}',
              )),
          const Divider(),
          ElevatedButton(
            onPressed: () {
              controller.connectToSocket();
            },
            child: const Text('Connect Socket'),
          ),
        ],
      ),
    );
  }
}
