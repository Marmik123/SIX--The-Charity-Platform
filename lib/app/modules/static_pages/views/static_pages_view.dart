import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/static_pages_controller.dart';

class StaticPagesView extends GetView<StaticPagesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StaticPagesView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'StaticPagesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
