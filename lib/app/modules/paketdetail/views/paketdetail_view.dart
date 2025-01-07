// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobileapp/app/data/paket.dart';

import '../controllers/paketdetail_controller.dart';

class PaketdetailView extends GetView<PaketdetailController> {
  final Paket paket;

  const PaketdetailView({super.key, required this.paket});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(paket.nama.value),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 600,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(paket.image.value),
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    paket.nama.value,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Warna bayangan
                      spreadRadius: 5, // Penyebaran bayangan
                      blurRadius: 10, // Keburaman bayangan
                      offset: Offset(3, 3), // Offset horizontal dan vertikal
                    ),
                  ],
                ),
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nama Paket:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(paket.nama.value),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Jenis Paket:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(paket.jenis.value),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Tanggal:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(paket.tanggal.value),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Transportasi:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(paket.transportasi.value),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Hotel:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(paket.hotel.value),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Text(
                'Detail',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 160,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromRGBO(60, 42, 152, 1)),
                    child: GestureDetector(
                      onTap: () => Get.snackbar(
                          'Error', 'Maaf Itinerary Belum Tersedia'),
                      child: Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                              child: Icon(
                                Icons.list_rounded,
                                size: 40,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Itinerary',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 80,
                    width: 160,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromRGBO(37, 150, 94, 1)),
                    child: GestureDetector(
                      onTap: () => Get.snackbar(
                          'Error', 'Maaf Kontak Belum Tersedia'),
                      child: Row(
                        children: [
                          Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                              child: Icon(
                                Icons.call,
                                size: 30,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Kontak',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.grey,
              width: double.infinity,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Harga',
                            style: TextStyle(
                                fontSize: 20,
                                color: const Color.fromARGB(255, 250, 182, 94),
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Rp. ${paket.harga.toString()}',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )
                        ]),
                    ElevatedButton(
                        onPressed: () => {},
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            backgroundColor: Colors.lightBlue),
                        child: Text(
                          'Daftar',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
