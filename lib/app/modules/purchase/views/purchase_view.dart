import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/purchase_controller.dart';

class PurchaseView extends GetView<PurchaseController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PurchaseView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PurchaseView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
