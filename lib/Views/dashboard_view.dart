import 'package:e_ceran/global_assets/images_path.dart';
import 'package:e_ceran/global_assets/navigates.dart';
import 'package:e_ceran/global_assets/widgets/widget_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../global_assets/widgets/app_bar_widget.dart';
import '../global_assets/widgets/widget_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const WidgetText(text: 'Konfirmasi'),
            content: const WidgetText(text: 'Apakah Anda yakin ingin keluar?'),
            actions: [
              TextButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: const WidgetText(
                  text: 'Ya',
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const WidgetText(
                  text: 'Tidak',
                ),
              ),
            ],
          ),
        );
      },
      child: Scaffold(
          appBar: const AppBarFormat(
            styledAppBarTitle: 'E-Ceran Dashboard',
          ),
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        WidgetMenu(
                          targetRoute: Navigates.transactionView,
                          text: 'Transaksi',
                          menuIcon: Image.asset(
                            ImagesPath.transactionIcon,
                            scale: 5,
                          ),
                        ),
                        WidgetMenu(
                          targetRoute: Navigates.stuffListView,
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
                      targetRoute: Navigates.historyTransactionView,
                      text: 'Riwayat Transaksi',
                      menuIcon: Image.asset(
                        ImagesPath.historyTransactionIcon,
                        scale: 5,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
