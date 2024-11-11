import 'package:get/get.dart';

class PemesananController extends GetxController {
  // Daftar item dalam pemesanan dimulai dengan kosong
  var pemesananItems = <Map<String, dynamic>>[].obs;

  // Total harga dari item yang dipilih
  var selectedItems = <Map<String, dynamic>>[].obs;

  // Menghitung total harga
  int get totalPrice => selectedItems.fold(0, (sum, item) => sum + (item['price'] as int) * (item['quantity'] as int));

  // Memilih atau menghapus item dari seleksi
  void toggleSelection(Map<String, dynamic> item) {
    if (selectedItems.contains(item)) {
      selectedItems.remove(item);
    } else {
      selectedItems.add(item);
    }
  }

  // Menambah jumlah item
  void incrementQuantity(Map<String, dynamic> item) {
    item['quantity']++;
    pemesananItems.refresh();
  }

  // Mengurangi jumlah item
  void decrementQuantity(Map<String, dynamic> item) {
    if (item['quantity'] > 1) {
      item['quantity']--;
      pemesananItems.refresh();
    }
  }

  // Pilih semua item
  void selectAllItems() {
    selectedItems.clear();
    selectedItems.addAll(pemesananItems);
  }

  // Hapus semua item yang dipilih
  void clearSelectedItems() {
    selectedItems.clear();
  }
}
