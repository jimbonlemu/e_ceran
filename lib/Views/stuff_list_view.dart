import 'package:e_ceran/global_assets/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class StuffListView extends StatelessWidget {
  const StuffListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarFormat(
      styledAppBarTitle: 'E-Ceran Data Barang',
      enabledBackButton: true,
    ));
  }
}
