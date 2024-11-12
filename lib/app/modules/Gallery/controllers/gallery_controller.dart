import 'package:get/get.dart';

class GalleryController extends GetxController {
  // List contoh data gallery
  final galleryItems = [
    {"title": "Dokumentasi Explore Ciwidey", "image": "assets/ciwidey.jpg"},
    {"title": "Dokumentasi Umrah", "image": "assets/umrah.jpg"},
    {"title": "Dokumentasi Umrah Akhir Tahun", "image": "assets/akhir.jpg"},
    {"title": "Dokumentasi RAT Koperasi Barokah", "image": "assets/rat.jpg"},
  ].obs;

  // Method untuk menambah item gallery
  void addGalleryItem(Map<String, String> item) {
    galleryItems.add(item);
  }
}
