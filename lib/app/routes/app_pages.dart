import 'package:get/get.dart';
import 'package:mobileapp/app/modules/home/views/home_view.dart';
import 'package:mobileapp/app/modules/gallery/views/gallery_view.dart';
import 'package:mobileapp/app/modules/login/views/login_view.dart';  // Halaman Login
import 'package:mobileapp/app/modules/signup/views/signup_view.dart'; // Halaman Signup

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;  // Jalur awal aplikasi (Home)

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
      page: () => LoginView(),  // Rute untuk halaman login
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => SignUpView(),  // Rute untuk halaman signup
    ),
  ];
}
