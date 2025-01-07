// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors
// File: home_view.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/app/modules/Gallery/views/gallery_view.dart';
import 'package:mobileapp/app/modules/home/controllers/home_controller.dart';
import 'package:mobileapp/app/modules/pemesanan/views/pemesanan_view.dart';
import 'package:mobileapp/app/modules/pencarian/views/pencarian_view.dart';
import 'package:mobileapp/app/modules/profil/views/profil_view.dart';
import 'package:mobileapp/app/modules/transaksi/views/transaksi_view.dart';
import 'package:mobileapp/app/routes/app_pages.dart';
import 'package:mobileapp/app/services/paket_controller.dart';
import 'package:mobileapp/app/widgets/promo_banner_slider.dart';

class HomeView extends GetView<HomeController> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 254, 254),
      appBar: AppBar(
        toolbarHeight: 60,
        title: Image.asset(
          controller.asset,
          width: 100,
          height: 100,
        ),
      ),
      body: Obx(() {
        return IndexedStack(
          index: controller.selectedIndexBottomBar.value,
          children: [
            _buildHomePage(),
            PemesananView(),
            PencarianView(),
            TransaksiView(),
            ProfilView(),
          ],
        );
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: controller.selectedIndexBottomBar.value,
          unselectedItemColor: Colors.black,
          selectedItemColor: Color.fromRGBO(60, 42, 152, 1),
          type: BottomNavigationBarType.fixed,
          onTap: controller.changePage, // Panggil metode langsung tanpa animasi
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.doc_text),
              label: 'Transaction',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Person',
            ),
          ],
        ),
      ),
    );
    
  }

  Widget _buildHomePage() {
    final List<String> bannerTexts = [
      'assets/promo1.jpg',
      'assets/promo2.jpg',
    ];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PromoBannerSlider(
                banners: bannerTexts), // Menggunakan PromoBannerSlider di sini
            const SizedBox(height: 10),
            _buildIconRow(),
            SizedBox(height: 25),
            _buildTitleRow('Daftar Paket', PencarianView()),
            SizedBox(height: 15),
            _buildPackageList(),
            SizedBox(height: 15),
            _buildTitleRow('Gallery', GalleryView()),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Widget _buildIconRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIconContainer(
          Icons.airplanemode_active,
          "Umroh",
          () => Get.toNamed(Routes.UMROH_PAGE),
        ),
        SizedBox(width: 13),
        _buildIconContainer(
            Icons.location_city, "Haji", () => Get.toNamed(Routes.HAJI_PAGE)),
        SizedBox(width: 13),
        _buildIconContainer(
            Icons.beach_access, "Trip", () => Get.toNamed(Routes.TRIP_PAGE)),
      ],
    );
  }

  Widget _buildIconContainer(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        width: 110,
        height: 110,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: Color.fromRGBO(60, 42, 152, 1),
            ),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleRow(String title, Widget targetPage) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: () => Get.to(() => targetPage),
            child: Text(
              'Lihat Semua',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(60, 42, 152, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPackageList() {
    final PaketController paketC = Get.find<PaketController>();

    return Obx(() {
      if (paketC.paketList.isEmpty) {
        return Center(
          child: Text('Belum ada paket yang tersedia'),
        );
      }
      return SizedBox(
        height: 329,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 10),
          itemCount: controller.paket.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                _buildPackageContainer(index),
                SizedBox(width: 13),
              ],
            );
          },
        ),
      );
    });
  }

  Widget _buildPackageContainer(int index) {
    final paket = controller.paket[index];
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.PAKETDETAIL, arguments: paket),
      child: Obx(() => Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: 226,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(paket.image.value),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Obx(() => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            paket.nama.value,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          _buildInfoRow(
                              Icons.date_range_outlined, paket.tanggal.value),
                          SizedBox(height: 5),
                          _buildInfoRow(Icons.airplanemode_active_outlined,
                              paket.transportasi.value),
                          SizedBox(height: 10),
                          _buildPriceRow(paket.harga.value),
                        ],
                      )),
                ),
              ],
            ),
          )),
    );
  }

  Widget _buildPriceRow(int harga) {
    return Row(
      children: [
        Icon(
          Icons.monetization_on_outlined,
          size: 20,
          color: Colors.grey,
        ),
        SizedBox(width: 8),
        Text(
          'Rp ${harga.toStringAsFixed(0)}',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

// Helper widget to build an information row with an icon and text
Widget _buildInfoRow(IconData icon, String text) {
  return Row(
    children: [
      Icon(icon, size: 20, color: Colors.grey),
      SizedBox(width: 8),
      Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
      ),
    ],
  );
}

