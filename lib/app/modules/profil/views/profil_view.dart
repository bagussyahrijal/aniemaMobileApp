// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/app/controllers/auth_controller.dart';
import 'package:mobileapp/app/modules/profil/controllers/profil_controller.dart';
import 'package:mobileapp/app/routes/app_pages.dart';

class ProfilView extends GetView<ProfilController> {
  @override
  final ProfilController controller = Get.put(ProfilController());
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    // Gunakan controller yang sudah disediakan oleh GetView
    return Scaffold(
      backgroundColor: const Color(0xFF3C2A98),
      body: Center(
        child: authC.isLoggedIn.value
            ? _buildAfterLogin(context)
            : _buildBeforeLogin(context),
      ),
    );
  }

  Widget _buildBeforeLogin(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              // Login button
              ListTile(
                leading: Icon(Icons.login, color: Colors.black),
                title: Text("Login"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Get.toNamed(Routes.LOGIN); // Navigate to login page
                },
              ),
              Divider(height: 1),
              // SignUp button
              ListTile(
                leading: Icon(Icons.person_add, color: Colors.black),
                title: Text("SignUp"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Get.toNamed(Routes.SIGNUP); // Navigate to signup page
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAfterLogin(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              // Profile Icon
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.image,
                  size: 40,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              // User Info
              Obx(() {
                return Text(
                  authC.userName.value.isNotEmpty
                      ? authC.userName.value
                      : "Nama Pengguna",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                );
              }),
              Obx(() {
                return Text(
                  authC.emailC.value.isNotEmpty
                      ? authC.emailC.value
                      : "email@example.com",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                );
              }),
              SizedBox(height: 20),
              Divider(),              // Card for Profile Options
              // Edit Profile
              ListTile(
                leading: Icon(Icons.edit, color: Colors.black),
                title: Text("Edit Profile"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Get.toNamed("/edit-profile"); // Navigate to edit profile page
                },
              ),
              // Change Password
              ListTile(
                leading: Icon(Icons.lock, color: Colors.black),
                title: Text("Ganti Password"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Get.toNamed(
                      "/change-password"); // Navigate to change password page
                },
              ),
              // Logout
              ListTile(
                leading: Icon(Icons.logout, color: Colors.black),
                title: Text("Logout"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  authC.logout();
                  Get.offAllNamed(Routes.HOME); // Call the logout function in the controller
                },
              ),

            ],
          ),
        ),
      ],
    );
  }
}
