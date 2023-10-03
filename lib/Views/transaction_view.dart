import 'package:e_ceran/global_assets/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TransactionView extends StatelessWidget {
  const TransactionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFormat(
        styledAppBarTitle: 'E-Ceran Transaksi',
        enabledBackButton: true,
      ),
    );
  }
}
