import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/admin_gallery_controller.dart';

class AdminGalleryView extends GetView<AdminGalleryController> {
  const AdminGalleryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdminGalleryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AdminGalleryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
