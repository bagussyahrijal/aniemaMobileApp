// ignore_for_file: prefer_const_constructors

import 'package:mobileapp/app/data/paket.dart';

class PaketService {
  // Simulate a network call or fetching from local storage
  Future<List<Paket>> fetchPaket() async {
    await Future.delayed(Duration(seconds: 2)); 

    // Return a list of Paket objects with categories and prices
    return [
      Paket(
        nama: 'Ziarah Negeri Para Nabi 10 Hari 8 Malam',
        image: 'assets/content-1.jpg',
        tanggal: '30 September 2025',
        transportasi: 'Garuda Indonesia',
        hotel: 'Bintang 5',
        category: 'Umroh',
        harga: double.parse('25000000'),  // Parse the string as a double
      ),
      Paket(
        nama: 'Jakarta - Ancol - Dufan - Kota Tua',
        image: 'assets/content-4.png',
        tanggal: '15 October 2025',
        transportasi: 'Lion Air',
        hotel: 'Bintang 4',
        category: 'Trip',
        harga: double.parse('5000000'),  // Parse the string as a double
      ),
      Paket(
        nama: 'Tour 3 Negara',
        image: 'assets/content-2.jpg',
        tanggal: '25 November 2025',
        transportasi: 'AirAsia',
        hotel: 'Bintang 5',
        category: 'Trip',
        harga: double.parse('6900000'),  // Parse the string as a double
      ),
      Paket(
        nama: '3 Day Trip Lombok',
        image: 'assets/content-3.jpg',
        tanggal: '25 November 2025',
        transportasi: 'AirAsia',
        hotel: 'Bintang 3',
        category: 'Trip',
        harga: double.parse('6370000'),  // Parse the string as a double
      ),
      Paket(
        nama: 'Jakarta - Masjid Istiqlal - Kota Tua',
        image: 'assets/content-5.jpg',
        tanggal: '25 November 2025',
        transportasi: 'AirAsia',
        hotel: 'Bintang 3',
        category: 'Trip',
        harga: double.parse('185000'),  // Parse the string as a double
      ),
      Paket(
        nama: 'Jakarta - Monas - Taman Mini',
        image: 'assets/content-6.jpg',
        tanggal: '25 November 2025',
        transportasi: 'AirAsia',
        hotel: 'Bintang 3',
        category: 'Trip',
        harga: double.parse('195000'),  // Parse the string as a double
      ),
      Paket(
        nama: 'Jakarta - Taman Mini - Kota Tua',
        image: 'assets/content-7.jpg',
        tanggal: '25 November 2025',
        transportasi: 'AirAsia',
        hotel: 'Bintang 3',
        category: 'Trip',
        harga: double.parse('230000'),  // Parse the string as a double
      ),
      Paket(
        nama: 'Bogor - Mini Mania - Heha Waterfall - Pusat Oleh-oleh',
        image: 'assets/content-8.jpg',
        tanggal: '25 November 2025',
        transportasi: 'AirAsia',
        hotel: 'Bintang 3',
        category: 'Trip',
        harga: double.parse('4000000'),  // Parse the string as a double
      ),
      Paket(
        nama: 'Bandung - Masjid AL JABBAR - Great Asia Afrika',
        image: 'assets/content-9.jpg',
        tanggal: '25 November 2025',
        transportasi: 'AirAsia',
        hotel: 'Bintang 3',
        category: 'Trip',
        harga: double.parse('285000'),  // Parse the string as a double
      ),
      Paket(
        nama: 'Haji 2025 Paket Ibadah Haji',
        image: 'assets/content-1.jpg',
        tanggal: '1 July 2025',
        transportasi: 'Saudi Airlines',
        hotel: 'Bintang 5',
        category: 'Haji',
        harga: double.parse('45000000'),  // Parse the string as a double
      ),
    ];
  }
}
