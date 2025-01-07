import 'package:get/get.dart';

import '../data/paket.dart';
import '../modules/admin/bindings/admin_binding.dart';
import '../modules/admin/views/admin_view.dart';
import '../modules/admin_gallery/bindings/admin_gallery_binding.dart';
import '../modules/admin_gallery/views/admin_gallery_view.dart';
import '../modules/admin_paket/bindings/admin_paket_binding.dart';
import '../modules/admin_paket/views/admin_paket_view.dart';
import '../modules/edit_paket/bindings/edit_paket_binding.dart';
import '../modules/edit_paket/views/edit_paket_view.dart';
import '../modules/gallery/views/gallery_view.dart';
import '../modules/haji_page/bindings/haji_page_binding.dart';
import '../modules/haji_page/views/haji_page_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/paketdetail/bindings/paketdetail_binding.dart';
import '../modules/paketdetail/views/paketdetail_view.dart';
import '../modules/profil/bindings/profil_binding.dart';
import '../modules/profil/views/profil_view.dart';
import '../modules/trip_page/bindings/trip_page_binding.dart';
import '../modules/trip_page/views/trip_page_view.dart';
import '../modules/umroh_page/bindings/umroh_page_binding.dart';
import '../modules/umroh_page/views/umroh_page_view.dart';

// ignore_for_file: constant_identifier_names

import 'package:mobileapp/app/modules/login/views/login_view.dart'; // Halaman Login
import 'package:mobileapp/app/modules/signup/views/signup_view.dart'; // Halaman Signup

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME; // Jalur awal aplikasi (Home)

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
    ),
    GetPage(
      name: Routes.GALLERY,
      page: () => GalleryView(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(), // Rute untuk halaman login
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => SignUpView(), // Rute untuk halaman signup
    ),
    GetPage(
        name: Routes.PROFILE,
        page: () => ProfilView(),
        binding: ProfilBinding() // Rute untuk halaman signup
        ),
    GetPage(
      name: Routes.PAKETDETAIL,
      page: () {
        // Mengambil argumen paket dari rute
        final paket = Get.arguments as Paket; // Cast argumen ke Paket
        return PaketdetailView(paket: paket); // Kirim sebagai parameter ke view
      },
      binding: PaketdetailBinding(),
    ),
    GetPage(
      name: Routes.UMROH_PAGE,
      page: () => UmrohPageView(),
      binding: UmrohPageBinding(),
    ),
    GetPage(
      name: Routes.HAJI_PAGE,
      page: () => HajiPageView(),
      binding: HajiPageBinding(),
    ),
    GetPage(
      name: Routes.TRIP_PAGE,
      page: () => TripPageView(),
      binding: TripPageBinding(),
    ),
    GetPage(
      name: Routes.ADMIN,
      page: () => const AdminView(),
      binding: AdminBinding(),
    ),
    GetPage(
      name: Routes.ADMIN_GALLERY,
      page: () => AdminGalleryView(),
      binding: AdminGalleryBinding(),
    ),
    GetPage(
      name: Routes.ADMIN_PAKET,
      page: () => AdminPaketView(),
      binding: AdminPaketBinding(),
    ),
    GetPage(
      name: Routes.EDIT_PAKET,
      page: () => EditPaketView(),
      binding: EditPaketBinding(),
    ),
  ];
}
