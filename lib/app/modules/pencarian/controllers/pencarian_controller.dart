import 'package:get/get.dart';
import 'package:mobileapp/app/data/paket.dart';
import 'package:mobileapp/app/services/paket_service.dart'; 

class PencarianController extends GetxController {
  var paket = <Paket>[].obs;  // List of all packages
  var selectedFilter = 'All'.obs; // Selected filter value

  @override
  void onInit() {
    super.onInit();
    fetchPaket();
  }

  // Fetch the paket list from PaketService
  void fetchPaket() async {
    var fetchedPaket = await PaketService().fetchPaket();
    paket.value = fetchedPaket;
  }

  // Getter to filter the paket list based on the selected category
  List<Paket> get filteredPaket {
    if (selectedFilter.value == 'All') {
      return paket;
    } else {
      // Filter based on the selected category
      return paket.where((paket) {
        return paket.category == selectedFilter.value;
      }).toList();
    }
  }
}
