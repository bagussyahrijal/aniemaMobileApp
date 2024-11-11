import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/app/modules/SignUp/controllers/signup_controller.dart';

class SignUpView extends StatelessWidget {
  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Sign Up"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Image.asset(
                "assets/logo.png", // Ganti dengan path logo yang sesuai
                height: 100,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: controller.nameController,
              onChanged: controller.validateName,
              decoration: InputDecoration(
                labelText: "Nama Lengkap",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
                errorText: controller.isNameValid.value ? null : "Nama tidak boleh kosong",
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: controller.emailController,
              onChanged: controller.validateEmail,
              decoration: InputDecoration(
                labelText: "Email Aktif",
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
                errorText: controller.isEmailValid.value ? null : "Email tidak valid",
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: controller.passwordController,
              onChanged: controller.validatePassword,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
                errorText: controller.isPasswordValid.value ? null : "Password minimal 6 karakter",
              ),
            ),
            SizedBox(height: 20),
            Obx(() => ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () {
                          controller.signUp();
                        },
                  child: controller.isLoading.value
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text("SIGN UP"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                )),
            SizedBox(height: 10),
            Center(
              child: GestureDetector(
                onTap: () => Get.toNamed("/login"),
                child: Text(
                  "Sudah mempunyai akun? Masuk",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
