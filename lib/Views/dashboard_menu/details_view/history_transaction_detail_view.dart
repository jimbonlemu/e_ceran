import 'package:e_ceran/global_assets/data/history_transaction_data.dart';
import 'package:e_ceran/global_assets/widgets/app_bar_widget.dart';
import 'package:e_ceran/global_assets/widgets/widget_text.dart';
import 'package:flutter/material.dart';

class HistoryTransactionDetailView extends StatelessWidget {
  final HistoryTransactionData historyTransactionData;
  const HistoryTransactionDetailView(
      {super.key, required this.historyTransactionData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarFormat(
        styledAppBarTitle: 'E-Ceran Detail Riwayat Transaksi',
        enabledBackButton: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WidgetText(
                  text:
                      'ID Transaksi : ${historyTransactionData.transactionID} '),
              WidgetText(
                  text: 'Nama Pembeli : ${historyTransactionData.customerName}'),
              WidgetText(
                  text: 'Barang :${historyTransactionData.transactionStuff} '),
              WidgetText(
                  text:
                      'Total Harga : ${historyTransactionData.transactionTotalPrice}'),
              WidgetText(
                  text:
                      'Tanggal Pembelian :${historyTransactionData.transactionDate} '),
            ],
          ),
        ),
      ),
    );
  }
}
