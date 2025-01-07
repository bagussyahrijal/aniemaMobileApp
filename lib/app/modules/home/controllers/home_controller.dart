import 'package:get/get.dart';
import 'package:mobileapp/app/services/paket_controller.dart';
import 'package:mobileapp/app/data/paket.dart';

class HomeController extends GetxController {
  final String asset = "assets/logo.png";
  final RxInt selectedIndexBottomBar = 0.obs;

  PaketController paketService = Get.find();

  var paket = <Paket>[].obs;

  void changePage(int index) {
    selectedIndexBottomBar.value = index;
  }

  Future<void> loadPaket() async {
    try {
      await paketService.fetchPaket();
      var allPaket = paketService.paketList;
      print("All paket fetched in HomeController: ${allPaket.length} items");

      paket.value = allPaket.take(3).toList();
      paket.refresh();
      print("First 3 paket: ${paket.length} items");
    } catch (e) {
      print("Error fetching paket: $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadPaket();
  }

  @override
  void onClose() {
    super.onClose();
    print('terdispose');
    Get.delete<HomeController>();
  }

  List<Paket> get firstThreePaket => paket.take(3).toList();
}
