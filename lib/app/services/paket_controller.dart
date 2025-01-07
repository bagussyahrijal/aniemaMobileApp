import 'package:get/get.dart';
import 'package:mobileapp/app/data/paket.dart';

class PaketController extends GetxController {
  var paketList = <Paket>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await fetchPaket();
    // print(paketList);
  }

  Future<void> fetchPaket() async {
    await Future.delayed(Duration(seconds: 2));

    // Return a list of Paket objects with categories and prices
    var initialdata = [
      Paket(
          nama: 'Ziarah Negeri Para Nabi 10 Hari 8 Malam',
          image: 'assets/content-1.jpg',
          tanggal: '2025-09-30', // Format changed to yyyy-mm-dd
          transportasi: 'Garuda Indonesia',
          hotel: 'Bintang 5',
          category: 'Umroh',
          harga: int.parse('25000000'),
          itinerary: "",
          jenis: "Umroh Plus"),
      Paket(
          nama: 'Jakarta - Ancol - Dufan - Kota Tua',
          image: 'assets/content-4.png',
          tanggal: '2025-10-15', // Format changed to yyyy-mm-dd
          transportasi: 'Lion Air',
          hotel: 'Bintang 4',
          category: 'Trip',
          harga: int.parse('5000000'),
          itinerary: "",
          jenis: "Trip"),
      Paket(
          nama: 'Tour 3 Negara',
          image: 'assets/content-2.jpg',
          tanggal: '2025-11-25', // Format changed to yyyy-mm-dd
          transportasi: 'AirAsia',
          hotel: 'Bintang 5',
          category: 'Trip',
          harga: int.parse('6900000'),
          itinerary: "",
          jenis: "Trip"),
      Paket(
          nama: '3 Day Trip Lombok',
          image: 'assets/content-3.jpg',
          tanggal: '2025-11-25', // Format changed to yyyy-mm-dd
          transportasi: 'AirAsia',
          hotel: 'Bintang 3',
          category: 'Trip',
          harga: int.parse('6370000'),
          itinerary: "",
          jenis: "Trip"),
      Paket(
          nama: 'Jakarta - Masjid Istiqlal - Kota Tua',
          image: 'assets/content-5.jpg',
          tanggal: '2025-11-25', // Format changed to yyyy-mm-dd
          transportasi: 'AirAsia',
          hotel: 'Bintang 3',
          category: 'Trip',
          harga: int.parse('185000'),
          itinerary: "",
          jenis: "Trip"),
      Paket(
          nama: 'Jakarta - Monas - Taman Mini',
          image: 'assets/content-6.jpg',
          tanggal: '2025-11-25', // Format changed to yyyy-mm-dd
          transportasi: 'AirAsia',
          hotel: 'Bintang 3',
          category: 'Trip',
          harga: int.parse('195000'),
          itinerary: "",
          jenis: "Trip"),
      Paket(
          nama: 'Jakarta - Taman Mini - Kota Tua',
          image: 'assets/content-7.jpg',
          tanggal: '2025-11-25', // Format changed to yyyy-mm-dd
          transportasi: 'AirAsia',
          hotel: 'Bintang 3',
          category: 'Trip',
          harga: int.parse('230000'),
          itinerary: "",
          jenis: "Trip"),
      Paket(
          nama: 'Bogor - Mini Mania - Heha Waterfall - Pusat Oleh-oleh',
          image: 'assets/content-8.jpg',
          tanggal: '2025-11-25', // Format changed to yyyy-mm-dd
          transportasi: 'AirAsia',
          hotel: 'Bintang 3',
          category: 'Trip',
          harga: int.parse('4000000'),
          itinerary: "",
          jenis: "Trip"),
      Paket(
          nama: 'Bandung - Masjid AL JABBAR - Great Asia Afrika',
          image: 'assets/content-9.jpg',
          tanggal: '2025-11-25', // Format changed to yyyy-mm-dd
          transportasi: 'AirAsia',
          hotel: 'Bintang 3',
          category: 'Trip',
          harga: int.parse('285000'),
          itinerary: "",
          jenis: "Trip"),
      Paket(
          nama: 'Haji 2025 Paket Ibadah Haji',
          image: 'assets/content-1.jpg',
          tanggal: '2025-07-01', // Format changed to yyyy-mm-dd
          transportasi: 'Saudi Airlines',
          hotel: 'Bintang 5',
          category: 'Haji',
          harga: int.parse('45000000'),
          itinerary: "",
          jenis: "Trip"),
    ];
    paketList.addAll(initialdata);
  }

  void addPaket(Paket paket) {
    paketList.add(paket);
    paketList.refresh();
  }

  // Perbarui data
  void updatePaket(int index, Paket updatedPaket) {
    if (index < paketList.length) {
      paketList[index] = updatedPaket;
      paketList.refresh();
    }
  }

  // Hapus data
  void deletePaket(int index) {
    if (index < paketList.length) {
      paketList.removeAt(index);
      paketList.refresh();
    }
  }
}
