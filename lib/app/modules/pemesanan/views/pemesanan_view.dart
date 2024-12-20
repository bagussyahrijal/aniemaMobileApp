// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/app/controllers/auth_controller.dart';
import 'package:mobileapp/app/modules/pemesanan/controllers/pemesanan_controller.dart';

class PemesananView extends StatelessWidget {
  final PemesananController pemesananController =
      Get.put(PemesananController());
  final AuthController authC = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => authC.isLoggedIn.value
          ? Scaffold(
              appBar: AppBar(title: Text('Pemesanan Saya')),
              body: Column(
                children: [
                  Obx(() {
                    return Expanded(
                      child: pemesananController.pemesananItems.isEmpty
                          ? Center(child: Text("Belum ada item"))
                          : ListView.builder(
                              itemCount:
                                  pemesananController.pemesananItems.length,
                              itemBuilder: (context, index) {
                                final item =
                                    pemesananController.pemesananItems[index];
                                return Card(
                                  child: ListTile(
                                    leading: Checkbox(
                                      value: pemesananController.selectedItems
                                          .contains(item),
                                      onChanged: (value) => pemesananController
                                          .toggleSelection(item),
                                    ),
                                    title: Text(
                                        item['name'] ?? 'Nama tidak tersedia'),
                                    subtitle: Text('IDR ${item['price'] ?? 0}'),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.remove),
                                          onPressed: () => pemesananController
                                              .decrementQuantity(item),
                                        ),
                                        Text(item['quantity'].toString()),
                                        IconButton(
                                          icon: Icon(Icons.add),
                                          onPressed: () => pemesananController
                                              .incrementQuantity(item),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.delete),
                                          onPressed: () async {
                                            bool? confirmDelete =
                                                await showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: Text("Konfirmasi Hapus"),
                                                content: Text(
                                                    "Apakah Anda yakin ingin menghapus item ini?"),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.of(context)
                                                            .pop(false),
                                                    child: Text("Batal"),
                                                  ),
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.of(context)
                                                            .pop(true),
                                                    child: Text("Hapus"),
                                                  ),
                                                ],
                                              ),
                                            );
                                            if (confirmDelete == true) {
                                              pemesananController.pemesananItems
                                                  .remove(item);
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                    );
                  }),
                  Obx(() {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value:
                                    pemesananController.selectedItems.length ==
                                            pemesananController
                                                .pemesananItems.length &&
                                        pemesananController
                                            .pemesananItems.isNotEmpty,
                                onChanged: (value) => value == true
                                    ? pemesananController.selectAllItems()
                                    : pemesananController.clearSelectedItems(),
                              ),
                              Text('Pilih semua'),
                              Spacer(),
                              Text(
                                  'Total: IDR ${pemesananController.totalPrice}'),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: pemesananController.selectedItems.isEmpty
                                ? null
                                : () {
                                    // Handle checkout process here
                                  },
                            child: Text(
                                'Checkout (${pemesananController.selectedItems.length})'),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ))
          : Center(
              child: Text("Silahkan Login Terlebih Dahulu"),
            ),
    );
  }
}
