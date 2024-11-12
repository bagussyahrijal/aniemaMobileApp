// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransaksiController extends GetxController with SingleGetTickerProviderMixin {
  // Definisikan TabController
  late TabController tabController;

  // Daftar reaktif untuk setiap status transaksi
  var tagihanList = <Map<String, String>>[].obs;
  var tabunganList = <Map<String, String>>[].obs;
  var lunasList = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();

    // Inisialisasi TabController dengan 3 tab
    tabController = TabController(length: 3, vsync: this);

    // Tidak ada data transaksi awal, bisa diubah jika mengambil dari API
    fetchData();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  // Method untuk mengambil data transaksi
  void fetchData() {
    // Data kosong, bisa diubah untuk mengambil dari API atau database
    tagihanList.assignAll([]);
    tabunganList.assignAll([]);
    lunasList.assignAll([]);
  }

  // Method untuk mendapatkan transaksi berdasarkan status
  List<Map<String, String>> getTransaksi(String status) {
    switch (status) {
      case 'Tagihan':
        return tagihanList;
      case 'Tabungan':
        return tabunganList;
      case 'Lunas':
        return lunasList;
      default:
        return [];
    }
  }
}
