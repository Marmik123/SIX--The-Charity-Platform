import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HistoryAllVoucherView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HistoryAllVoucherView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HistoryAllVoucherView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
