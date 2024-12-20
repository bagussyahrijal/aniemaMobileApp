import 'package:get/get.dart';
import 'package:mobileapp/app/data/paket.dart';
import 'package:mobileapp/app/services/paket_controller.dart';

class PencarianController extends GetxController {
  PaketController paketC = Get.find();

  var paket = <Paket>[].obs; // List of all packages
  var selectedFilter = 'All'.obs; // Selected filter value

  @override
  void onInit() async {
    super.onInit();
    await fetchPaket();
    print(paket);
  }

  // Fetch the paket list from PaketService
  Future<void> fetchPaket() async {
    paket.value = paketC.paketList;
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

  List<Paket> get filteredPaketUmroh {
    return paket.where((paket) {
      return paket.category == 'Umroh';
    }).toList();
  }
  List<Paket> get filteredPaketHaji {
    return paket.where((paket) {
      return paket.category == 'Haji';
    }).toList();
  }
  List<Paket> get filteredPaketTrip {
    return paket.where((paket) {
      return paket.category == 'Trip';
    }).toList();
  }
}
