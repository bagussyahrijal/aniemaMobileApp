import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/app/modules/edit_profile/controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  @override
  final EditProfileController controller = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    TextEditingController _userNameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profil'),
        backgroundColor: Color(0xFF3C2A98),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),

            // Nama Pengguna
            Obx(() {
              _userNameController.text = controller.userName.value; // Update controller text
              return TextField(
                controller: _userNameController, // Use this controller to sync with UI
                decoration: InputDecoration(
                  labelText: 'Nama Pengguna',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  controller.userName.value = value; // Update controller's value
                },
              );
            }),

            SizedBox(height: 20),

            // Tombol Simpan
            ElevatedButton(
              onPressed: () {
                controller.updateUserName(controller.userName.value);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3C2A98),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text('Simpan Perubahan'),
            ),
          ],
        ),
      ),
    );
  }
}
