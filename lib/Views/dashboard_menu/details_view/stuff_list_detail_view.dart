import 'package:e_ceran/global_assets/data/stuff_data.dart';
import 'package:e_ceran/global_assets/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

import '../../../global_assets/widgets/widget_text.dart';

class StuffListDetailView extends StatelessWidget {
  final StuffData stuffData;
  const StuffListDetailView({super.key, required this.stuffData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarFormat(
        styledAppBarTitle: 'E-Ceran Detail Barang',
        enabledBackButton: true,
      ),
      body: Center(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              stuffData.stuffImage,
              height: 300,
              width: 300,
            ),
            WidgetText(
              text: 'Kode Barang : ${stuffData.stuffID}',
            ),
            WidgetText(
              text: 'Nama Barang : ${stuffData.stuffName}',
            ),
            WidgetText(
              text: 'Harga Barang : ${stuffData.stuffPrice}',
            ),
            WidgetText(
              text: 'Stok Barang : ${stuffData.stuffStock}',
            ),
          ],
        ),
      ),
    );
  }
}
