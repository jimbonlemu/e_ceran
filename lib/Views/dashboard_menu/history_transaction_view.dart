import 'package:e_ceran/Views/dashboard_menu/details_view/history_transaction_detail_view.dart';
import 'package:e_ceran/global_assets/data/history_transaction_data.dart';
import 'package:e_ceran/global_assets/widgets/app_bar_widget.dart';
import 'package:e_ceran/global_assets/widgets/widget_text.dart';
import 'package:flutter/material.dart';

class HistoryTransactionView extends StatefulWidget {
  const HistoryTransactionView({Key? key}) : super(key: key);

  @override
  State<HistoryTransactionView> createState() => _HistoryTransactionViewState();
}

class _HistoryTransactionViewState extends State<HistoryTransactionView> {
  TextEditingController searchController = TextEditingController();
  List<HistoryTransactionData> filteredHistoryList = [];

  @override
  void initState() {
    super.initState();
    filteredHistoryList = staticHistoryTransactionData;
    searchController.addListener(() {
      _filterHistoryList(searchController.text);
    });
  }

  void _filterHistoryList(String query) {
    setState(() {
      filteredHistoryList = staticHistoryTransactionData.where((transaction) {
        final customerName = transaction.customerName.toLowerCase();
        return customerName.contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarFormat(
        styledAppBarTitle: 'E-Ceran Riwayat Transaksi',
        enabledBackButton: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Cari Riwayat Pembelian',
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
                  final historyList = filteredHistoryList[index];
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Card(
                        child: ListTile(
                      titleAlignment: ListTileTitleAlignment.center,
                      leading: const Icon(
                        Icons.history,
                        size: 30,
                        color: Colors.black,
                      ),
                      title: WidgetText(
                        text: 'Nama Pembeli : ${historyList.customerName}',
                        styleType: 'bold',
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 2,
                          ),
                          WidgetText(
                            text: ' ID Transaksi ${historyList.transactionID}',
                            styleType: 'regular',
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          WidgetText(
                            text:
                                'Tanggal Pembelian : ${historyList.transactionDate}',
                            styleType: 'regular',
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          WidgetText(
                            text:
                                'Total Pembelian : ${historyList.transactionTotalPrice}',
                            styleType: 'regular',
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return HistoryTransactionDetailView(
                                  historyTransactionData: historyList);
                            },
                          ));
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Color.fromARGB(255, 187, 136, 7),
                        ),
                        tooltip: 'Lihat Detail',
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return HistoryTransactionDetailView(
                                historyTransactionData: historyList);
                          },
                        ));
                      },
                    )),
                  );
                },
                itemCount: filteredHistoryList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
