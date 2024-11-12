// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/app/controllers/auth_controller.dart';
import 'package:mobileapp/app/modules/home/bindings/home_binding.dart';
import 'package:mobileapp/app/routes/app_pages.dart';
import 'package:mobileapp/app/utils/loading_view.dart';
import 'app/modules/welcome/views/welcome_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

final authC = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authC.streamAuthStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active){
          print(snapshot.data);

        return GetMaterialApp(
          home: WelcomeView(),
          debugShowCheckedModeBanner: false,
          initialBinding: HomeBinding(),
          getPages: AppPages.routes,
        );
        }
        return LoadingView();
      }
    );
  }
}
