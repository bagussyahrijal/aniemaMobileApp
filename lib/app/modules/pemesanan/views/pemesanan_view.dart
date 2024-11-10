import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mobileapp/app/modules/pemesanan/controllers/pemesanan_controller.dart';

class PemesananView extends GetView<PemesananController>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Pemesanan Page"),
    );
  }
  
}