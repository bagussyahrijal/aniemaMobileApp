import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mobileapp/app/modules/transaksi/controllers/transaksi_controller.dart';

class TransaksiView extends GetView<TransaksiController>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Transaksi Page"),
    );
  }
  
}