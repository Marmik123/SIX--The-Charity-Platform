import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six/app/modules/social_worker/history_sw/controllers/history_sw_controller.dart';

class HistoryAllVoucherView extends GetView<HistorySwController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HistoryAllVoucherView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HistoryAllVoucherView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
