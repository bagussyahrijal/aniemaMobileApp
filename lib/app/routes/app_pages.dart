import 'package:get/get.dart';

import '../modules/gallery/views/gallery_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/paketdetail/bindings/paketdetail_binding.dart';
import '../modules/paketdetail/views/paketdetail_view.dart';

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
      name: Routes.PAKETDETAIL,
      page: () => const PaketdetailView(),
      binding: PaketdetailBinding(),
    ),
  ];
}
