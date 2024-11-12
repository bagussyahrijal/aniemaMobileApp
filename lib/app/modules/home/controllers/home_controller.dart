import 'package:get/get.dart';
import 'package:mobileapp/app/services/paket_service.dart';
import 'package:mobileapp/app/data/paket.dart';

class HomeController extends GetxController {
  final String asset = "assets/logo.png";
  final RxInt selectedIndexBottomBar = 0.obs;

  // Use GetX dependency injection to initialize the service
  final PaketService paketService = PaketService();

  // Observable list of paket
  var paket = <Paket>[].obs;

  // Method to change the bottom navigation index
  void changePage(int index) {
    selectedIndexBottomBar.value = index;
  }

  // Fetch the first 3 packages from the service
  Future<void> loadPaket() async {
    try {
      // Fetch all packages from the service
      var allPaket = await paketService.fetchPaket();

      // Update the paket list with the first 3 packages
      paket.value = allPaket.take(3).toList(); // Only take the first 3
    } catch (e) {
      print("Error fetching paket: $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadPaket(); 
  }

  // Getter for paket list
  List<Paket> get firstThreePaket => paket.take(3).toList();
}
