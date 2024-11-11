// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/app/modules/Gallery/views/gallery_view.dart';
import 'package:mobileapp/app/modules/home/controllers/home_controller.dart';
import 'package:mobileapp/app/modules/pemesanan/views/pemesanan_view.dart';
import 'package:mobileapp/app/modules/pencarian/views/pencarian_view.dart';
import 'package:mobileapp/app/modules/profil/views/profil_view.dart';
import 'package:mobileapp/app/modules/transaksi/views/transaksi_view.dart';

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
      body: PageView(
        controller: controller.pageController,
        onPageChanged: controller.changePage,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildIconRow(),
                  SizedBox(height: 25),
                  _buildTitleRow('Daftar Paket', PencarianView()), // Removed navigation to AllPaketView
                  SizedBox(height: 15),
                  _buildPackageList(),
                  SizedBox(height: 15),
                  _buildTitleRow('Gallery', GalleryView()), // You can keep GalleryView if needed
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
          PemesananView(),
          PencarianView(),
          TransaksiView(),
          ProfilView(),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.selectedIndexBottomBar.value,
          unselectedItemColor: Colors.black,
          selectedItemColor: Color.fromRGBO(60, 42, 152, 1),
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            controller.changePage(index);
            controller.pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOutCirc,
            );
          },
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

  // Widget for row of icons at the top
  Widget _buildIconRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIconContainer(Icons.airplanemode_active, "Umroh"),
        SizedBox(width: 13),
        _buildIconContainer(Icons.location_city, "Haji"),
        SizedBox(width: 13),
        _buildIconContainer(Icons.beach_access, "Trip"),
      ],
    );
  }

  // Helper widget for each icon container with label
  Widget _buildIconContainer(IconData icon, String label) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 197, 195, 195),
        borderRadius: BorderRadius.circular(10),
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
    );
  }

  // Widget for titles with "See All" button
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
            onPressed: () => Get.to(() => PencarianView()), // Arahkan ke PencarianView
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

  // Widget for horizontal list of packages
  Widget _buildPackageList() {
    return SizedBox(
      height: 326,
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
  }

// Helper widget for each package container
Widget _buildPackageContainer(int index) {
  final paket = controller.paket[index];
  return Container(
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
        // Image section
        Container(
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(paket.image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(10),
            ),
          ),
        ),
        // Text section
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                paket.nama,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              _buildInfoRow(Icons.date_range_outlined, paket.tanggal),
              SizedBox(height: 5),
              _buildInfoRow(Icons.airplanemode_active_outlined, paket.transportasi),
              SizedBox(height: 10),
              _buildPriceRow(paket.harga),  // Pass the price from the paket object
            ],
          ),
        ),
      ],
    ),
  );
}

// New helper widget to display the price
Widget _buildPriceRow(double harga) {
  return Row(
    children: [
      Icon(
        Icons.monetization_on_outlined,
        size: 20,
        color: Colors.grey,
      ),
      SizedBox(width: 8),
      Text(
        'Rp ${harga.toStringAsFixed(0)}',  // Format the price to show as currency
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
      ),
    ],
  );
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
}
