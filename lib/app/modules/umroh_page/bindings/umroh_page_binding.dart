import 'package:get/get.dart';

import '../controllers/umroh_page_controller.dart';

class UmrohPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UmrohPageController>(
      () => UmrohPageController(),
    );
  }
}
