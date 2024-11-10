// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/app/modules/home/controllers/home_controller.dart';
import 'package:mobileapp/app/modules/pemesanan/views/pemesanan_view.dart';
import 'package:mobileapp/app/modules/pencarian/views/pemesanan_view.dart';
import 'package:mobileapp/app/modules/profil/views/profil_view.dart';
import 'package:mobileapp/app/modules/transaksi/views/transaksi_view.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 199, 199, 199),
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 110,
                        height: 110,
                      ),
                      SizedBox(width: 13),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 110,
                        height: 110,
                      ),
                      SizedBox(width: 13),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 110,
                        height: 110,
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Daftar Paket',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {},
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
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    height: 326,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      children: [
                        Container(
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
                                    image:
                                        AssetImage(controller.paket[0].image),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(10)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.paket[0].nama,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Icon(Icons.date_range_outlined),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          controller.paket[2].tanggal,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Icon(
                                            Icons.airplanemode_active_outlined),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          controller.paket[0].transportasi,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 13),
                        Container(
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
                              // Bagian Gambar
                              Container(
                                height: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage(controller.paket[1].image),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(10)),
                                ),
                              ),
                              // Bagian Teks
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.paket[1].nama,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Icon(Icons.date_range_outlined),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          controller.paket[2].tanggal,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Icon(
                                            Icons.airplanemode_active_outlined),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          controller.paket[0].transportasi,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 13),
                        Container(
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
                              // Bagian Gambar
                              Container(
                                height: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage(controller.paket[2].image),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(10)),
                                ),
                              ),
                              // Bagian Teks
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.paket[2].nama,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Icon(Icons.date_range_outlined),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          controller.paket[2].tanggal,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Icon(
                                            Icons.airplanemode_active_outlined),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          controller.paket[0].transportasi,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Gallery',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Lihat Semua',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromRGBO(60, 42, 152, 1),
                              ),
                            ))
                      ],
                    ),
                  ),
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
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.selectedIndexBottomBar.value,
            unselectedItemColor: Colors.black,
            selectedItemColor: Color.fromRGBO(60, 42, 152, 1),
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              controller.changePage(index);
              controller.pageController.animateToPage(index,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOutCirc);
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
          )),
    );
  }
}
