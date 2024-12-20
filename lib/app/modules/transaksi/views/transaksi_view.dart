// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/app/controllers/auth_controller.dart';
import 'package:mobileapp/app/modules/transaksi/controllers/transaksi_controller.dart';

class TransaksiView extends StatelessWidget {
  // Inisialisasi TransaksiController
  final TransaksiController transaksiController =
      Get.put(TransaksiController());
  final AuthController authC = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => authC.isLoggedIn.value
          ? Scaffold(
              appBar: AppBar(
                title: Text('Transaksi Saya'),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.receipt_long, size: 50, color: Colors.grey),
                    Text('Belum ada data',
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ))
          : Center(
              child: Text("Silahkan Login Terlebih Dahulu"),
            ),
    );
  }
}