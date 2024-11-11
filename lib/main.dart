import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mobileapp/app/modules/home/bindings/home_binding.dart';
import 'app/modules/welcome/views/welcome_view.dart';
import 'app/modules/gallery/views/gallery_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: WelcomeView(),
      debugShowCheckedModeBanner: false,
      initialBinding: HomeBinding(),
      getPages: [
        // Mendefinisikan halaman rute
        GetPage(name: '/gallery', page: () => GalleryView()),
      ],
    );
  }
}
