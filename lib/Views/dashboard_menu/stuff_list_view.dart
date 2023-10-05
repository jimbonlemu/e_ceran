import 'package:e_ceran/global_assets/images_path.dart';
import 'package:e_ceran/global_assets/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class StuffListView extends StatelessWidget {
  const StuffListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List a = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    return Scaffold(
      appBar: AppBarFormat(
        styledAppBarTitle: 'E-Ceran Data Barang',
        enabledBackButton: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari Barang',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                        backgroundImage: AssetImage(ImagesPath.stuffListIcon)),
                    title: Text('Barang ke ${a[index]}'),
                    subtitle: Text('Jumlah Barang : ${a[index]}'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete),
                    ),
                  ),
                );
              },
              itemCount: a.length,
            ),
          ),
        ],
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          print('Tambah Barang');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
