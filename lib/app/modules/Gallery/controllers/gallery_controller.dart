import 'package:get/get.dart';

class GalleryController extends GetxController {
  // List contoh data gallery
  final galleryItems = [
    {"title": "Dokumentasi Explore Ciwidey", "image": "ciwidey.jpg"},
    {"title": "Dokumentasi Umrah", "image": "umrah.jpg"},
    {"title": "Dokumentasi Umrah Akhir Tahun", "image": "umrah_akhir_tahun.jpg"},
    {"title": "Dokumentasi RAT Koperasi Barokah", "image": "koperasi_barokah.jpg"},
  ].obs;

  // Method untuk menambah item gallery
  void addGalleryItem(Map<String, String> item) {
    galleryItems.add(item);
  }
}
