// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/app/modules/Login/controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Get.back(); // Go back to the previous page
          },
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // App logo or title
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/logo.png', // Replace with your logo path
                    height: 80,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Amanah dan Profesional",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            // Email input field
            Obx(() => TextField(
              controller: controller.emailController,
              onChanged: controller.validateEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email atau Nomor HP",
                border: OutlineInputBorder(),
                errorText: controller.isEmailValid.value ? null : "Invalid email",
                prefixIcon: Icon(Icons.email),
              ),
            )),
            SizedBox(height: 20),

            // Password input field
            Obx(() => TextField(
              controller: controller.passwordController,
              onChanged: controller.validatePassword,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
                errorText: controller.isPasswordValid.value ? null : "Password must be at least 6 characters",
                prefixIcon: Icon(Icons.lock),
              ),
            )),
            SizedBox(height: 10),

            // Forgot password
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Navigate to forgot password page
                  // Misalnya: Get.toNamed('/forgot-password');
                },
                child: Text(
                  "Lupa Password?",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Login button
            Obx(() => ElevatedButton(
              onPressed: controller.isLoading.value ? null : controller.login,
              child: controller.isLoading.value
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text("LOGIN"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
                backgroundColor: Colors.blue,
              ),
            )),

            SizedBox(height: 10),

            Center(
              child: TextButton(
                onPressed: () {
                  // Navigate to signup page
                  Get.toNamed('/signup');
                },
                child: Text.rich(
                  TextSpan(
                    text: "Belum mempunyai akun? ",
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "Daftar",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
