import 'package:get/get.dart';
import 'package:mobileapp/app/modules/Login/controllers/login_controller.dart';
import 'package:mobileapp/app/modules/SignUp/controllers/signup_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(LoginController());
    Get.put(SignUpController());    
  }
}
