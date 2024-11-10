import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mobileapp/app/modules/pencarian/controllers/pencarian_controller.dart';

class PencarianView extends GetView<PencarianController>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Pencarian Page"),
    );
  }
  
}