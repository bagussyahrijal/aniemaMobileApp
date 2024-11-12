// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/app/modules/transaksi/controllers/transaksi_controller.dart';

class TransaksiView extends StatelessWidget {
  // Inisialisasi TransaksiController
  final TransaksiController transaksiController = Get.put(TransaksiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pemesanan'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50), // Tinggi TabBar
          child: GetBuilder<TransaksiController>(
            builder: (controller) {
              return TabBar(
                controller: controller.tabController,
                tabs: [
                  Tab(text: 'Tagihan'),
                  Tab(text: 'Tabungan'),
                  Tab(text: 'Lunas'),
                ],
              );
            },
          ),
        ),
      ),
      body: GetBuilder<TransaksiController>(
        builder: (controller) {
          return TabBarView(
            controller: controller.tabController,
            children: [
              TransaksiListView(status: 'Tagihan', transaksiController: transaksiController),
              TransaksiListView(status: 'Tabungan', transaksiController: transaksiController),
              TransaksiListView(status: 'Lunas', transaksiController: transaksiController),
            ],
          );
        },
      ),
    );
  }
}

class TransaksiListView extends StatelessWidget {
  final String status;
  final TransaksiController transaksiController;

  TransaksiListView({required this.status, required this.transaksiController});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final transaksi = transaksiController.getTransaksi(status);

      return transaksi.isNotEmpty
          ? ListView.builder(
              itemCount: transaksi.length,
              itemBuilder: (context, index) {
                final item = transaksi[index];
                return ListTile(
                  title: Text(item['nama'] ?? ''),
                  subtitle: Text(item['tanggal'] ?? ''),
                  trailing: Text(item['jumlah'] ?? ''),
                );
              },
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.receipt_long, size: 50, color: Colors.grey),
                  Text('Belum ada data', style: TextStyle(color: Colors.grey)),
                ],
              ),
            );
    });
  }
}
