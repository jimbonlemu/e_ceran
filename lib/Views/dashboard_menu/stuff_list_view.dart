import 'package:draggable_fab/draggable_fab.dart';
import 'package:e_ceran/global_assets/images_path.dart';
import 'package:e_ceran/global_assets/navigates.dart';
import 'package:e_ceran/global_assets/widgets/app_bar_widget.dart';
import 'package:e_ceran/global_assets/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class StuffListView extends StatefulWidget {
  const StuffListView({Key? key}) : super(key: key);

  @override
  State<StuffListView> createState() => _StuffListViewState();
}

class _StuffListViewState extends State<StuffListView> {
  List<int> a = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  late List<bool> _isCheckedInList;

  @override
  void initState() {
    super.initState();
    _isCheckedInList = List<bool>.generate(a.length, (index) => false);
  }

  void _removeItemInList(index) {
    setState(() {
      a.removeAt(index);
      _isCheckedInList.removeAt(index);
    });
  }

  int _randomnumber() {
    int batasBawah = 10;
    int batasAtas = 100;
    Random random = Random();
    int angkaAcak = (random.nextInt((batasAtas - batasBawah + 1) ~/ 10) +
            batasBawah ~/ 10) *
        10;

    return angkaAcak;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarFormat(
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
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        leading: Image.asset(
                          ImagesPath.transactionIcon,
                          scale: 5,
                        ),
                        title: Text('Barang ke-  ${a[index]}'),
                        subtitle: Text('Jumlah barang :  ${_randomnumber()}'),
                        trailing: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  _removeItemInList(index);
                                },
                                icon: const Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () {
                                  _removeItemInList(index);
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: a.length,
              ),
            ),
          ],
        ),
        floatingActionButton: DraggableFab(
          child: FloatingActionButton(
            backgroundColor: Colors.yellow[700],
            tooltip: 'Tambah Barang',
            onPressed: () {},
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ));
  }
}
