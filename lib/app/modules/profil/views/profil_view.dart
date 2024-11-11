import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/app/modules/profil/controllers/profil_controller.dart';
import 'package:mobileapp/app/routes/app_pages.dart';

class ProfilView extends GetView<ProfilController> {
  // Daftarkan controller dengan Get.put()
  final ProfilController controller = Get.put(ProfilController());

  @override
  Widget build(BuildContext context) {
    // Gunakan controller yang sudah disediakan oleh GetView
    bool isLoggedIn = controller.isLoggedIn.value;

    return Scaffold(
      backgroundColor: const Color(0xFF3C2A98), // Purple background
      body: Center(
        child:
            isLoggedIn ? _buildAfterLogin(context) : _buildBeforeLogin(context),
      ),
    );
  }

  Widget _buildBeforeLogin(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
        // Username placeholder
        Text(
          "Nama Pengguna",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          "-",
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 20),
        // Card for Login and SignUp
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
            controller.username.value.isNotEmpty
                ? controller.username.value
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
            controller.email.value.isNotEmpty
                ? controller.email.value
                : "email@example.com",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          );
        }),
        Obx(() {
          return Text(
            controller.phoneNumber.value.isNotEmpty
                ? controller.phoneNumber.value
                : "No. Telepon",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          );
        }),
        SizedBox(height: 20),
        // Card for Profile Options
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
              // Edit Profile
              ListTile(
                leading: Icon(Icons.edit, color: Colors.black),
                title: Text("Edit Profile"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Get.toNamed("/edit-profile"); // Navigate to edit profile page
                },
              ),
              Divider(height: 1),
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
              Divider(height: 1),
              // Logout
              ListTile(
                leading: Icon(Icons.logout, color: Colors.black),
                title: Text("Logout"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  controller
                      .logout(); // Call the logout function in the controller
                },
              ),
              Divider(height: 1),
              // Delete Account
              ListTile(
                leading: Icon(Icons.delete, color: Colors.red),
                title: Text(
                  "Hapus Akun",
                  style: TextStyle(color: Colors.red),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  controller
                      .deleteAccount(); // Call the delete account function in the controller
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
