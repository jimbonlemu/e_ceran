import 'package:draggable_fab/draggable_fab.dart';
import 'package:e_ceran/Views/dashboard_menu/details_view/stuff_list_detail_view.dart';
import 'package:e_ceran/global_assets/data/stuff_data.dart';
import 'package:e_ceran/global_assets/widgets/app_bar_widget.dart';
import 'package:e_ceran/global_assets/widgets/widget_text.dart';
import 'package:flutter/material.dart';

class StuffListView extends StatefulWidget {
  const StuffListView({Key? key}) : super(key: key);

  @override
  State<StuffListView> createState() => _StuffListViewState();
}

class _StuffListViewState extends State<StuffListView> {
  TextEditingController searchController = TextEditingController();
  List<StuffData> searchResults = [];

  @override
  void initState() {
    super.initState();
    searchResults.addAll(staticStuffList);
  }

  void _removeItemInList(index) {
    setState(() {
      staticStuffList.removeAt(index);
      searchResults.removeAt(index);
    });
  }

  void _performSearch(String query) {
    searchResults.clear();
    if (query.isEmpty) {
      setState(() {
        searchResults.addAll(staticStuffList);
      });
    } else {
      final lowercaseQuery = query.toLowerCase();
      setState(() {
        searchResults.addAll(staticStuffList.where((item) {
          return item.stuffName.toLowerCase().contains(lowercaseQuery);
        }));
      });
    }
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
              controller: searchController,
              onChanged: (value) {
                _performSearch(value);
              },
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
            child: SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  final item = searchResults[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        leading: Image.asset(
                          item.stuffImage,
                          scale: 5,
                        ),
                        title: WidgetText(
                            text:
                                ' Id Barang : [${item.stuffID}] , Nama Barang : ${item.stuffName}'),
                        subtitle: WidgetText(
                            styleType: 'regular',
                            text:
                                'Jumlah barang: ${item.stuffStock}, Harga Barang : Rp. ${item.stuffPrice}'),
                        trailing: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Flexible(
                                child: IconButton(
                                  tooltip: 'Ubah Barang',
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit),
                                ),
                              ),
                              Flexible(
                                child: IconButton(
                                  tooltip: 'Hapus Barang',
                                  onPressed: () {
                                    _removeItemInList(index);
                                  },
                                  icon: const Icon(Icons.delete),
                                ),
                              ),
                              Flexible(
                                child: IconButton(
                                  tooltip: 'Lihat Detail Barang',
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return StuffListDetailView(
                                            stuffData: item);
                                      },
                                    ));
                                  },
                                  icon:
                                      const Icon(Icons.my_library_books_sharp),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: searchResults.length,
              ),
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
      ),
    );
  }
}
