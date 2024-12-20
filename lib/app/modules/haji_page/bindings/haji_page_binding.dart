import 'package:get/get.dart';

import '../controllers/haji_page_controller.dart';

class HajiPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HajiPageController>(
      () => HajiPageController(),
    );
  }
}
