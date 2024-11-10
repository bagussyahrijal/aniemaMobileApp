import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mobileapp/app/modules/profil/controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Profil Page"),
    );
  }
  
}