import 'package:e_ceran/global_assets/widgets/app_bar_widget.dart';
import 'package:e_ceran/global_assets/widgets/widget_text.dart';
import 'package:flutter/material.dart';

class TransactionDetailView extends StatelessWidget {
  final List<Map<String, dynamic>> purchasedItems;
  final int totalAmount;
  final int totalPrice;

  const TransactionDetailView({
    Key? key,
    required this.purchasedItems,
    required this.totalAmount,
    required this.totalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarFormat(
        styledAppBarTitle: 'E-Ceran Detail Transaksi',
        enabledBackButton: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: purchasedItems.length,
            itemBuilder: (context, index) {
              final item = purchasedItems[index];
              final stuffItem = item['item'];

              return ListTile(
                title: WidgetText(
                    text: '${index + 1} Barang: ${stuffItem.stuffName}'),
                subtitle: WidgetText(text: 'Jumlah: ${item['quantity']}'),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: WidgetText(text: 'Total Pembelian: Rp. $totalPrice'),
          ),
        ],
      ),
    );
  }
}
