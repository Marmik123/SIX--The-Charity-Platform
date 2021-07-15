import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/purchase_social_controller.dart';

class PurchaseSocialView extends GetView<PurchaseSocialController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PurchaseSocialView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PurchaseSocialView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
