import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/app/data/paket.dart';

class HomeController extends GetxController {
  final String asset = "assets/logo.png";
  final RxInt selectedIndexBottomBar = 0.obs;
  final PageController pageController = PageController();

  void changePage(int index) {
    selectedIndexBottomBar.value = index;
  }

  var paket = <Paket>[
    Paket(
        nama: 'Ziarah Negeri Para Nabi 10 Hari 8 Malam',
        image: 'assets/content-1.jpg',
        tanggal: '30 September 2025',
        transportasi: 'Garuda Indonesia',
        hotel: 'Bintang 5'
        ),
    Paket(
        nama: 'Ziarah Negeri Para Nabi 10 Hari 8 Malam',
        image: 'assets/content-1.jpg',
        tanggal: '30 September 2025',
        transportasi: 'Garuda Indonesia',
        hotel: 'Bintang 5'
        ),
    Paket(
        nama: 'Ziarah Negeri Para Nabi 10 Hari 8 Malam',
        image: 'assets/content-1.jpg',
        tanggal: '30 September 2025',
        transportasi: 'Garuda Indonesia',
        hotel: 'Bintang 5'
        )
  ];
}
