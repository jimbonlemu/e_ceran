import 'package:e_ceran/global_assets/images_path.dart';
import 'package:e_ceran/global_assets/widgets/widget_menu.dart';
import 'package:flutter/material.dart';
import '../global_assets/widgets/app_bar_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarFormat(
          styledAppBarTitle: 'E-Ceran Dashboard',
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  WidgetMenu(
                    text: 'Transaksi',
                    menuIcon: Image.asset(
                      ImagesPath.transactionIcon,
                      scale: 5,
                    ),
                  ),
                  WidgetMenu(
                    text: 'Data Barang',
                    menuIcon: Image.asset(
                      ImagesPath.stuffListIcon,
                      scale: 5,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              WidgetMenu(
                text: 'Riwayat Transaksi',
                menuIcon: Image.asset(
                  ImagesPath.historyTransactionIcon,
                  scale: 5,
                ),
              )
            ],
          ),
        ));
  }
}
