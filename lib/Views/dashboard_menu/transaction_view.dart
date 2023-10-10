import 'package:e_ceran/Views/dashboard_menu/details_view/transaction_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:e_ceran/global_assets/data/stuff_data.dart';
import 'package:e_ceran/global_assets/widgets/app_bar_widget.dart';
import 'package:e_ceran/global_assets/widgets/widget_text.dart';

class TransactionView extends StatefulWidget {
  const TransactionView({Key? key}) : super(key: key);

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
  List<int> quantities = [];
  List<Map<String, dynamic>> purchasedItems = [];
  List<StuffData> filteredStuffList = staticStuffList;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    quantities = List.filled(staticStuffList.length, 0);
  }

  int getTotalItemCount() {
    int total = 0;
    for (int i = 0; i < staticStuffList.length; i++) {
      total += quantities[i];
    }
    return total;
  }

  int totalPrice() {
    int total = 0;
    for (int i = 0; i < staticStuffList.length; i++) {
      total += quantities[i] * staticStuffList[i].stuffPrice;
    }
    return total;
  }

  void searchStuff(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredStuffList = staticStuffList;
      } else {
        filteredStuffList = staticStuffList
            .where((stuff) =>
                stuff.stuffName.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarFormat(
        styledAppBarTitle: 'E-Ceran Transaksi',
        enabledBackButton: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: searchController,
              onChanged: (query) {
                searchStuff(query);
              },
              decoration: InputDecoration(
                hintText: 'Cari Produk',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  final item = filteredStuffList[index];
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: ListTile(
                            titleAlignment: ListTileTitleAlignment.center,
                            leading: const Icon(
                              Icons.history,
                              size: 30,
                              color: Colors.black,
                            ),
                            title: WidgetText(
                              text: 'Nama Produk - ${item.stuffName}',
                              styleType: 'bold',
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 2,
                                ),
                                WidgetText(
                                  text: 'Stok : ${item.stuffStock} ',
                                  styleType: 'regular',
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                WidgetText(
                                  text: 'Harga Produk : ${item.stuffPrice}',
                                  styleType: 'regular',
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      if (quantities[index] > 0) {
                                        quantities[index]--;
                                        item.stuffStock++;
                                      }
                                    });
                                  },
                                ),
                                Text(quantities[index].toString()),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      if (item.stuffStock > 0) {
                                        quantities[index]++;
                                        item.stuffStock--;
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                            onTap: () {},
                          ),
                        ),
                      ),
                    ],
                  );
                },
                itemCount: filteredStuffList.length,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2 / 2.5,
                color: Colors.yellow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2 / 2,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.shopping_bag),
                          WidgetText(
                            text: 'Total item : ${getTotalItemCount()}',
                            styleType: 'bold',
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        purchasedItems.clear();
                        if (getTotalItemCount() == 0) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const WidgetText(
                                  text: 'Peringatan',
                                  styleType: 'bold',
                                ),
                                content: const WidgetText(
                                  text: 'Anda belum memilih barang',
                                  styleType: 'regular',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(false);
                                    },
                                    child: const WidgetText(
                                      text: 'Tutup',
                                      styleType: 'bold',
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          for (int i = 0; i < staticStuffList.length; i++) {
                            if (quantities[i] > 0) {
                              purchasedItems.add({
                                'item': staticStuffList[i],
                                'quantity': quantities[i],
                              });
                            }
                          }
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return TransactionDetailView(
                                purchasedItems: purchasedItems,
                                totalAmount: getTotalItemCount(),
                                totalPrice: totalPrice(),
                              );
                            },
                          ));
                        }
                      },
                      child: Container(
                        color: Colors.amber,
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.2 / 2,
                        child: const WidgetText(
                          text: 'Konfirmasi Pembelian',
                          color: Colors.black,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
