import 'package:get/get.dart';

import '../controllers/trip_page_controller.dart';

class TripPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TripPageController>(
      () => TripPageController(),
    );
  }
}
