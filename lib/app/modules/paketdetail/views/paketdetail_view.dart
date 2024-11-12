import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/paketdetail_controller.dart';

class PaketdetailView extends GetView<PaketdetailController> {
  const PaketdetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PaketdetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PaketdetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
