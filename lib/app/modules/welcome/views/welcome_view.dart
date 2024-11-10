// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/app/modules/home/views/home_view.dart';


class WelcomeView extends StatelessWidget {

const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Memulai delay navigasi setelah build pertama kali selesai
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 5), () {
        Get.off(HomeView());
      });
    });
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo.png', 
          width: 300,
          height: 300,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
