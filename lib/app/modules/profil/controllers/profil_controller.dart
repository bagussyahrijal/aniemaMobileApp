import 'package:get/get.dart';

class ProfilController extends GetxController {
  // Pastikan variabel ini di-observe dengan .obs
  Rx<String> username = ''.obs;
  Rx<String> email = ''.obs;
  Rx<String> phoneNumber = ''.obs;
  RxBool isLoggedIn = false.obs;

  // Misalnya, Anda bisa menambahkan metode untuk login atau inisialisasi data pengguna
  void login(String user, String mail, String phone) {
    username.value = user;
    email.value = mail;
    phoneNumber.value = phone;
    isLoggedIn.value = true;
  }

  // Fungsi logout
  void logout() {
    username.value = '';
    email.value = '';
    phoneNumber.value = '';
    isLoggedIn.value = false;
  }

  // Fungsi untuk menghapus akun
  void deleteAccount() {
    // Logika penghapusan akun
    username.value = '';
    email.value = '';
    phoneNumber.value = '';
  }
}
